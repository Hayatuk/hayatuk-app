import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/core/config/app_config.dart';
import 'package:hayatuk/core/router/app_router.dart';
import 'package:hayatuk/core/theme/app_theme.dart';
import 'package:hayatuk/firebase/firebase_options_dev.dart';
import 'package:hayatuk/firebase/firebase_options_prod.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

import 'core/locale/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.assertValid();
  await Firebase.initializeApp(
    options: switch (AppConfig.env) {
      'dev' => DefaultFirebaseOptionsDev.currentPlatform,
      'prod' => DefaultFirebaseOptionsProd.currentPlatform,
      _ => throw UnsupportedError('ENV is missing'),
    },
  );
  runApp(const ProviderScope(child: MyApp()));
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Hayatuk',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
      locale: locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('fr'), Locale('ar')],
    );
  }
}
