import 'package:hayatuk/l10n/generated/app_localizations.dart';

class Validators {
  static final _emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
  static final _digitsRegex = RegExp(r'^\d+$');

  static String? phone(
    String? value,
    AppLocalizations l10n, {
    bool required = true,
  }) {
    final phone = value?.trim() ?? '';
    if (phone.isEmpty) return required ? l10n.required : null;
    if (!_digitsRegex.hasMatch(phone)) return l10n.phoneDigitsOnly;
    if (phone.length <= 8 || phone.length >= 12) {
      return l10n.phoneRequiredDigits;
    }
    return null;
  }

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
