# Donation Guidance Cards Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Stage-aware donation guidance: an eligibility self-check that soft-gates "Accept request", a swipeable prep/during guide after accepting (re-openable from pending acceptances), and an aftercare sheet after "I donated".

**Architecture:** Presentation-layer only. Three modal bottom sheets plus one shared row widget under `lib/features/donation/presentation/guidance/`, wired into the existing accept flow (`request_detail_screen.dart`) and donations flow (`donations_screen.dart`). No new packages, routes, providers, or backend calls. Checkbox state is ephemeral widget state; user data (`cooldownUntil`) is read from `userControllerProvider` at call sites and passed in, so sheets are pure functions of their inputs.

**Tech Stack:** Flutter (Material 3), flutter_riverpod (existing providers only), `flutter gen-l10n` (arb files in `lib/l10n`, generated output committed under `lib/l10n/generated/`), flutter_test widget tests.

**Spec:** `docs/superpowers/specs/2026-07-14-donation-guidance-cards-design.md`

## Global Constraints

- Never hardcode eligibility math (no "90 days" logic). Cooldown state comes from `User.cooldownUntil` (server-computed). The only fallback: aftercare date defaults to donation date + 3 calendar months.
- All user-facing strings go through `AppLocalizations` (en/fr/ar). No literal UI strings in widgets.
- After any `.arb` change run `flutter gen-l10n` and commit the regenerated files in `lib/l10n/generated/`.
- Dart 3 idioms are fine (the codebase already uses sealed classes and switch expressions).
- Working branch: `soheyb`. The repo has unrelated uncommitted changes — always `git add` explicit paths, never `git add -A` or `git add .`.
- Verification commands: `flutter analyze` (expect: `No issues found!`) and `flutter test` (expect: `All tests passed!`).

---

### Task 1: L10n strings for all three sheets

**Files:**
- Modify: `lib/l10n/app_en.arb` (append before the closing `}`)
- Modify: `lib/l10n/app_fr.arb` (append before the closing `}`)
- Modify: `lib/l10n/app_ar.arb` (append before the closing `}`)
- Modify (generated): `lib/l10n/generated/*` via `flutter gen-l10n`

**Interfaces:**
- Consumes: existing l10n pipeline (`l10n.yaml`: template `app_en.arb`, output class `AppLocalizations` in `lib/l10n/generated/app_localizations.dart`).
- Produces: getters used by Tasks 3–7: `selfCheckTitle`, `selfCheckLead`, `selfCheckHealthy`, `selfCheckAge`, `selfCheckWeight`, `selfCheckSleep`, `selfCheckCooldownOk`, `selfCheckCooldownUnknown`, `selfCheckBlockedTitle`, `selfCheckBlockedBody(String date)`, `selfCheckConfirm`, `prepGuideTitle`, `prepGuideEat`, `prepGuideWater`, `prepGuideSleeves`, `prepGuideId`, `prepGuideCall`, `prepGuideDisclose`, `duringGuideTitle`, `duringGuideRelax`, `duringGuideArm`, `duringGuideSpeakUp`, `duringGuideRecord`, `aftercareTitle`, `aftercareLead`, `aftercareWater`, `aftercareSnack`, `aftercareNoLifting`, `aftercareNoExercise`, `aftercareEligibleAgain(String date)`.

- [ ] **Step 1: Add English strings**

Append to `lib/l10n/app_en.arb` immediately before the final `}` (add a comma to the current last entry). Placeholder metadata follows the existing `@donatedOn` pattern in the same file:

