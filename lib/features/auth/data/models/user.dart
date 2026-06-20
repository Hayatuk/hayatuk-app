import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String email,
    String? phone,
    required String name,
    String? region,
    @JsonKey(name: 'blood_type') required String bloodType,
    @JsonKey(name: 'is_donor_active') required bool isDonorActive,
    @JsonKey(name: 'last_donation_date') DateTime? lastDonationDate,
    @JsonKey(name: 'cooldown_until') DateTime? cooldownUntil,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'last_seen_at') required DateTime lastSeenAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
