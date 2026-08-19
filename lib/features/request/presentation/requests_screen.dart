import 'package:flutter/material.dart';
import 'package:hayatuk/core/blood/blood_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/core/status/status.dart';
import 'package:hayatuk/features/request/data/models/blood_request.dart';
import 'package:hayatuk/features/request/presentation/request_providers.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

class RequestsScreen extends ConsumerStatefulWidget {
  const RequestsScreen({super.key});

  @override
  ConsumerState<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends ConsumerState<RequestsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(requestsControllerProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(requestsControllerProvider);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push('/requests/new'),
          icon: const Icon(Icons.add),
          label: Text(l10n.newRequest),
        ),
        body: RefreshIndicator(
          onRefresh: () =>
              ref.read(requestsControllerProvider.notifier).fetch(),
          child: _buildBody(state),
        ),
      ),
    );
  }

  Widget _buildBody(RequestsState state) {
    final l10n = AppLocalizations.of(context)!;
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
                    ref.read(requestsControllerProvider.notifier).fetch(),
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
              child: Text(l10n.noRequestsYet, textAlign: TextAlign.center),
            ),
          ),
        ],
      );
    }

    final active = state.requests
        .where((r) => r.status == 'searching' || r.status == 'in_progress')
        .toList();
    final past = state.requests
        .where((r) => r.status != 'searching' && r.status != 'in_progress')
        .toList();

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        if (active.isNotEmpty) ...[
          _SectionHeader(title: l10n.sectionActive),
          ...active.map((r) => _RequestCard(request: r)),
        ],
        if (past.isNotEmpty) ...[
          _SectionHeader(title: l10n.sectionPast),
          ...past.map((r) => _RequestCard(request: r)),
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

class _RequestCard extends ConsumerWidget {
  final BloodRequest request;

  const _RequestCard({required this.request});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isActive =
        request.status == 'searching' || request.status == 'in_progress';

    // Hospital name is stored as the first line of notes.
    final title = request.notes?.split('\n').first.trim();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        onTap: () => context.push('/requests/${request.id}/detail'),
        leading: CircleAvatar(
          backgroundColor: statusColor(context, request.status),
          child: Text(
            bloodTypeLabel(request.bloodType),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(title == null || title.isEmpty ? l10n.bloodRequest : title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(statusLabel(l10n, request.status)),
            if (request.unitsNeeded > 1)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  l10n.donorsCount(request.unitsAccepted, request.unitsNeeded),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
        trailing: isActive
            ? IconButton(
                icon: const Icon(Icons.cancel_outlined),
                tooltip: l10n.cancel,
                onPressed: () => _confirmCancel(context, ref),
              )
            : null,
      ),
    );
  }

  Future<void> _confirmCancel(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.cancelRequestTitle),
        content: Text(l10n.cancelRequestContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.keep),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.cancelRequestButton),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(requestsControllerProvider.notifier).cancel(request.id);
    }
  }
}
