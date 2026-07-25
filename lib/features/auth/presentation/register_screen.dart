import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hayatuk/core/blood/blood_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/core/validators/validators.dart';
import 'package:hayatuk/features/auth/presentation/auth_providers.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

const _termsUrl = 'https://hayatuk.org/terms.html';
const _privacyUrl = 'https://hayatuk.org/privacy.html';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _bloodType;
  bool _obscurePassword = true;
  bool _acceptedTerms = false;
  late final TapGestureRecognizer _termsRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    _termsRecognizer = TapGestureRecognizer()
      ..onTap = () => _openUrl(_termsUrl);
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () => _openUrl(_privacyUrl);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _termsRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_bloodType == null) return;

    ref
        .read(authControllerProvider.notifier)
        .register(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          name: _nameController.text.trim(),
          bloodType: _bloodType!,
          lang: Localizations.localeOf(context).languageCode,
          phone: _phoneController.text.trim().isEmpty
              ? null
              : _phoneController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final auth = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.registerTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: l10n.name,
                    errorText: auth.fieldErrors?['name'],
                  ),
                  validator: (v) => Validators.required(v, l10n),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  decoration: InputDecoration(
                    labelText: l10n.email,
                    errorText: auth.fieldErrors?['email'],
                  ),
                  validator: (v) => Validators.email(v, l10n),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: l10n.password,
                    helperText: l10n.passwordHelperMinChars,
                    errorText: auth.fieldErrors?['password'],
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                  validator: (v) => Validators.password(v, l10n),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _bloodType,
                  decoration: InputDecoration(
                    labelText: l10n.bloodType,
                    errorText: auth.fieldErrors?['blood_type'],
                  ),
                  items: bloodTypes
                      .map(
                        (t) => DropdownMenuItem(
                          value: t,
                          child: Text(bloodTypeLabel(t)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _bloodType = v),
                  validator: (v) => Validators.required(v, l10n),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  decoration: InputDecoration(labelText: l10n.phoneOptional),
                  validator: (v) => Validators.phone(v, l10n, required: false),
                ),
                const SizedBox(height: 16),
                FormField<bool>(
                  initialValue: _acceptedTerms,
                  validator: (v) => v == true ? null : l10n.termsAcceptRequired,
                  builder: (field) {
                    final theme = Theme.of(context);
                    final linkStyle = TextStyle(
                      color: theme.colorScheme.primary,
                      decoration: TextDecoration.underline,
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: _acceptedTerms,
                              isError: field.hasError,
                              onChanged: (v) {
                                setState(() => _acceptedTerms = v ?? false);
                                field.didChange(_acceptedTerms);
                              },
                            ),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: l10n.termsAgreementPrefix,
                                  children: [
                                    TextSpan(
                                      text: l10n.termsOfUse,
                                      style: linkStyle,
                                      recognizer: _termsRecognizer,
                                    ),
                                    TextSpan(
                                      text: l10n.termsAgreementConjunction,
                                    ),
                                    TextSpan(
                                      text: l10n.privacyPolicy,
                                      style: linkStyle,
                                      recognizer: _privacyRecognizer,
                                    ),
                                  ],
                                ),
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        if (field.hasError)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 12,
                              top: 4,
                            ),
                            child: Text(
                              field.errorText!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.error,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                if (auth.error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      auth.error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: auth.isLoading ? null : _submit,
                    child: auth.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(l10n.registerButton),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(l10n.registerHasAccount),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