```json
  "selfCheckTitle": "Quick self-check",
  "selfCheckLead": "Before you commit, confirm you can donate today:",
  "selfCheckHealthy": "I'm feeling healthy today",
  "selfCheckAge": "I'm 18 or older",
  "selfCheckWeight": "I weigh at least 50 kg",
  "selfCheckSleep": "I slept well last night",
  "selfCheckCooldownOk": "You're past your donation cooldown",
  "selfCheckCooldownUnknown": "If you've donated before, tell the staff when it was",
  "selfCheckBlockedTitle": "You're not eligible yet",
  "selfCheckBlockedBody": "You can donate again on {date}",
  "@selfCheckBlockedBody": {
    "placeholders": {
      "date": { "type": "String" }
    }
  },
  "selfCheckConfirm": "I'm ready — accept",
  "prepGuideTitle": "Before you go",
  "prepGuideEat": "Eat a full meal",
  "prepGuideWater": "Drink plenty of water",
  "prepGuideSleeves": "Wear short sleeves",
  "prepGuideId": "Bring your ID",
  "prepGuideCall": "Call the requester to coordinate when and where to meet",
  "prepGuideDisclose": "Tell the staff if you've been sick in the last 15 days or take any medication",
  "duringGuideTitle": "At the donation center",
  "duringGuideRelax": "Stay relaxed",
  "duringGuideArm": "Keep your arm still",
  "duringGuideSpeakUp": "Tell the nurse if anything feels wrong",
  "duringGuideRecord": "Tap \"I donated\" in the Donations tab when finished",
  "aftercareTitle": "You're a hero! ❤️",
  "aftercareLead": "Take care of yourself for the rest of the day:",
  "aftercareWater": "Drink extra water",
  "aftercareSnack": "Have a snack",
  "aftercareNoLifting": "No heavy lifting today",
  "aftercareNoExercise": "Skip intense exercise today",
  "aftercareEligibleAgain": "You'll be eligible to donate again on {date}",
  "@aftercareEligibleAgain": {
    "placeholders": {
      "date": { "type": "String" }
    }
  }
```

- [ ] **Step 2: Add French strings**

Append to `lib/l10n/app_fr.arb` before the final `}` (values only — non-template arbs in this repo carry no `@` metadata). Mark for native-speaker review before release (spec Open Items):

```json
  "selfCheckTitle": "Auto-évaluation rapide",
  "selfCheckLead": "Avant de vous engager, confirmez que vous pouvez donner aujourd'hui :",
  "selfCheckHealthy": "Je me sens en bonne santé aujourd'hui",
  "selfCheckAge": "J'ai 18 ans ou plus",
  "selfCheckWeight": "Je pèse au moins 50 kg",
  "selfCheckSleep": "J'ai bien dormi cette nuit",
  "selfCheckCooldownOk": "Votre délai entre deux dons est écoulé",
  "selfCheckCooldownUnknown": "Si vous avez déjà donné, indiquez au personnel la date de votre dernier don",
  "selfCheckBlockedTitle": "Vous n'êtes pas encore éligible",
  "selfCheckBlockedBody": "Vous pourrez donner à nouveau le {date}",
  "selfCheckConfirm": "Je suis prêt — accepter",
  "prepGuideTitle": "Avant de partir",
  "prepGuideEat": "Prenez un repas complet",
  "prepGuideWater": "Buvez beaucoup d'eau",
  "prepGuideSleeves": "Portez des manches courtes",
  "prepGuideId": "Apportez votre pièce d'identité",
  "prepGuideCall": "Appelez le demandeur pour convenir du lieu et de l'heure",
  "prepGuideDisclose": "Signalez au personnel si vous avez été malade ces 15 derniers jours ou si vous prenez des médicaments",
  "duringGuideTitle": "Au centre de don",
  "duringGuideRelax": "Restez détendu",
  "duringGuideArm": "Gardez votre bras immobile",
  "duringGuideSpeakUp": "Prévenez l'infirmier si quelque chose ne va pas",
  "duringGuideRecord": "Appuyez sur « J'ai donné » dans l'onglet Dons une fois terminé",
  "aftercareTitle": "Vous êtes un héros ! ❤️",
  "aftercareLead": "Prenez soin de vous pour le reste de la journée :",
  "aftercareWater": "Buvez plus d'eau",
  "aftercareSnack": "Prenez une collation",
  "aftercareNoLifting": "Pas de charges lourdes aujourd'hui",
  "aftercareNoExercise": "Évitez le sport intense aujourd'hui",
  "aftercareEligibleAgain": "Vous pourrez donner à nouveau le {date}"
```

- [ ] **Step 3: Add Arabic strings**

Append to `lib/l10n/app_ar.arb` before the final `}`. Mark for native-speaker review before release:

