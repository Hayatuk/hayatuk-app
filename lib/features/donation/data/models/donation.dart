import 'package:freezed_annotation/freezed_annotation.dart';

part 'donation.freezed.dart';
part 'donation.g.dart';

@freezed
sealed class Donation with _$Donation {
  const factory Donation({
    required String id,
    @JsonKey(name: 'request_id') required String requestId,
    @JsonKey(name: 'donor_id') required String donorId,
    @JsonKey(name: 'requester_id') required String requesterId,
    @JsonKey(name: 'donated_at') required DateTime donatedAt,
    @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _Donation;

  factory Donation.fromJson(Map<String, dynamic> json) =>
      _$DonationFromJson(json);
}
