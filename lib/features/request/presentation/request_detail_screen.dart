import 'package:flutter/material.dart';
import 'package:hayatuk/core/blood/blood_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/features/request/data/models/blood_request.dart';
import 'package:hayatuk/features/request/presentation/request_providers.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

class RequestDetailScreen extends ConsumerWidget {
  final String requestId;

  const RequestDetailScreen({super.key, required this.requestId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final detail = ref.watch(requestDetailProvider(requestId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.requestDetailTitle)),
      body: detail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(e.toString()),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () =>
                      ref.invalidate(requestDetailProvider(requestId)),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (request) => _RequestDetailBody(request: request),
      ),
    );
  }
}

class _RequestDetailBody extends ConsumerWidget {
  final BloodRequest request;

  const _RequestDetailBody({required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentUserId = ref.watch(userControllerProvider).user?.id;
    final isOwn = currentUserId == request.requesterId;
    final canAccept = !isOwn && request.status == 'searching';

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                bloodTypeLabel(request.bloodType),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.notes ?? l10n.bloodRequest,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(_statusLabel(l10n, request.status)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        _InfoRow(
          icon: Icons.people_outline,
          label: l10n.donors,
          value: '${request.unitsAccepted}/${request.unitsNeeded}',
        ),
        const SizedBox(height: 12),
        _InfoRow(
          icon: Icons.location_on_outlined,
          label: l10n.locationLabel,
          value:
              '${request.lat.toStringAsFixed(4)}, ${request.lng.toStringAsFixed(4)}',
        ),
        const SizedBox(height: 32),
        if (canAccept)
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _accept(context, ref),
              child: Text(l10n.acceptRequest),
            ),
          ),
        if (isOwn)
          Text(
            l10n.yourOwnRequest,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }

  Future<void> _accept(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.acceptRequestConfirmTitle),
        content: Text(l10n.acceptRequestConfirmContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.accept),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final success = await ref
        .read(nearbyRequestsControllerProvider.notifier)
        .accept(request.id);

    if (!context.mounted) return;

    if (success) {
      // Refresh data in background
      ref.read(acceptancesControllerProvider.notifier).fetch();
      ref.invalidate(requestDetailProvider(request.id));

      await _showNextStepsDialog(context);
      if (!context.mounted) return;
      context.go('/donations');
    } else {
      final error = ref.read(nearbyRequestsControllerProvider).error;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error ?? l10n.acceptFailed)));
    }
  }

  Future<void> _showNextStepsDialog(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        icon: const Icon(Icons.bloodtype, color: Colors.red, size: 48),
        title: Text(l10n.acceptSuccessTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.acceptSuccessLead),
            const SizedBox(height: 16),
            _StepRow(number: '1', text: l10n.acceptStep1),
            const SizedBox(height: 12),
            _StepRow(number: '2', text: l10n.acceptStep2),
            const SizedBox(height: 12),
            _StepRow(number: '3', text: l10n.acceptStep3),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(l10n.gotIt),
          ),
        ],
      ),
    );
  }

  String _statusLabel(AppLocalizations l10n, String status) {
    return switch (status) {
      'searching' => l10n.statusSearching,
      'in_progress' => l10n.statusInProgress,
      'fulfilled' => l10n.statusFulfilled,
      'cancelled' => l10n.statusCancelled,
      'unfulfilled' => l10n.statusUnfulfilled,
      _ => status,
    };
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.onSurfaceVariant),
        const SizedBox(width: 12),
        Text(label),
        const Spacer(),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  final String number;
  final String text;

  const _StepRow({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text)),
      ],
    );
  }
}
