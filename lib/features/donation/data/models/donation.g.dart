// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Donation _$DonationFromJson(Map<String, dynamic> json) => _Donation(
  id: json['id'] as String,
  requestId: json['request_id'] as String,
  donorId: json['donor_id'] as String,
  requesterId: json['requester_id'] as String,
  donatedAt: DateTime.parse(json['donated_at'] as String),
  confirmedAt: json['confirmed_at'] == null
      ? null
      : DateTime.parse(json['confirmed_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$DonationToJson(_Donation instance) => <String, dynamic>{
  'id': instance.id,
  'request_id': instance.requestId,
  'donor_id': instance.donorId,
  'requester_id': instance.requesterId,
  'donated_at': instance.donatedAt.toIso8601String(),
  'confirmed_at': instance.confirmedAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};
