# Hayatuk

Hayatuk is a Flutter app that connects blood donors with nearby blood requests.
Donors see open requests around them on a map and can accept one to coordinate a
donation; requesters can post a need and get notified as donors commit.

> **Privacy first:** a donor's exact GPS location never leaves the device. Only
> a coarse, grid-snapped coordinate is sent to the server (see
> [`PRIVACY.md`](PRIVACY.md) and `lib/core/location/fuzzy.dart`).

## Prerequisites

- Flutter SDK (stable channel) — see `environment.sdk` in `pubspec.yaml`.
- The [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/) for Firebase config.
- A running instance of the backend API (not included in this repo).

## Configuration

The app is built for one of two environments (`dev` / `prod`), selected at build
time. Two kinds of config are required and are **gitignored** (you provide your
own):

### 1. Firebase

Native and Dart Firebase config are not committed. Generate them per environment
with the FlutterFire CLI:

```bash
# dev
flutterfire configure --project=<your-dev-project> \
  --out=lib/firebase/firebase_options_dev.dart \
  --android-package-name=io.github.hayatuk.hayatuk
```

Place the per-flavor `google-services.json` under `android/app/src/dev/` and
`android/app/src/prod/` (see `android/app/src/dev/README.md`). For a quick start
without the CLI, copy the `*.example` templates in `lib/firebase/` and fill in
your values.

### 2. Build-time defines

| Define     | Purpose                         |
|------------|---------------------------------|
| `ENV`      | `dev`                           |
| `API_URL`  | Base URL of the backend API     |

## Run

```bash
flutter pub get

# dev
flutter run --flavor dev --dart-define=ENV=dev \
  --dart-define=API_URL=https://your-dev-api.example.com
```

> The app fails fast at startup if `ENV`/`API_URL` are missing
> (`AppConfig.assertValid()`).

## Test & analyze

```bash
flutter analyze
flutter test
```

## Project layout

```
lib/
  core/        config, api client, routing, location, fcm, storage, theme, l10n
  features/    auth, user, request, donation, home  (data / presentation per feature)
  firebase/    per-env Firebase options (gitignored; see *.example)
```

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md).

## License

Licensed under the **GNU General Public License v3.0** — see [`LICENSE`](LICENSE).