```json
  "selfCheckTitle": "فحص ذاتي سريع",
  "selfCheckLead": "قبل الالتزام، تأكد أنه يمكنك التبرع اليوم:",
  "selfCheckHealthy": "أشعر أنني بصحة جيدة اليوم",
  "selfCheckAge": "عمري 18 سنة أو أكثر",
  "selfCheckWeight": "وزني 50 كغ على الأقل",
  "selfCheckSleep": "نمت جيدًا الليلة الماضية",
  "selfCheckCooldownOk": "انقضت فترة الانتظار منذ آخر تبرع لك",
  "selfCheckCooldownUnknown": "إذا سبق لك التبرع، أخبر الطاقم بتاريخ آخر تبرع",
  "selfCheckBlockedTitle": "لست مؤهلاً بعد",
  "selfCheckBlockedBody": "يمكنك التبرع مجددًا في {date}",
  "selfCheckConfirm": "أنا مستعد — قبول",
  "prepGuideTitle": "قبل الذهاب",
  "prepGuideEat": "تناول وجبة كاملة",
  "prepGuideWater": "اشرب كمية كافية من الماء",
  "prepGuideSleeves": "ارتدِ أكمامًا قصيرة",
  "prepGuideId": "أحضر بطاقة هويتك",
  "prepGuideCall": "اتصل بصاحب الطلب للاتفاق على مكان وموعد اللقاء",
  "prepGuideDisclose": "أخبر الطاقم إذا كنت مريضًا خلال الـ 15 يومًا الماضية أو تتناول أي دواء",
  "duringGuideTitle": "في مركز التبرع",
  "duringGuideRelax": "ابقَ مسترخيًا",
  "duringGuideArm": "أبقِ ذراعك ثابتة",
  "duringGuideSpeakUp": "أخبر الممرض إذا شعرت بأي شيء غير طبيعي",
  "duringGuideRecord": "اضغط على \"تبرعت\" في تبويب التبرعات عند الانتهاء",
  "aftercareTitle": "أنت بطل! ❤️",
  "aftercareLead": "اعتنِ بنفسك بقية اليوم:",
  "aftercareWater": "اشرب مزيدًا من الماء",
  "aftercareSnack": "تناول وجبة خفيفة",
  "aftercareNoLifting": "لا ترفع أشياء ثقيلة اليوم",
  "aftercareNoExercise": "تجنب التمارين الشاقة اليوم",
  "aftercareEligibleAgain": "ستكون مؤهلاً للتبرع مجددًا في {date}"
```

- [ ] **Step 4: Regenerate and verify**

Run: `flutter gen-l10n && flutter analyze`
Expected: gen-l10n completes without "untranslated messages" warnings for these keys; analyze reports `No issues found!`

- [ ] **Step 5: Commit**

```bash
git add lib/l10n/app_en.arb lib/l10n/app_fr.arb lib/l10n/app_ar.arb lib/l10n/generated
git commit -m "feat: l10n strings for donation guidance sheets"
```

---

### Task 2: Shared `GuideItemRow` widget + l10n test helper

**Files:**
- Create: `lib/features/donation/presentation/guidance/guide_item_row.dart`
- Create: `test/helpers/l10n.dart`
- Test: `test/features/donation/presentation/guidance/guide_item_row_test.dart`

**Interfaces:**
- Consumes: nothing project-specific.
- Produces:
  - `class GuideItemRow extends StatelessWidget` with constructor `GuideItemRow({super.key, required IconData icon, required String text})` — used by Tasks 3–5.
  - `Widget wrapWithL10n(Widget child, {Locale locale = const Locale('en')})` — test helper used by Tasks 3–5 tests.

- [ ] **Step 1: Write the failing test**

`test/features/donation/presentation/guidance/guide_item_row_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/guide_item_row.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('renders icon and text', (tester) async {
    await tester.pumpWidget(
      wrapWithL10n(
        const GuideItemRow(icon: Icons.water_drop_outlined, text: 'Drink water'),
      ),
    );

    expect(find.byIcon(Icons.water_drop_outlined), findsOneWidget);
    expect(find.text('Drink water'), findsOneWidget);
  });
}
```

`test/helpers/l10n.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

/// Wraps [child] in a MaterialApp with the app's localization setup,
/// so widgets that call AppLocalizations.of(context) work in tests.
Widget wrapWithL10n(Widget child, {Locale locale = const Locale('en')}) {
  return MaterialApp(
    locale: locale,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}
```

