import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_request.freezed.dart';

part 'blood_request.g.dart';

@freezed
sealed class BloodRequest with _$BloodRequest {
  const factory BloodRequest({
    required String id,
    @JsonKey(name: 'requester_id') required String requesterId,
    @JsonKey(name: 'blood_type') required String bloodType,
    @JsonKey(name: 'product_type') required String productType,
    required String status,
    String? notes,
    required double lat,
    required double lng,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'fulfilled_at') DateTime? fulfilledAt,
    @JsonKey(name: 'units_needed') required int unitsNeeded,
    @JsonKey(name: 'units_accepted') required int unitsAccepted,
    @JsonKey(name: 'requester_name') String? requesterName,
    @JsonKey(name: 'requester_phone') String? requesterPhone,
  }) = _BloodRequest;

  factory BloodRequest.fromJson(Map<String, dynamic> json) =>
      _$BloodRequestFromJson(json);
}
