import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/core/utils/date_format.dart';
import 'package:hayatuk/features/donation/presentation/donation_providers.dart';
import 'package:hayatuk/features/request/data/models/accepted_request.dart';
import 'package:hayatuk/features/request/presentation/request_providers.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationsScreen extends ConsumerStatefulWidget {
  const DonationsScreen({super.key});

  @override
  ConsumerState<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends ConsumerState<DonationsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(acceptancesControllerProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(acceptancesControllerProvider);

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () =>
              ref.read(acceptancesControllerProvider.notifier).fetch(),
          child: _buildBody(l10n, state),
        ),
      ),
    );
  }

  Widget _buildBody(AppLocalizations l10n, AcceptancesState state) {
    if (state.isLoading && state.requests.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.requests.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.error!),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () =>
                    ref.read(acceptancesControllerProvider.notifier).fetch(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      );
    }

    if (state.requests.isEmpty) {
      return ListView(
        children: [
          const SizedBox(height: 120),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(l10n.noAcceptancesYet, textAlign: TextAlign.center),
            ),
          ),
        ],
      );
    }

    final pending = state.requests.where((r) => r.donatedAt == null).toList();
    final past = state.requests.where((r) => r.donatedAt != null).toList();

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        if (pending.isNotEmpty) ...[
          _SectionHeader(title: l10n.sectionPending),
          ...pending.map((r) => _AcceptanceCard(request: r)),
        ],
        if (past.isNotEmpty) ...[
          _SectionHeader(title: l10n.sectionDonated),
          ...past.map((r) => _AcceptanceCard(request: r)),
        ],
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _AcceptanceCard extends StatelessWidget {
  final AcceptedRequest request;

  const _AcceptanceCard({required this.request});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDonated = request.donatedAt != null;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: _statusColor(context, request.status, isDonated),
              child: isDonated
                  ? const Icon(Icons.check, color: Colors.white)
                  : Text(
                      _bloodTypeLabel(request.bloodType),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            title: Text(request.notes ?? l10n.bloodRequest),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (request.requesterName != null) Text(request.requesterName!),
                Text(
                  isDonated
                      ? l10n.donatedOn(formatDate(context, request.donatedAt!))
                      : l10n.acceptedOn(
                          formatDate(context, request.acceptedAt),
                        ),
                ),
                Text(
                  _bloodTypeLabel(request.bloodType),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (request.donatedAt == null &&
              request.status != 'cancelled' &&
              request.status != 'fulfilled')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  if (request.requesterPhone != null &&
                      request.requesterPhone!.isNotEmpty)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _call(request.requesterPhone!),
                        icon: const Icon(Icons.phone),
                        label: Text(l10n.call),
                      ),
                    ),
                  if (request.requesterPhone != null &&
                      request.requesterPhone!.isNotEmpty)
                    const SizedBox(width: 8),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, _) {
                        final isLoading = ref.watch(donationControllerProvider);
                        return FilledButton.icon(
                          onPressed: isLoading
                              ? null
                              : () => _confirmDonation(context, ref),
                          icon: const Icon(Icons.bloodtype),
                          label: Text(l10n.iDonated),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color _statusColor(BuildContext context, String status, bool isDonated) {
    if (isDonated) return Colors.green;
    return switch (status) {
      'searching' => Colors.orange,
      'in_progress' => Colors.blue,
      'fulfilled' => Colors.green,
      'cancelled' => Colors.grey,
      _ => Theme.of(context).colorScheme.primary,
    };
  }

  String _bloodTypeLabel(String value) {
    return switch (value) {
      'A_POS' => 'A+',
      'A_NEG' => 'A-',
      'B_POS' => 'B+',
      'B_NEG' => 'B-',
      'AB_POS' => 'AB+',
      'AB_NEG' => 'AB-',
      'O_POS' => 'O+',
      'O_NEG' => 'O-',
      _ => value,
    };
  }

  Future<void> _call(String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _confirmDonation(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.confirmDonationTitle),
        content: Text(l10n.confirmDonationContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final success = await ref
        .read(donationControllerProvider.notifier)
        .record(request.id);

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success ? l10n.donationRecorded : l10n.donationFailed),
      ),
    );
  }
}
