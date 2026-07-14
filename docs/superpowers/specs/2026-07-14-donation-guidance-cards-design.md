# Donation Guidance Cards — Design

**Date:** 2026-07-14
**Status:** Approved (pending medical content validation, see Open Items)

## Purpose

Give donors the right guidance at the right moment of the donation journey,
replacing the single post-accept "next steps" dialog with three stage-aware
guidance surfaces:

1. **Self-check** (eligibility) — before committing to a request.
2. **Preparation + during-donation guide** — after accepting, re-openable
   until the donation happens.
3. **Aftercare** — right after the donor reports "I donated".

Origin: a teammate's proposal for a 4-card swipe deck. The card content is
kept; the delivery is changed from a one-time deck to stage-aware surfacing,
because the four cards describe different points in time and the app already
tracks that lifecycle (accept → coordinate → donate → report).

## Decisions made

| Decision | Choice |
| --- | --- |
| Eligibility check role | **Soft gate**: all items must be ticked to enable Accept; nothing stored or sent (self-attestation). |
| Delivery model | **Stage-aware**: each card appears at its natural moment in the existing flow. No standalone browsable guide screen (possible later increment). |
| Eligibility reminder notification | **Out of scope.** Aftercare shows the computed "eligible again" date only. |
| Content source | Hardcoded strings in the existing `.arb` l10n files (en/fr/ar). |
| Eligibility interval | Never hardcoded client-side. Cooldown state comes from the server via `User.cooldownUntil`. |

## UX flow

### 1. Self-check sheet (accept gate)

Replaces the accept confirmation `AlertDialog` in
`lib/features/request/presentation/request_detail_screen.dart` (`_accept`).

Tapping **Accept request** opens a modal bottom sheet:

- Four checkboxes: *I'm feeling healthy today*, *I'm 18 or older*,
  *I weigh at least 50 kg*, *I slept well last night*.
- Cooldown is resolved automatically, not asked:
  - `cooldownUntil` in the future → sheet opens in a **blocked** state:
    "You can donate again on \<date\>", no way to proceed.
  - Otherwise → pre-confirmed informational row (e.g. "✓ Your last donation
    was more than 3 months ago"; if `cooldownUntil`/`lastDonationDate` are
    null, an informational row without a claim about past donations).
- Confirm button ("I'm ready — accept") enables only when all four boxes are
  ticked. Cancel / swipe-down dismiss = no accept.
- Nothing is persisted or transmitted.

### 2. Preparation + during-donation sheet

Replaces `_showNextStepsDialog` after a successful accept. A modal sheet with
a two-page `PageView` and dot page indicator:

- **Page 1 — Before you go:** eat a meal, drink water, wear short sleeves,
  bring your ID, call the requester to coordinate time and place (retains
  existing `acceptStep1` behavior), tell the staff if you've been sick in the
  last 15 days or take any medication.
- **Page 2 — At the donation center:** stay relaxed, keep your arm still,
  tell the nurse if anything feels wrong, tap "I donated" in the Donations
  tab when finished (retains existing `acceptStep3`).

Re-openable: pending acceptance cards in the Donations tab
(`lib/features/donation/presentation/donations_screen.dart`,
`_AcceptanceCard`) get a "Preparation guide" action that opens the same
sheet. Donors often accept days before donating.

### 3. Aftercare sheet

Shown after `_confirmDonation` succeeds in the Donations tab (replaces the
success snackbar; the failure snackbar stays).

- Celebratory header ("You're a hero ❤️" tone).
- Items: drink extra water, have a snack, no heavy lifting today, skip
  intense exercise today.
- "You'll be eligible to donate again on \<date\>" using the freshly
  re-fetched `User.cooldownUntil`; fallback: donation date + 3 months; if
  neither resolvable, the line is omitted.

## Architecture

Presentation-layer only. No backend changes, no new packages, no new routes,
no new Riverpod providers (checkbox state is ephemeral widget state; user
data is read from existing providers at call sites and passed in).

### New files — `lib/features/donation/presentation/guidance/`

| File | Contents |
| --- | --- |
| `self_check_sheet.dart` | `Future<bool> showSelfCheckSheet(BuildContext context, {DateTime? cooldownUntil})` — returns true only when the donor ticked everything and confirmed. Pure function of its inputs. |
| `prep_guide_sheet.dart` | `Future<void> showPrepGuideSheet(BuildContext context)` — 2-page `PageView` + dot indicator. |
| `aftercare_sheet.dart` | `Future<void> showAftercareSheet(BuildContext context, {DateTime? eligibleAgainOn})` |
| `guide_item_row.dart` | Shared icon + text row widget used by all three sheets (supersedes the private `_StepRow` in `request_detail_screen.dart`). |

### Modified files

- `lib/features/request/presentation/request_detail_screen.dart`
  - `_accept()`: confirm dialog → `showSelfCheckSheet` (caller reads
    `cooldownUntil` from `userControllerProvider`).
  - Success path: `_showNextStepsDialog` → `showPrepGuideSheet`.
  - `_StepRow` deleted.
- `lib/features/donation/presentation/donations_screen.dart`
  - Pending `_AcceptanceCard`: add "Preparation guide" action →
    `showPrepGuideSheet`.
  - `_confirmDonation` success: re-fetch user, then `showAftercareSheet`
    with the fresh `cooldownUntil` (fallback per UX section).
- `lib/l10n/app_en.arb`, `app_fr.arb`, `app_ar.arb`
  - ~20 new strings (sheet titles, checklist items, buttons, eligible-again
    template with a date placeholder).
  - The content of `acceptStep1` and `acceptStep3` moves into the new guide
    strings; `acceptStep1..3`, `acceptSuccessTitle`, and `acceptSuccessLead`
    keys are then deleted from all three `.arb` files.

## Edge cases

- **Cooldown active** → self-check opens blocked with the date; Accept
  unreachable (the backend enforces cooldown anyway; this is UX, not
  security).
- **`cooldownUntil` and `lastDonationDate` both null** (e.g. new user) →
  cooldown row is informational, not blocking.
- **Aftercare date unresolvable** → "eligible again" line omitted.
- **Sheet dismissed** (back button / swipe down / tap outside) → treated as
  cancel; no accept fires.
- **RTL (Arabic)** → `PageView`, dot indicator, and rows follow
  `Directionality`; verified by test.

## Testing

Widget tests (new ground for this repo — currently only
`test/core/location/fuzzy_test.dart` exists):

- Self-check: confirm disabled until all four boxes ticked; blocked state
  when `cooldownUntil` is in the future; dismiss returns false.
- Aftercare: renders the date when provided; omits the line when null.
- Prep guide: both pages render; RTL smoke test under
  `Directionality(textDirection: TextDirection.rtl)`.

CI gate stays `flutter analyze` + `flutter test`.

## Open items

- **Medical content validation (release blocker):** the checklist thresholds
  (50 kg minimum weight, age 18+, 15-day illness window, aftercare advice)
  must be validated against Algerian transfusion guidelines (Agence
  Nationale du Sang) before release. The teammate's original 60 kg figure
  was corrected to the common 50 kg standard, pending that validation.
- **French and Arabic translations** need a native-speaker review, as health
  guidance.
- **Possible later increments** (explicitly not in this spec): standalone
  browsable "Donation guide" screen; eligibility reminder notification
  (local or push).
