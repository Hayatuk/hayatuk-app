import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/core/validators/validators.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';

const _bloodTypes = [
  'A_POS',
  'A_NEG',
  'B_POS',
  'B_NEG',
  'AB_POS',
  'AB_NEG',
  'O_POS',
  'O_NEG',
];

String _bloodTypeLabel(String value) {
  return switch (value) {
    'A_POS' => 'A+',
    'A_NEG' => 'A-',
    'B_POS' => 'B+',
    'B_NEG' => 'B-',
    'AB_POS' => 'AB+',
    'AB_NEG' => 'AB-',
    'O_POS' => 'O+',
    'O_NEG' => 'O-',
    _ => value,
  };
}

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _bloodType;
  bool _initialized = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _initializeFields() {
    if (_initialized) return;
    final user = ref.read(userControllerProvider).user;
    if (user != null) {
      _nameController.text = user.name;
      _phoneController.text = user.phone ?? '';
      _bloodType = user.bloodType;
      _initialized = true;
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_bloodType == null) return;

    await ref
        .read(userControllerProvider.notifier)
        .updateProfile(
          name: _nameController.text.trim(),
          bloodType: _bloodType!,
          phone: _phoneController.text.trim(),
        );

    final state = ref.read(userControllerProvider);
    if (state.error == null && state.fieldErrors == null && mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeFields();
    final l10n = AppLocalizations.of(context)!;
    final user = ref.watch(userControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.editProfileTitle)),
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
                    errorText: user.fieldErrors?['name'],
                  ),
                  validator: (v) => Validators.required(v, l10n),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _bloodType,
                  decoration: InputDecoration(
                    labelText: l10n.bloodType,
                    errorText: user.fieldErrors?['blood_type'],
                  ),
                  items: _bloodTypes
                      .map(
                        (t) => DropdownMenuItem(
                          value: t,
                          child: Text(_bloodTypeLabel(t)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _bloodType = v),
                  validator: (v) => v == null ? l10n.required : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(labelText: l10n.contactPhone),
                  validator: (v) {
                    final phone = v?.trim() ?? '';
                    if (phone.isEmpty) return null;
                    if (phone.length != 10) {
                      return l10n.phoneRequiredDigits;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                if (user.error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      user.error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: user.isLoading ? null : _submit,
                    child: user.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(l10n.save),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
