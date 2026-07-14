import 'package:flutter/material.dart';
import 'package:hayatuk/features/donation/presentation/guidance/guide_item_row.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

/// Swipeable two-page guide: preparation before leaving, and what to do
/// at the donation center. Re-openable from pending acceptances.
Future<void> showPrepGuideSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => const PrepGuideSheet(),
  );
}

class PrepGuideSheet extends StatefulWidget {
  const PrepGuideSheet({super.key});

  @override
  State<PrepGuideSheet> createState() => _PrepGuideSheetState();
}

class _PrepGuideSheetState extends State<PrepGuideSheet> {
  static const _pageCount = 2;
  final _controller = PageController();
  int _page = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 320,
              child: PageView(
                controller: _controller,
                onPageChanged: (i) => setState(() => _page = i),
                children: [
                  _GuidePage(
                    title: l10n.prepGuideTitle,
                    items: [
                      (Icons.restaurant, l10n.prepGuideEat),
                      (Icons.water_drop_outlined, l10n.prepGuideWater),
                      (Icons.checkroom, l10n.prepGuideSleeves),
                      (Icons.badge_outlined, l10n.prepGuideId),
                      (Icons.phone_outlined, l10n.prepGuideCall),
                      (
                        Icons.medical_information_outlined,
                        l10n.prepGuideDisclose,
                      ),
                    ],
                  ),
                  _GuidePage(
                    title: l10n.duringGuideTitle,
                    items: [
                      (Icons.self_improvement, l10n.duringGuideRelax),
                      (Icons.back_hand_outlined, l10n.duringGuideArm),
                      (
                        Icons.record_voice_over_outlined,
                        l10n.duringGuideSpeakUp,
                      ),
                      (Icons.bloodtype_outlined, l10n.duringGuideRecord),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < _pageCount; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _page == i ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _page == i
                          ? colorScheme.primary
                          : colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
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

class _GuidePage extends StatelessWidget {
  final String title;
  final List<(IconData, String)> items;

  const _GuidePage({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        for (final (icon, text) in items) GuideItemRow(icon: icon, text: text),
      ],
    );
  }
}
