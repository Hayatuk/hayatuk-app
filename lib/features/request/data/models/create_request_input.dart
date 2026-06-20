class CreateRequestInput {
  final String bloodType;
  final String productType;
  final double lat;
  final double lng;
  final String? notes;
  final String phone;
  final int unitsNeeded;

  CreateRequestInput({
    required this.bloodType,
    required this.productType,
    required this.lat,
    required this.lng,
    this.notes,
    required this.phone,
    required this.unitsNeeded,
  });

  Map<String, dynamic> toJson() => {
    'blood_type': bloodType,
    'product_type': productType,
    'lat': lat,
    'lng': lng,
    if (notes != null && notes!.isNotEmpty) 'notes': notes,
    'units_needed': unitsNeeded,
    'phone': phone,
  };
}
