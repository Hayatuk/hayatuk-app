import 'package:hayatuk/l10n/generated/app_localizations.dart';

class Validators {
  static final _emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

  static String? email(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) return l10n.required;
    if (!_emailRegex.hasMatch(value.trim())) return l10n.emailInvalid;
    return null;
  }

  static String? password(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) return l10n.required;
    if (value.length < 8) return l10n.passwordTooShort;
    return null;
  }

  static String? required(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) return l10n.required;
    return null;
  }
}
