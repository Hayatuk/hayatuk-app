// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  name: json['name'] as String,
  region: json['region'] as String?,
  bloodType: json['blood_type'] as String,
  isDonorActive: json['is_donor_active'] as bool,
  lastDonationDate: json['last_donation_date'] == null
      ? null
      : DateTime.parse(json['last_donation_date'] as String),
  cooldownUntil: json['cooldown_until'] == null
      ? null
      : DateTime.parse(json['cooldown_until'] as String),
  fcmToken: json['fcm_token'] as String?,
  lastSeenAt: DateTime.parse(json['last_seen_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'phone': instance.phone,
  'name': instance.name,
  'region': instance.region,
  'blood_type': instance.bloodType,
  'is_donor_active': instance.isDonorActive,
  'last_donation_date': instance.lastDonationDate?.toIso8601String(),
  'cooldown_until': instance.cooldownUntil?.toIso8601String(),
  'fcm_token': instance.fcmToken,
  'last_seen_at': instance.lastSeenAt.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
