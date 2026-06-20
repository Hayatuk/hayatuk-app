// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accepted_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AcceptedRequest _$AcceptedRequestFromJson(Map<String, dynamic> json) =>
    _AcceptedRequest(
      id: json['id'] as String,
      requesterId: json['requester_id'] as String,
      bloodType: json['blood_type'] as String,
      productType: json['product_type'] as String,
      status: json['status'] as String,
      notes: json['notes'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      unitsNeeded: (json['units_needed'] as num).toInt(),
      unitsAccepted: (json['units_accepted'] as num).toInt(),
      unitsDonated: (json['units_donated'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      fulfilledAt: json['fulfilled_at'] == null
          ? null
          : DateTime.parse(json['fulfilled_at'] as String),
      acceptedAt: DateTime.parse(json['accepted_at'] as String),
      donatedAt: json['donated_at'] == null
          ? null
          : DateTime.parse(json['donated_at'] as String),
      requesterName: json['requester_name'] as String?,
      requesterPhone: json['requester_phone'] as String?,
    );

Map<String, dynamic> _$AcceptedRequestToJson(_AcceptedRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requester_id': instance.requesterId,
      'blood_type': instance.bloodType,
      'product_type': instance.productType,
      'status': instance.status,
      'notes': instance.notes,
      'lat': instance.lat,
      'lng': instance.lng,
      'units_needed': instance.unitsNeeded,
      'units_accepted': instance.unitsAccepted,
      'units_donated': instance.unitsDonated,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'fulfilled_at': instance.fulfilledAt?.toIso8601String(),
      'accepted_at': instance.acceptedAt.toIso8601String(),
      'donated_at': instance.donatedAt?.toIso8601String(),
      'requester_name': instance.requesterName,
      'requester_phone': instance.requesterPhone,
    };
