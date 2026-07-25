import 'package:flutter/material.dart';
import 'package:hayatuk/core/utils/date_format.dart';
import 'package:hayatuk/features/donation/presentation/guidance/guide_item_row.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

/// Post-donation thank-you and aftercare instructions.
Future<void> showAftercareSheet(
  BuildContext context, {
  DateTime? eligibleAgainOn,
}) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (_) => AftercareSheet(eligibleAgainOn: eligibleAgainOn),
  );
}

class AftercareSheet extends StatelessWidget {
  final DateTime? eligibleAgainOn;

  const AftercareSheet({super.key, this.eligibleAgainOn});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.favorite, color: Colors.red, size: 48),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                l10n.aftercareTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 16),
            Text(l10n.aftercareLead),
            const SizedBox(height: 8),
            GuideItemRow(
              icon: Icons.water_drop_outlined,
              text: l10n.aftercareWater,
            ),
            GuideItemRow(icon: Icons.restaurant, text: l10n.aftercareSnack),
            GuideItemRow(
              icon: Icons.fitness_center,
              text: l10n.aftercareNoLifting,
            ),
            GuideItemRow(
              icon: Icons.directions_run,
              text: l10n.aftercareNoExercise,
            ),
            if (eligibleAgainOn != null) ...[
              const SizedBox(height: 16),
              GuideItemRow(
                icon: Icons.event_available,
                text: l10n.aftercareEligibleAgain(
                  formatDate(context, eligibleAgainOn!),
                ),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: Text(l10n.gotIt),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
