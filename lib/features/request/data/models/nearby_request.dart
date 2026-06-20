import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_request.freezed.dart';

part 'nearby_request.g.dart';

@freezed
sealed class NearbyRequest with _$NearbyRequest {
  const factory NearbyRequest({
    required String id,
    @JsonKey(name: 'blood_type') required String bloodType,
    @JsonKey(name: 'product_type') required String productType,
    String? notes,
    required double lat,
    required double lng,
    @JsonKey(name: 'distance_m') required double distanceM,
    @JsonKey(name: 'units_needed') required int unitsNeeded,
    @JsonKey(name: 'units_accepted') required int unitsAccepted,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NearbyRequest;

  factory NearbyRequest.fromJson(Map<String, dynamic> json) =>
      _$NearbyRequestFromJson(json);
}
