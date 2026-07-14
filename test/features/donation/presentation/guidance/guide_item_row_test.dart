import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/guide_item_row.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('renders icon and text', (tester) async {
    await tester.pumpWidget(
      wrapWithL10n(
        const GuideItemRow(
          icon: Icons.water_drop_outlined,
          text: 'Drink water',
        ),
      ),
    );

    expect(find.byIcon(Icons.water_drop_outlined), findsOneWidget);
    expect(find.text('Drink water'), findsOneWidget);
  });
}
