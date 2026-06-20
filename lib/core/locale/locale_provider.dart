import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleStorage {
  static const _key = 'app_locale';

  Future<String?> get() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  Future<void> set(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, code);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

class LocaleController extends Notifier<Locale?> {
  final _storage = LocaleStorage();

  @override
  Locale? build() {
    _load();
    return null; // null = follow device locale
  }

  Future<void> _load() async {
    final code = await _storage.get();
    if (code != null) state = Locale(code);
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale == null) {
      await _storage.clear();
    } else {
      await _storage.set(locale.languageCode);
    }
    state = locale;
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale?>(
  LocaleController.new,
);
