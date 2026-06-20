// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BloodRequest {

 String get id;@JsonKey(name: 'requester_id') String get requesterId;@JsonKey(name: 'blood_type') String get bloodType;@JsonKey(name: 'product_type') String get productType; String get status; String? get notes; double get lat; double get lng;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;@JsonKey(name: 'fulfilled_at') DateTime? get fulfilledAt;@JsonKey(name: 'units_needed') int get unitsNeeded;@JsonKey(name: 'units_accepted') int get unitsAccepted;@JsonKey(name: 'requester_name') String? get requesterName;@JsonKey(name: 'requester_phone') String? get requesterPhone;
/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BloodRequestCopyWith<BloodRequest> get copyWith => _$BloodRequestCopyWithImpl<BloodRequest>(this as BloodRequest, _$identity);

  /// Serializes this BloodRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BloodRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fulfilledAt, fulfilledAt) || other.fulfilledAt == fulfilledAt)&&(identical(other.unitsNeeded, unitsNeeded) || other.unitsNeeded == unitsNeeded)&&(identical(other.unitsAccepted, unitsAccepted) || other.unitsAccepted == unitsAccepted)&&(identical(other.requesterName, requesterName) || other.requesterName == requesterName)&&(identical(other.requesterPhone, requesterPhone) || other.requesterPhone == requesterPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requesterId,bloodType,productType,status,notes,lat,lng,createdAt,updatedAt,fulfilledAt,unitsNeeded,unitsAccepted,requesterName,requesterPhone);

@override
String toString() {
  return 'BloodRequest(id: $id, requesterId: $requesterId, bloodType: $bloodType, productType: $productType, status: $status, notes: $notes, lat: $lat, lng: $lng, createdAt: $createdAt, updatedAt: $updatedAt, fulfilledAt: $fulfilledAt, unitsNeeded: $unitsNeeded, unitsAccepted: $unitsAccepted, requesterName: $requesterName, requesterPhone: $requesterPhone)';
}


}

/// @nodoc
abstract mixin class $BloodRequestCopyWith<$Res>  {
  factory $BloodRequestCopyWith(BloodRequest value, $Res Function(BloodRequest) _then) = _$BloodRequestCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'requester_id') String requesterId,@JsonKey(name: 'blood_type') String bloodType,@JsonKey(name: 'product_type') String productType, String status, String? notes, double lat, double lng,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'fulfilled_at') DateTime? fulfilledAt,@JsonKey(name: 'units_needed') int unitsNeeded,@JsonKey(name: 'units_accepted') int unitsAccepted,@JsonKey(name: 'requester_name') String? requesterName,@JsonKey(name: 'requester_phone') String? requesterPhone
});




}
/// @nodoc
class _$BloodRequestCopyWithImpl<$Res>
    implements $BloodRequestCopyWith<$Res> {
  _$BloodRequestCopyWithImpl(this._self, this._then);

  final BloodRequest _self;
  final $Res Function(BloodRequest) _then;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requesterId = null,Object? bloodType = null,Object? productType = null,Object? status = null,Object? notes = freezed,Object? lat = null,Object? lng = null,Object? createdAt = null,Object? updatedAt = null,Object? fulfilledAt = freezed,Object? unitsNeeded = null,Object? unitsAccepted = null,Object? requesterName = freezed,Object? requesterPhone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fulfilledAt: freezed == fulfilledAt ? _self.fulfilledAt : fulfilledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unitsNeeded: null == unitsNeeded ? _self.unitsNeeded : unitsNeeded // ignore: cast_nullable_to_non_nullable
as int,unitsAccepted: null == unitsAccepted ? _self.unitsAccepted : unitsAccepted // ignore: cast_nullable_to_non_nullable
as int,requesterName: freezed == requesterName ? _self.requesterName : requesterName // ignore: cast_nullable_to_non_nullable
as String?,requesterPhone: freezed == requesterPhone ? _self.requesterPhone : requesterPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BloodRequest].
extension BloodRequestPatterns on BloodRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BloodRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BloodRequest value)  $default,){
final _that = this;
switch (_that) {
case _BloodRequest():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BloodRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'requester_id')  String requesterId, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'product_type')  String productType,  String status,  String? notes,  double lat,  double lng, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'fulfilled_at')  DateTime? fulfilledAt, @JsonKey(name: 'units_needed')  int unitsNeeded, @JsonKey(name: 'units_accepted')  int unitsAccepted, @JsonKey(name: 'requester_name')  String? requesterName, @JsonKey(name: 'requester_phone')  String? requesterPhone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.id,_that.requesterId,_that.bloodType,_that.productType,_that.status,_that.notes,_that.lat,_that.lng,_that.createdAt,_that.updatedAt,_that.fulfilledAt,_that.unitsNeeded,_that.unitsAccepted,_that.requesterName,_that.requesterPhone);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'requester_id')  String requesterId, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'product_type')  String productType,  String status,  String? notes,  double lat,  double lng, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'fulfilled_at')  DateTime? fulfilledAt, @JsonKey(name: 'units_needed')  int unitsNeeded, @JsonKey(name: 'units_accepted')  int unitsAccepted, @JsonKey(name: 'requester_name')  String? requesterName, @JsonKey(name: 'requester_phone')  String? requesterPhone)  $default,) {final _that = this;
switch (_that) {
case _BloodRequest():
return $default(_that.id,_that.requesterId,_that.bloodType,_that.productType,_that.status,_that.notes,_that.lat,_that.lng,_that.createdAt,_that.updatedAt,_that.fulfilledAt,_that.unitsNeeded,_that.unitsAccepted,_that.requesterName,_that.requesterPhone);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'requester_id')  String requesterId, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'product_type')  String productType,  String status,  String? notes,  double lat,  double lng, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt, @JsonKey(name: 'fulfilled_at')  DateTime? fulfilledAt, @JsonKey(name: 'units_needed')  int unitsNeeded, @JsonKey(name: 'units_accepted')  int unitsAccepted, @JsonKey(name: 'requester_name')  String? requesterName, @JsonKey(name: 'requester_phone')  String? requesterPhone)?  $default,) {final _that = this;
switch (_that) {
case _BloodRequest() when $default != null:
return $default(_that.id,_that.requesterId,_that.bloodType,_that.productType,_that.status,_that.notes,_that.lat,_that.lng,_that.createdAt,_that.updatedAt,_that.fulfilledAt,_that.unitsNeeded,_that.unitsAccepted,_that.requesterName,_that.requesterPhone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BloodRequest implements BloodRequest {
  const _BloodRequest({required this.id, @JsonKey(name: 'requester_id') required this.requesterId, @JsonKey(name: 'blood_type') required this.bloodType, @JsonKey(name: 'product_type') required this.productType, required this.status, this.notes, required this.lat, required this.lng, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'fulfilled_at') this.fulfilledAt, @JsonKey(name: 'units_needed') required this.unitsNeeded, @JsonKey(name: 'units_accepted') required this.unitsAccepted, @JsonKey(name: 'requester_name') this.requesterName, @JsonKey(name: 'requester_phone') this.requesterPhone});
  factory _BloodRequest.fromJson(Map<String, dynamic> json) => _$BloodRequestFromJson(json);

@override final  String id;
@override@JsonKey(name: 'requester_id') final  String requesterId;
@override@JsonKey(name: 'blood_type') final  String bloodType;
@override@JsonKey(name: 'product_type') final  String productType;
@override final  String status;
@override final  String? notes;
@override final  double lat;
@override final  double lng;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;
@override@JsonKey(name: 'fulfilled_at') final  DateTime? fulfilledAt;
@override@JsonKey(name: 'units_needed') final  int unitsNeeded;
@override@JsonKey(name: 'units_accepted') final  int unitsAccepted;
@override@JsonKey(name: 'requester_name') final  String? requesterName;
@override@JsonKey(name: 'requester_phone') final  String? requesterPhone;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BloodRequestCopyWith<_BloodRequest> get copyWith => __$BloodRequestCopyWithImpl<_BloodRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BloodRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BloodRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fulfilledAt, fulfilledAt) || other.fulfilledAt == fulfilledAt)&&(identical(other.unitsNeeded, unitsNeeded) || other.unitsNeeded == unitsNeeded)&&(identical(other.unitsAccepted, unitsAccepted) || other.unitsAccepted == unitsAccepted)&&(identical(other.requesterName, requesterName) || other.requesterName == requesterName)&&(identical(other.requesterPhone, requesterPhone) || other.requesterPhone == requesterPhone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requesterId,bloodType,productType,status,notes,lat,lng,createdAt,updatedAt,fulfilledAt,unitsNeeded,unitsAccepted,requesterName,requesterPhone);

@override
String toString() {
  return 'BloodRequest(id: $id, requesterId: $requesterId, bloodType: $bloodType, productType: $productType, status: $status, notes: $notes, lat: $lat, lng: $lng, createdAt: $createdAt, updatedAt: $updatedAt, fulfilledAt: $fulfilledAt, unitsNeeded: $unitsNeeded, unitsAccepted: $unitsAccepted, requesterName: $requesterName, requesterPhone: $requesterPhone)';
}


}

