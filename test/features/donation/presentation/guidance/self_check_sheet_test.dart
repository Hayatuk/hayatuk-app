import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/self_check_sheet.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('confirm is disabled until all four boxes are ticked', (
    tester,
  ) async {
    await tester.pumpWidget(wrapWithL10n(const SelfCheckSheet()));

    final button = find.widgetWithText(FilledButton, "I'm ready — accept");
    expect(tester.widget<FilledButton>(button).onPressed, isNull);

    for (var i = 0; i < 4; i++) {
      await tester.tap(find.byType(CheckboxListTile).at(i));
      await tester.pump();
    }

    expect(tester.widget<FilledButton>(button).onPressed, isNotNull);
  });

  testWidgets('unticking a box disables confirm again', (tester) async {
    await tester.pumpWidget(wrapWithL10n(const SelfCheckSheet()));

    for (var i = 0; i < 4; i++) {
      await tester.tap(find.byType(CheckboxListTile).at(i));
      await tester.pump();
    }
    await tester.tap(find.byType(CheckboxListTile).at(0));
    await tester.pump();

    final button = find.widgetWithText(FilledButton, "I'm ready — accept");
    expect(tester.widget<FilledButton>(button).onPressed, isNull);
  });

  testWidgets('future cooldown shows blocked state with no checkboxes', (
    tester,
  ) async {
    final future = DateTime.now().add(const Duration(days: 30));
    await tester.pumpWidget(
      wrapWithL10n(SelfCheckSheet(cooldownUntil: future)),
    );

    expect(find.text("You're not eligible yet"), findsOneWidget);
    expect(find.byType(CheckboxListTile), findsNothing);
  });

  testWidgets('past cooldown shows the pre-confirmed row', (tester) async {
    final past = DateTime.now().subtract(const Duration(days: 120));
    await tester.pumpWidget(wrapWithL10n(SelfCheckSheet(cooldownUntil: past)));

    expect(find.text("You're past your donation cooldown"), findsOneWidget);
    expect(find.byType(CheckboxListTile), findsNWidgets(4));
  });

  testWidgets('null cooldown shows the informational row', (tester) async {
    await tester.pumpWidget(wrapWithL10n(const SelfCheckSheet()));

    expect(
      find.text("If you've donated before, tell the staff when it was"),
      findsOneWidget,
    );
  });

  testWidgets('showSelfCheckSheet returns false when dismissed', (
    tester,
  ) async {
    bool? result;
    await tester.pumpWidget(
      wrapWithL10n(
        Builder(
          builder: (context) => FilledButton(
            onPressed: () async => result = await showSelfCheckSheet(context),
            child: const Text('open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(400, 20)); // tap the barrier
    await tester.pumpAndSettle();

    expect(result, isFalse);
  });
}
