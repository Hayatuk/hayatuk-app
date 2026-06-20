// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyRequest _$NearbyRequestFromJson(Map<String, dynamic> json) =>
    _NearbyRequest(
      id: json['id'] as String,
      bloodType: json['blood_type'] as String,
      productType: json['product_type'] as String,
      notes: json['notes'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      distanceM: (json['distance_m'] as num).toDouble(),
      unitsNeeded: (json['units_needed'] as num).toInt(),
      unitsAccepted: (json['units_accepted'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$NearbyRequestToJson(_NearbyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'blood_type': instance.bloodType,
      'product_type': instance.productType,
      'notes': instance.notes,
      'lat': instance.lat,
      'lng': instance.lng,
      'distance_m': instance.distanceM,
      'units_needed': instance.unitsNeeded,
      'units_accepted': instance.unitsAccepted,
      'created_at': instance.createdAt.toIso8601String(),
    };