- [ ] **Step 2: Run test to verify it fails**

Run: `flutter test test/features/donation/presentation/guidance/guide_item_row_test.dart`
Expected: FAIL — `Error: Couldn't resolve the package 'hayatuk/features/donation/presentation/guidance/guide_item_row.dart'` (file doesn't exist yet)

- [ ] **Step 3: Write the implementation**

`lib/features/donation/presentation/guidance/guide_item_row.dart`:

```dart
import 'package:flutter/material.dart';

/// Icon + text row used by the donation guidance sheets.
class GuideItemRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const GuideItemRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
```

- [ ] **Step 4: Run test to verify it passes**

Run: `flutter test test/features/donation/presentation/guidance/guide_item_row_test.dart`
Expected: PASS (`All tests passed!`)

- [ ] **Step 5: Commit**

```bash
git add lib/features/donation/presentation/guidance/guide_item_row.dart test/helpers/l10n.dart test/features/donation/presentation/guidance/guide_item_row_test.dart
git commit -m "feat: shared GuideItemRow widget and l10n test helper"
```

---

### Task 3: Self-check sheet (accept gate)

**Files:**
- Create: `lib/features/donation/presentation/guidance/self_check_sheet.dart`
- Test: `test/features/donation/presentation/guidance/self_check_sheet_test.dart`

**Interfaces:**
- Consumes: `AppLocalizations` getters from Task 1; `formatDate(BuildContext, DateTime)` from `lib/core/utils/date_format.dart`; `wrapWithL10n` from Task 2.
- Produces: `Future<bool> showSelfCheckSheet(BuildContext context, {DateTime? cooldownUntil})` — returns `true` only when the donor ticked all four items and confirmed; `false` on cancel/dismiss/blocked. Also exports `class SelfCheckSheet extends StatefulWidget` with constructor `SelfCheckSheet({super.key, DateTime? cooldownUntil})` (used directly by tests). Used by Task 6.

- [ ] **Step 1: Write the failing tests**

`test/features/donation/presentation/guidance/self_check_sheet_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/self_check_sheet.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('confirm is disabled until all four boxes are ticked',
      (tester) async {
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

  testWidgets('future cooldown shows blocked state with no checkboxes',
      (tester) async {
    final future = DateTime.now().add(const Duration(days: 30));
    await tester.pumpWidget(
      wrapWithL10n(SelfCheckSheet(cooldownUntil: future)),
    );

    expect(find.text("You're not eligible yet"), findsOneWidget);
    expect(find.byType(CheckboxListTile), findsNothing);
  });

  testWidgets('past cooldown shows the pre-confirmed row', (tester) async {
    final past = DateTime.now().subtract(const Duration(days: 120));
    await tester.pumpWidget(
      wrapWithL10n(SelfCheckSheet(cooldownUntil: past)),
    );

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

  testWidgets('showSelfCheckSheet returns false when dismissed',
      (tester) async {
    bool? result;
    await tester.pumpWidget(wrapWithL10n(Builder(
      builder: (context) => FilledButton(
        onPressed: () async => result = await showSelfCheckSheet(context),
        child: const Text('open'),
      ),
    )));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(400, 20)); // tap the barrier
    await tester.pumpAndSettle();

    expect(result, isFalse);
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `flutter test test/features/donation/presentation/guidance/self_check_sheet_test.dart`
Expected: FAIL — package import cannot be resolved (file doesn't exist yet)

- [ ] **Step 3: Write the implementation**

`lib/features/donation/presentation/guidance/self_check_sheet.dart`:

```dart
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
          l10n.selfCheckBlockedBody(
            formatDate(context, widget.cooldownUntil!),
          ),
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
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `flutter test test/features/donation/presentation/guidance/self_check_sheet_test.dart`
Expected: PASS (6 tests, `All tests passed!`)

- [ ] **Step 5: Commit**

```bash
git add lib/features/donation/presentation/guidance/self_check_sheet.dart test/features/donation/presentation/guidance/self_check_sheet_test.dart
git commit -m "feat: eligibility self-check sheet (soft gate)"
```

---

### Task 4: Prep/during guide sheet (swipeable, 2 pages)

**Files:**
- Create: `lib/features/donation/presentation/guidance/prep_guide_sheet.dart`
- Test: `test/features/donation/presentation/guidance/prep_guide_sheet_test.dart`

**Interfaces:**
- Consumes: `GuideItemRow` from Task 2; `AppLocalizations` getters from Task 1; `wrapWithL10n` from Task 2.
- Produces: `Future<void> showPrepGuideSheet(BuildContext context)`; exports `class PrepGuideSheet extends StatefulWidget` with const no-arg constructor (used directly by tests). Used by Tasks 6 and 7.

- [ ] **Step 1: Write the failing tests**

`test/features/donation/presentation/guidance/prep_guide_sheet_test.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/prep_guide_sheet.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('shows prep page first, during page after swipe',
      (tester) async {
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
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `flutter test test/features/donation/presentation/guidance/prep_guide_sheet_test.dart`
Expected: FAIL — package import cannot be resolved (file doesn't exist yet)

- [ ] **Step 3: Write the implementation**

`lib/features/donation/presentation/guidance/prep_guide_sheet.dart`:

```dart
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
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `flutter test test/features/donation/presentation/guidance/prep_guide_sheet_test.dart`
Expected: PASS (2 tests, `All tests passed!`)

- [ ] **Step 5: Commit**

```bash
git add lib/features/donation/presentation/guidance/prep_guide_sheet.dart test/features/donation/presentation/guidance/prep_guide_sheet_test.dart
git commit -m "feat: swipeable prep/during donation guide sheet"
```

---

### Task 5: Aftercare sheet

**Files:**
- Create: `lib/features/donation/presentation/guidance/aftercare_sheet.dart`
- Test: `test/features/donation/presentation/guidance/aftercare_sheet_test.dart`

**Interfaces:**
- Consumes: `GuideItemRow` from Task 2; `formatDate` from `lib/core/utils/date_format.dart`; `AppLocalizations` getters from Task 1; `wrapWithL10n` from Task 2.
- Produces: `Future<void> showAftercareSheet(BuildContext context, {DateTime? eligibleAgainOn})`; exports `class AftercareSheet extends StatelessWidget` with constructor `AftercareSheet({super.key, DateTime? eligibleAgainOn})`. Used by Task 7.

- [ ] **Step 1: Write the failing tests**

`test/features/donation/presentation/guidance/aftercare_sheet_test.dart`:

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:hayatuk/features/donation/presentation/guidance/aftercare_sheet.dart';

import '../../../../helpers/l10n.dart';

void main() {
  testWidgets('shows the eligible-again line when a date is provided',
      (tester) async {
    await tester.pumpWidget(
      wrapWithL10n(AftercareSheet(eligibleAgainOn: DateTime(2026, 10, 14))),
    );

    expect(find.text('You\'re a hero! ❤️'), findsOneWidget);
    expect(
      find.text('You\'ll be eligible to donate again on Oct 14, 2026'),
      findsOneWidget,
    );
  });

  testWidgets('omits the eligible-again line when date is null',
      (tester) async {
    await tester.pumpWidget(wrapWithL10n(const AftercareSheet()));

    expect(find.text('You\'re a hero! ❤️'), findsOneWidget);
    expect(find.textContaining('eligible to donate again'), findsNothing);
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `flutter test test/features/donation/presentation/guidance/aftercare_sheet_test.dart`
Expected: FAIL — package import cannot be resolved (file doesn't exist yet)

- [ ] **Step 3: Write the implementation**

`lib/features/donation/presentation/guidance/aftercare_sheet.dart`:

```dart
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
```

- [ ] **Step 4: Run tests to verify they pass**

Run: `flutter test test/features/donation/presentation/guidance/aftercare_sheet_test.dart`
Expected: PASS (2 tests, `All tests passed!`)

- [ ] **Step 5: Commit**

```bash
git add lib/features/donation/presentation/guidance/aftercare_sheet.dart test/features/donation/presentation/guidance/aftercare_sheet_test.dart
git commit -m "feat: post-donation aftercare sheet"
```

---

### Task 6: Wire self-check + prep guide into the accept flow

**Files:**
- Modify: `lib/features/request/presentation/request_detail_screen.dart` (replace `_accept`, delete `_showNextStepsDialog` and `_StepRow`)
- Modify: `lib/l10n/app_en.arb`, `lib/l10n/app_fr.arb`, `lib/l10n/app_ar.arb` (delete dead keys)
- Modify (generated): `lib/l10n/generated/*` via `flutter gen-l10n`

**Interfaces:**
- Consumes: `showSelfCheckSheet(context, cooldownUntil: ...)` from Task 3; `showPrepGuideSheet(context)` from Task 4; `userControllerProvider` (`ref.read(userControllerProvider).user?.cooldownUntil`) from `lib/features/user/presentation/user_providers.dart` (already imported in this file).
- Produces: nothing new — behavior change only.

Note on testing: this task is verified by `flutter analyze` + the full test suite + a manual run, not by new widget tests. Testing the full screen requires stubbing `requestDetailProvider`, `userControllerProvider`, and `nearbyRequestsControllerProvider` (backed by the API client); the repo has no mocking infrastructure and adding one is out of scope per the spec. The sheets themselves are covered by Tasks 3–5.

- [ ] **Step 1: Replace `_accept` in `_RequestDetailBody`**

In `lib/features/request/presentation/request_detail_screen.dart`, add imports:

```dart
import 'package:hayatuk/features/donation/presentation/guidance/prep_guide_sheet.dart';
import 'package:hayatuk/features/donation/presentation/guidance/self_check_sheet.dart';
```

Replace the entire `_accept` method (currently the confirm-dialog version) with:

```dart
  Future<void> _accept(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final cooldownUntil = ref.read(userControllerProvider).user?.cooldownUntil;

    final ready = await showSelfCheckSheet(
      context,
      cooldownUntil: cooldownUntil,
    );
    if (!ready || !context.mounted) return;

    final success = await ref
        .read(nearbyRequestsControllerProvider.notifier)
        .accept(request.id);

    if (!context.mounted) return;

    if (success) {
      // Refresh data in background
      ref.read(acceptancesControllerProvider.notifier).fetch();
      ref.invalidate(requestDetailProvider(request.id));

      await showPrepGuideSheet(context);
      if (!context.mounted) return;
      context.go('/donations');
    } else {
      final error = ref.read(nearbyRequestsControllerProvider).error;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error ?? l10n.acceptFailed)));
    }
  }
```

- [ ] **Step 2: Delete `_showNextStepsDialog` and `_StepRow`**

Delete the whole `_showNextStepsDialog` method and the whole `_StepRow` class from the same file.

- [ ] **Step 3: Delete dead l10n keys**

First confirm the keys are now unused (expect no matches outside `lib/l10n/`):

```bash
grep -rn "acceptRequestConfirmTitle\|acceptRequestConfirmContent\|acceptStep1\|acceptStep2\|acceptStep3\|acceptSuccessTitle\|acceptSuccessLead\|l10n.accept\b" --include="*.dart" lib | grep -v "lib/l10n"
```

Then delete these keys from `app_en.arb`, `app_fr.arb`, and `app_ar.arb`: `acceptRequestConfirmTitle`, `acceptRequestConfirmContent`, `acceptStep1`, `acceptStep2`, `acceptStep3`, `acceptSuccessTitle`, `acceptSuccessLead`, and `accept` (only if the grep above showed no remaining use). Keep `acceptFailed`, `acceptRequest`, `gotIt`, `cancel`.

- [ ] **Step 4: Regenerate l10n and verify**

Run: `flutter gen-l10n && flutter analyze && flutter test`
Expected: analyze `No issues found!` (the compiler catches any missed usage of deleted keys); test `All tests passed!`

- [ ] **Step 5: Manual verification (if a device/emulator is available)**

Run the app (`./run.sh` or the `flutter run` command from README with dev flavor + defines). On a request you don't own, tap **Accept request**: the self-check sheet must appear; the confirm button must stay disabled until all four boxes are ticked; confirming must accept the request and show the two-page guide; swiping between pages must work; "Got it" must land on the Donations tab. If no device is available, note that this step was skipped in the commit/PR description.

- [ ] **Step 6: Commit**

```bash
git add lib/features/request/presentation/request_detail_screen.dart lib/l10n/app_en.arb lib/l10n/app_fr.arb lib/l10n/app_ar.arb lib/l10n/generated
git commit -m "feat: gate request acceptance behind eligibility self-check"
```

---

### Task 7: Wire guide + aftercare into the Donations tab

**Files:**
- Modify: `lib/features/donation/presentation/donations_screen.dart` (add guide action to `_AcceptanceCard`, replace success snackbar in `_confirmDonation`)
- Modify: `lib/l10n/app_en.arb`, `lib/l10n/app_fr.arb`, `lib/l10n/app_ar.arb` (delete `donationRecorded` if unused)
- Modify (generated): `lib/l10n/generated/*` via `flutter gen-l10n`

**Interfaces:**
- Consumes: `showPrepGuideSheet(context)` from Task 4; `showAftercareSheet(context, eligibleAgainOn: ...)` from Task 5; `userControllerProvider` from `lib/features/user/presentation/user_providers.dart`. Relies on `DonationController.record()` already calling `refreshUser()` internally (see `lib/features/donation/presentation/donation_providers.dart`), so `cooldownUntil` is fresh after a successful record.
- Produces: nothing new — behavior change only.

Same testing note as Task 6: verified via analyze + full suite + manual run.

- [ ] **Step 1: Add imports to `donations_screen.dart`**

```dart
import 'package:hayatuk/features/donation/presentation/guidance/aftercare_sheet.dart';
import 'package:hayatuk/features/donation/presentation/guidance/prep_guide_sheet.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';
```

- [ ] **Step 2: Add the guide action to pending acceptance cards**

In `_AcceptanceCard.build`, inside the pending-actions `Row` (the one guarded by `request.donatedAt == null && ...`), insert as the FIRST children of the Row, before the Call button:

```dart
                  IconButton.outlined(
                    onPressed: () => showPrepGuideSheet(context),
                    icon: const Icon(Icons.menu_book_outlined),
                    tooltip: l10n.prepGuideTitle,
                  ),
                  const SizedBox(width: 8),
```

- [ ] **Step 3: Show the aftercare sheet on successful donation**

In `_confirmDonation`, replace everything after `if (!context.mounted) return;` (currently a single snackbar for both outcomes) with:

```dart
    if (success) {
      final refreshed = ref.read(userControllerProvider).user?.cooldownUntil;
      final now = DateTime.now();
      // record() refreshed the user; if that silently failed (or the value
      // is stale/past), fall back to donation date + 3 months.
      final eligibleAgainOn = (refreshed != null && refreshed.isAfter(now))
          ? refreshed
          : DateTime(now.year, now.month + 3, now.day);
      await showAftercareSheet(context, eligibleAgainOn: eligibleAgainOn);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.donationFailed)),
      );
    }
```

- [ ] **Step 4: Delete the now-dead `donationRecorded` key**

Confirm it's unused (expect no matches outside `lib/l10n/`):

```bash
grep -rn "donationRecorded" --include="*.dart" lib | grep -v "lib/l10n"
```

If unused, delete `donationRecorded` from `app_en.arb`, `app_fr.arb`, and `app_ar.arb`.

- [ ] **Step 5: Regenerate, analyze, test, format**

Run: `flutter gen-l10n && flutter analyze && flutter test && dart format lib/features/donation lib/features/request test`
Expected: analyze `No issues found!`; test `All tests passed!`; format changes nothing or only files touched by this plan

- [ ] **Step 6: Manual verification (if a device/emulator is available)**

In the Donations tab with a pending acceptance: the book icon must open the two-page guide; tapping **I donated** and confirming must show the aftercare sheet with an "eligible again" date instead of the old snackbar. If no device is available, note that this step was skipped.

- [ ] **Step 7: Commit**

```bash
git add lib/features/donation/presentation/donations_screen.dart lib/l10n/app_en.arb lib/l10n/app_fr.arb lib/l10n/app_ar.arb lib/l10n/generated
git commit -m "feat: prep guide action and aftercare sheet in donations tab"
```

---

## Out of scope (per spec)

- Standalone browsable "Donation guide" screen.
- Eligibility reminder notifications (local or push).
- Backend changes of any kind.

## Release blockers noted in spec (not code tasks)

- Medical content validation against Algerian transfusion guidelines (50 kg threshold, age, 15-day illness window, aftercare advice).
- Native-speaker review of the fr/ar strings added in Task 1.
