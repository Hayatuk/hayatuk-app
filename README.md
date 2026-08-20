<p align="center">
  <img src="assets/icon/icon.png" width="120" alt="Hayatuk logo"/>
</p>

<h1 align="center">Hayatuk</h1>

<p align="center">
  Connecting blood donors with nearby blood requests.
</p>

<p align="center">
  <a href="https://github.com/Hayatuk/hayatuk-app/actions/workflows/ci.yml">
    <img src="https://github.com/Hayatuk/hayatuk-app/actions/workflows/ci.yml/badge.svg" alt="CI"/>
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/license-GPL--3.0-blue.svg" alt="License: GPL-3.0"/>
  </a>
  <img src="https://img.shields.io/badge/Flutter-stable-02569B?logo=flutter" alt="Flutter"/>
</p>

<p align="center">
  <a href="https://play.google.com/store/apps/details?id=io.github.hayatuk.hayatuk">
    <img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" height="60" alt="Get it on Google Play"/>
  </a>
</p>

---

Hayatuk is a Flutter app that connects blood donors with nearby blood requests.
Donors see open requests around them on a map and can accept one to coordinate a
donation; requesters can post a need and get notified as donors commit.

## Features

- 📍 **Map of nearby requests** — see open blood requests around you and accept one to help.
- 🩸 **Post a request** — describe the need (blood type, product type, units needed, location) and get notified as donors commit.
- 🔒 **Privacy first** — a donor's exact GPS location never leaves the device; only a coarse, grid-snapped coordinate (~1 km) is sent to the server. See [`PRIVACY.md`](PRIVACY.md) and `lib/core/location/fuzzy.dart`.
- 🔔 **Push notifications** — donors and requesters are kept in the loop via Firebase Cloud Messaging.
- 🌍 **Multilingual** — available in English, Arabic, and French.

<!--
## Screenshots

<p align="center">
  <img src="docs/screenshots/map.png" width="24%" alt="Map of nearby requests"/>
  <img src="docs/screenshots/request.png" width="24%" alt="Request details"/>
  <img src="docs/screenshots/donation.png" width="24%" alt="Donation flow"/>
</p>
-->

## Tech stack

Flutter · Firebase (Cloud Messaging) · REST backend (closed source, not part of this repo).

## Development

### Prerequisites

- Flutter SDK (stable channel) — see `environment.sdk` in `pubspec.yaml`.
- The [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) for Firebase config.
- Access to a backend API instance (see note below).

> **Note:** the backend is closed source and there is no public API instance.
> You can still build, analyze, and test the app without it. If your
> contribution needs a live backend (e.g. the request/donation flows),
> [open an issue](https://github.com/Hayatuk/hayatuk-app/issues) and we'll
> share access to the staging environment.

### Configuration

The app is built for one of two environments (`dev` / `prod`), selected at build
time. Firebase config is **gitignored** — you provide your own. Generate it per
environment with the FlutterFire CLI:

```bash
# dev
flutterfire configure --project=<your-dev-project> \
  --out=lib/firebase/firebase_options_dev.dart \
  --android-package-name=io.github.hayatuk.hayatuk
```

Place the per-flavor `google-services.json` under `android/app/src/dev/` and
`android/app/src/prod/` (both gitignored). For a quick start
without the CLI, copy the `*.example` templates in `lib/firebase/` and fill in
your values.

### Run

Requires the `ENV` and `API_URL` dart-defines — the app fails fast at startup if
they are missing (`AppConfig.assertValid()`).

```bash
flutter pub get

# dev
flutter run --flavor dev --dart-define=ENV=dev \
  --dart-define=API_URL=https://your-dev-api.example.com
```

### Test & analyze

```bash
flutter analyze
flutter test
```

### Project layout

```
lib/
  core/        config, api client, routing, location, fcm, storage, theme, l10n
  features/    auth, user, request, donation, home  (data / presentation per feature)
  firebase/    per-env Firebase options (gitignored; see *.example)
```

## Contributing

Contributions are welcome — see [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Privacy & terms

- [Privacy policy](PRIVACY.md)
- [Terms of service](TERMS.md)
- [Account deletion](ACCOUNT_DELETION.md)

## License

Licensed under the **GNU General Public License v3.0** — see [`LICENSE`](LICENSE).
