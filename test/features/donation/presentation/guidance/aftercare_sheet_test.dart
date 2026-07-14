import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/aftercare_sheet.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('shows the eligible-again line when a date is provided', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrapWithL10n(AftercareSheet(eligibleAgainOn: DateTime(2026, 10, 14))),
    );

    expect(find.text('You\'re a hero! ❤️'), findsOneWidget);
    expect(
      find.text('You\'ll be eligible to donate again on Oct 14, 2026'),
      findsOneWidget,
    );
  });

  testWidgets('omits the eligible-again line when date is null', (
    tester,
  ) async {
    await tester.pumpWidget(wrapWithL10n(const AftercareSheet()));

    expect(find.text('You\'re a hero! ❤️'), findsOneWidget);
    expect(find.textContaining('eligible to donate again'), findsNothing);
  });
}
