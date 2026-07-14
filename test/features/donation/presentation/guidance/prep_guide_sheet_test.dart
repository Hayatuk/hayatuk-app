import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/prep_guide_sheet.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('shows prep page first, during page after swipe', (tester) async {
    await tester.pumpWidget(wrapWithL10n(const PrepGuideSheet()));

    expect(find.text('Before you go'), findsOneWidget);
    expect(find.text('Eat a full meal'), findsOneWidget);

    await tester.drag(find.byType(PageView), const Offset(-400, 0));
    await tester.pumpAndSettle();

    expect(find.text('At the donation center'), findsOneWidget);
    expect(find.text('Keep your arm still'), findsOneWidget);
  });

  testWidgets('renders in Arabic (RTL) without errors', (tester) async {
    await tester.pumpWidget(
      wrapWithL10n(const PrepGuideSheet(), locale: const Locale('ar')),
    );

    expect(find.text('قبل الذهاب'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
