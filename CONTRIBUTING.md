# Contributing to Hayatuk

Thanks for your interest in contributing! 🩸

## Getting set up

1. Read the [README](README.md) and complete the **Configuration** section
   (Firebase config + `ENV`/`API_URL` defines). Without it the app won't build.
   The backend is closed source — if your contribution needs a live API,
   [open an issue](https://github.com/Hayatuk/hayatuk-app/issues) to request
   access to the staging environment.
2. Install dependencies: `flutter pub get`.
3. Verify your environment: `flutter analyze && flutter test`.

## Development workflow

- Branch off `main`; use a descriptive branch name (e.g. `fix/location-timeout`).
- Keep changes focused — one logical change per PR.
- Match the existing style: feature-first layout (`lib/features/<feature>/{data,presentation}`),
  Riverpod for state, and user-facing strings localized via the ARB files in
  `lib/l10n/` (run `flutter gen-l10n` after editing them — add new keys to **all**
  of `app_en.arb`, `app_fr.arb`, `app_ar.arb`).
- Before pushing, make sure these pass:

  ```bash
  flutter analyze
  flutter test
  dart format .
  ```

  CI runs the same checks on every PR.

## Commit & PR

- Write clear commit messages (e.g. `fix: stop infinite spinner when GPS times out`).
- In the PR description, explain *what* changed and *why*, and how you tested it.
- Don't commit secrets or Firebase config — those files are gitignored by design.

## Reporting bugs / requesting features

Open an issue with steps to reproduce (for bugs) or a clear use case (for
features). For anything security- or privacy-sensitive, please **do not** open a
public issue — see the contact note in [PRIVACY.md](PRIVACY.md).