/// @nodoc
abstract mixin class _$BloodRequestCopyWith<$Res> implements $BloodRequestCopyWith<$Res> {
  factory _$BloodRequestCopyWith(_BloodRequest value, $Res Function(_BloodRequest) _then) = __$BloodRequestCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'requester_id') String requesterId,@JsonKey(name: 'blood_type') String bloodType,@JsonKey(name: 'product_type') String productType, String status, String? notes, double lat, double lng,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt,@JsonKey(name: 'fulfilled_at') DateTime? fulfilledAt,@JsonKey(name: 'units_needed') int unitsNeeded,@JsonKey(name: 'units_accepted') int unitsAccepted,@JsonKey(name: 'requester_name') String? requesterName,@JsonKey(name: 'requester_phone') String? requesterPhone
});




}
/// @nodoc
class __$BloodRequestCopyWithImpl<$Res>
    implements _$BloodRequestCopyWith<$Res> {
  __$BloodRequestCopyWithImpl(this._self, this._then);

  final _BloodRequest _self;
  final $Res Function(_BloodRequest) _then;

/// Create a copy of BloodRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requesterId = null,Object? bloodType = null,Object? productType = null,Object? status = null,Object? notes = freezed,Object? lat = null,Object? lng = null,Object? createdAt = null,Object? updatedAt = null,Object? fulfilledAt = freezed,Object? unitsNeeded = null,Object? unitsAccepted = null,Object? requesterName = freezed,Object? requesterPhone = freezed,}) {
  return _then(_BloodRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fulfilledAt: freezed == fulfilledAt ? _self.fulfilledAt : fulfilledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unitsNeeded: null == unitsNeeded ? _self.unitsNeeded : unitsNeeded // ignore: cast_nullable_to_non_nullable
as int,unitsAccepted: null == unitsAccepted ? _self.unitsAccepted : unitsAccepted // ignore: cast_nullable_to_non_nullable
as int,requesterName: freezed == requesterName ? _self.requesterName : requesterName // ignore: cast_nullable_to_non_nullable
as String?,requesterPhone: freezed == requesterPhone ? _self.requesterPhone : requesterPhone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
