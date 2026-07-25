import 'package:flutter/material.dart';
import 'package:hayatuk/core/utils/date_format.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

/// Pre-accept eligibility self-check (soft gate).
///
/// Returns true only when the donor ticked every item and confirmed.
/// Nothing is persisted or transmitted — this is self-attestation.
Future<bool> showSelfCheckSheet(
  BuildContext context, {
  DateTime? cooldownUntil,
}) async {
  final result = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => SelfCheckSheet(cooldownUntil: cooldownUntil),
  );
  return result ?? false;
}

class SelfCheckSheet extends StatefulWidget {
  final DateTime? cooldownUntil;

  const SelfCheckSheet({super.key, this.cooldownUntil});

  @override
  State<SelfCheckSheet> createState() => _SelfCheckSheetState();
}

class _SelfCheckSheetState extends State<SelfCheckSheet> {
  static const _itemCount = 4;
  final Set<int> _checked = {};

  bool get _inCooldown =>
      widget.cooldownUntil != null &&
      widget.cooldownUntil!.isAfter(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: _inCooldown ? _buildBlocked(context) : _buildChecklist(context),
      ),
    );
  }

  Widget _buildBlocked(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.hourglass_top,
          size: 48,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(height: 16),
        Text(
          l10n.selfCheckBlockedTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          l10n.selfCheckBlockedBody(formatDate(context, widget.cooldownUntil!)),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.gotIt),
          ),
        ),
      ],
    );
  }

  Widget _buildChecklist(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final items = [
      l10n.selfCheckHealthy,
      l10n.selfCheckAge,
      l10n.selfCheckWeight,
      l10n.selfCheckSleep,
    ];
    final allChecked = _checked.length == _itemCount;
    final cooldownKnown = widget.cooldownUntil != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.selfCheckTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(l10n.selfCheckLead),
        const SizedBox(height: 8),
        for (var i = 0; i < items.length; i++)
          CheckboxListTile(
            value: _checked.contains(i),
            onChanged: (checked) => setState(() {
              checked == true ? _checked.add(i) : _checked.remove(i);
            }),
            title: Text(items[i]),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.zero,
          ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              cooldownKnown ? Icons.check_circle_outline : Icons.info_outline,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                cooldownKnown
                    ? l10n.selfCheckCooldownOk
                    : l10n.selfCheckCooldownUnknown,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: allChecked ? () => Navigator.pop(context, true) : null,
            child: Text(l10n.selfCheckConfirm),
          ),
        ),
      ],
    );
  }
}
