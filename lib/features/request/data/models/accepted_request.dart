import 'package:freezed_annotation/freezed_annotation.dart';

part 'accepted_request.freezed.dart';
part 'accepted_request.g.dart';

@freezed
sealed class AcceptedRequest with _$AcceptedRequest {
  const factory AcceptedRequest({
    required String id,
    @JsonKey(name: 'requester_id') required String requesterId,
    @JsonKey(name: 'blood_type') required String bloodType,
    @JsonKey(name: 'product_type') required String productType,
    required String status,
    String? notes,
    required double lat,
    required double lng,
    @JsonKey(name: 'units_needed') required int unitsNeeded,
    @JsonKey(name: 'units_accepted') required int unitsAccepted,
    @JsonKey(name: 'units_donated') required int unitsDonated,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'fulfilled_at') DateTime? fulfilledAt,
    @JsonKey(name: 'accepted_at') required DateTime acceptedAt,
    @JsonKey(name: 'donated_at') DateTime? donatedAt,
    @JsonKey(name: 'requester_name') String? requesterName,
    @JsonKey(name: 'requester_phone') String? requesterPhone,
  }) = _AcceptedRequest;

  factory AcceptedRequest.fromJson(Map<String, dynamic> json) =>
      _$AcceptedRequestFromJson(json);
}
