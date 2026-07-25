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
