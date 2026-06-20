import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/core/location/fuzzy.dart';
import 'package:hayatuk/core/location/location_error_type.dart';
import 'package:hayatuk/core/location/location_exception.dart';
import 'package:hayatuk/core/location/location_service.dart';
import 'package:hayatuk/core/validators/validators.dart';
import 'package:hayatuk/features/request/data/models/create_request_input.dart';
import 'package:hayatuk/features/request/presentation/request_providers.dart';
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

const _productTypes = ['whole_blood', 'platelets'];
String _productTypeLabel(AppLocalizations l10n, String value) {
  return switch (value) {
    'whole_blood' => l10n.productWholeBlood,
    'platelets' => l10n.productPlatelets,
    _ => value,
  };
}

class CreateRequestScreen extends ConsumerStatefulWidget {
  const CreateRequestScreen({super.key});

  @override
  ConsumerState<CreateRequestScreen> createState() =>
      _CreateRequestScreenState();
}

class _CreateRequestScreenState extends ConsumerState<CreateRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();
  final _phoneController = TextEditingController();
  String? _bloodType;
  String _productType = 'whole_blood';
  int _unitsNeeded = 1;
  double? _lat;
  double? _lng;
  bool _locationLoading = false;
  String? _locationError;

  final _locationService = LocationService();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickLocation() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() {
      _locationLoading = true;
      _locationError = null;
    });

    try {
      final position = await _locationService.getCurrentPosition();
      setState(() {
        _lat = position.latitude;
        _lng = position.longitude;
        _locationLoading = false;
      });
    } on LocationException catch (e) {
      if (!mounted) return;
      setState(() {
        _locationError = switch (e.type) {
          LocationErrorType.servicesDisabled => l10n.locationServicesDisabled,
          LocationErrorType.permissionDenied => l10n.locationPermissionDenied,
          LocationErrorType.permissionDeniedForever =>
            l10n.locationPermissionDeniedForever,
          LocationErrorType.timeout => l10n.locationTimeout,
        };
        _locationLoading = false;
      });
    } catch (e) {
      setState(() {
        _locationError = 'Failed to get location';
        _locationLoading = false;
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_bloodType == null) return;
    if (_lat == null || _lng == null) {
      setState(() => _locationError = AppLocalizations.of(context)!.required);
      return;
    }

    final notes = _notesController.text.trim();

    final created = await ref
        .read(requestsControllerProvider.notifier)
        .create(
          CreateRequestInput(
            bloodType: _bloodType!,
            productType: _productType,
            lat: fuzzyCoordinate(_lat!),
            lng: fuzzyCoordinate(_lng!),
            notes: notes.isEmpty ? null : notes,
            unitsNeeded: _unitsNeeded,
            phone: _phoneController.text.trim(),
          ),
        );

    if (created != null && mounted) {
      context.pop();
    }
    ref.read(userControllerProvider.notifier).refreshUser();
  }

  @override
  void initState() {
    super.initState();
    final userPhone = ref.read(userControllerProvider).user?.phone;
    if (userPhone != null) _phoneController.text = userPhone;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(requestsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.createRequestTitle)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 8),
                SegmentedButton<String>(
                  segments: _productTypes
                      .map(
                        (p) => ButtonSegment(
                          value: p,
                          label: Text(_productTypeLabel(l10n, p)),
                          icon: Icon(
                            p == 'platelets'
                                ? Icons.water_drop_outlined
                                : Icons.bloodtype,
                          ),
                        ),
                      )
                      .toList(),
                  selected: {_productType},
                  onSelectionChanged: (set) =>
                      setState(() => _productType = set.first),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _bloodType,
                  decoration: InputDecoration(labelText: l10n.bloodType),
                  items: _bloodTypes
                      .map(
                        (t) => DropdownMenuItem(
                          value: t,
                          child: Text(_bloodTypeLabel(t)),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() => _bloodType = v),
                  validator: (v) => Validators.required(v, l10n),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.unitsNeeded,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: _unitsNeeded > 1
                          ? () => setState(() => _unitsNeeded--)
                          : null,
                      icon: const Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 48,
                      child: Text(
                        '$_unitsNeeded',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: _unitsNeeded < 10
                          ? () => setState(() => _unitsNeeded++)
                          : null,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _LocationPicker(
                  lat: _lat,
                  lng: _lng,
                  isLoading: _locationLoading,
                  error: _locationError,
                  onPickLocation: _pickLocation,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    labelText: l10n.contactPhone,
                    helperText: l10n.contactPhoneHelper,
                  ),
                  validator: (v) {
                    final phone = v?.trim() ?? '';
                    if (phone.isEmpty) return l10n.required;
                    if (phone.length != 10) return l10n.phoneRequiredDigits;
                    if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
                      return l10n.phoneDigitsOnly;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: l10n.notesOptional,
                    hintText: l10n.notesHint,
                  ),
                ),
                const SizedBox(height: 24),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      state.error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: state.isLoading ? null : _submit,
                    child: state.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(l10n.createRequestButton),
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

class _LocationPicker extends StatelessWidget {
  final double? lat;
  final double? lng;
  final bool isLoading;
  final String? error;
  final VoidCallback onPickLocation;

  const _LocationPicker({
    required this.lat,
    required this.lng,
    required this.isLoading,
    required this.error,
    required this.onPickLocation,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hasLocation = lat != null && lng != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OutlinedButton.icon(
          onPressed: isLoading ? null : onPickLocation,
          icon: isLoading
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Icon(hasLocation ? Icons.check : Icons.my_location),
          label: Text(hasLocation ? l10n.locationCaptured : l10n.useMyLocation),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
          ),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              error!,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
