// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blood_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BloodRequest _$BloodRequestFromJson(Map<String, dynamic> json) =>
    _BloodRequest(
      id: json['id'] as String,
      requesterId: json['requester_id'] as String,
      bloodType: json['blood_type'] as String,
      productType: json['product_type'] as String,
      status: json['status'] as String,
      notes: json['notes'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      fulfilledAt: json['fulfilled_at'] == null
          ? null
          : DateTime.parse(json['fulfilled_at'] as String),
      unitsNeeded: (json['units_needed'] as num).toInt(),
      unitsAccepted: (json['units_accepted'] as num).toInt(),
      requesterName: json['requester_name'] as String?,
      requesterPhone: json['requester_phone'] as String?,
    );

Map<String, dynamic> _$BloodRequestToJson(_BloodRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requester_id': instance.requesterId,
      'blood_type': instance.bloodType,
      'product_type': instance.productType,
      'status': instance.status,
      'notes': instance.notes,
      'lat': instance.lat,
      'lng': instance.lng,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'fulfilled_at': instance.fulfilledAt?.toIso8601String(),
      'units_needed': instance.unitsNeeded,
      'units_accepted': instance.unitsAccepted,
      'requester_name': instance.requesterName,
      'requester_phone': instance.requesterPhone,
    };
