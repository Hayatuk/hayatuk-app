// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyRequest {

 String get id;@JsonKey(name: 'blood_type') String get bloodType;@JsonKey(name: 'product_type') String get productType; String? get notes; double get lat; double get lng;@JsonKey(name: 'distance_m') double get distanceM;@JsonKey(name: 'units_needed') int get unitsNeeded;@JsonKey(name: 'units_accepted') int get unitsAccepted;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of NearbyRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NearbyRequestCopyWith<NearbyRequest> get copyWith => _$NearbyRequestCopyWithImpl<NearbyRequest>(this as NearbyRequest, _$identity);

  /// Serializes this NearbyRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NearbyRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.unitsNeeded, unitsNeeded) || other.unitsNeeded == unitsNeeded)&&(identical(other.unitsAccepted, unitsAccepted) || other.unitsAccepted == unitsAccepted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bloodType,productType,notes,lat,lng,distanceM,unitsNeeded,unitsAccepted,createdAt);

@override
String toString() {
  return 'NearbyRequest(id: $id, bloodType: $bloodType, productType: $productType, notes: $notes, lat: $lat, lng: $lng, distanceM: $distanceM, unitsNeeded: $unitsNeeded, unitsAccepted: $unitsAccepted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $NearbyRequestCopyWith<$Res>  {
  factory $NearbyRequestCopyWith(NearbyRequest value, $Res Function(NearbyRequest) _then) = _$NearbyRequestCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'blood_type') String bloodType,@JsonKey(name: 'product_type') String productType, String? notes, double lat, double lng,@JsonKey(name: 'distance_m') double distanceM,@JsonKey(name: 'units_needed') int unitsNeeded,@JsonKey(name: 'units_accepted') int unitsAccepted,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$NearbyRequestCopyWithImpl<$Res>
    implements $NearbyRequestCopyWith<$Res> {
  _$NearbyRequestCopyWithImpl(this._self, this._then);

  final NearbyRequest _self;
  final $Res Function(NearbyRequest) _then;

/// Create a copy of NearbyRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? bloodType = null,Object? productType = null,Object? notes = freezed,Object? lat = null,Object? lng = null,Object? distanceM = null,Object? unitsNeeded = null,Object? unitsAccepted = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,unitsNeeded: null == unitsNeeded ? _self.unitsNeeded : unitsNeeded // ignore: cast_nullable_to_non_nullable
as int,unitsAccepted: null == unitsAccepted ? _self.unitsAccepted : unitsAccepted // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NearbyRequest].
extension NearbyRequestPatterns on NearbyRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NearbyRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NearbyRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NearbyRequest value)  $default,){
final _that = this;
switch (_that) {
case _NearbyRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NearbyRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NearbyRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'product_type')  String productType,  String? notes,  double lat,  double lng, @JsonKey(name: 'distance_m')  double distanceM, @JsonKey(name: 'units_needed')  int unitsNeeded, @JsonKey(name: 'units_accepted')  int unitsAccepted, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NearbyRequest() when $default != null:
return $default(_that.id,_that.bloodType,_that.productType,_that.notes,_that.lat,_that.lng,_that.distanceM,_that.unitsNeeded,_that.unitsAccepted,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'product_type')  String productType,  String? notes,  double lat,  double lng, @JsonKey(name: 'distance_m')  double distanceM, @JsonKey(name: 'units_needed')  int unitsNeeded, @JsonKey(name: 'units_accepted')  int unitsAccepted, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _NearbyRequest():
return $default(_that.id,_that.bloodType,_that.productType,_that.notes,_that.lat,_that.lng,_that.distanceM,_that.unitsNeeded,_that.unitsAccepted,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'product_type')  String productType,  String? notes,  double lat,  double lng, @JsonKey(name: 'distance_m')  double distanceM, @JsonKey(name: 'units_needed')  int unitsNeeded, @JsonKey(name: 'units_accepted')  int unitsAccepted, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NearbyRequest() when $default != null:
return $default(_that.id,_that.bloodType,_that.productType,_that.notes,_that.lat,_that.lng,_that.distanceM,_that.unitsNeeded,_that.unitsAccepted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NearbyRequest implements NearbyRequest {
  const _NearbyRequest({required this.id, @JsonKey(name: 'blood_type') required this.bloodType, @JsonKey(name: 'product_type') required this.productType, this.notes, required this.lat, required this.lng, @JsonKey(name: 'distance_m') required this.distanceM, @JsonKey(name: 'units_needed') required this.unitsNeeded, @JsonKey(name: 'units_accepted') required this.unitsAccepted, @JsonKey(name: 'created_at') required this.createdAt});
  factory _NearbyRequest.fromJson(Map<String, dynamic> json) => _$NearbyRequestFromJson(json);

@override final  String id;
@override@JsonKey(name: 'blood_type') final  String bloodType;
@override@JsonKey(name: 'product_type') final  String productType;
@override final  String? notes;
@override final  double lat;
@override final  double lng;
@override@JsonKey(name: 'distance_m') final  double distanceM;
@override@JsonKey(name: 'units_needed') final  int unitsNeeded;
@override@JsonKey(name: 'units_accepted') final  int unitsAccepted;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of NearbyRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NearbyRequestCopyWith<_NearbyRequest> get copyWith => __$NearbyRequestCopyWithImpl<_NearbyRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NearbyRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NearbyRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.productType, productType) || other.productType == productType)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&(identical(other.unitsNeeded, unitsNeeded) || other.unitsNeeded == unitsNeeded)&&(identical(other.unitsAccepted, unitsAccepted) || other.unitsAccepted == unitsAccepted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,bloodType,productType,notes,lat,lng,distanceM,unitsNeeded,unitsAccepted,createdAt);

@override
String toString() {
  return 'NearbyRequest(id: $id, bloodType: $bloodType, productType: $productType, notes: $notes, lat: $lat, lng: $lng, distanceM: $distanceM, unitsNeeded: $unitsNeeded, unitsAccepted: $unitsAccepted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$NearbyRequestCopyWith<$Res> implements $NearbyRequestCopyWith<$Res> {
  factory _$NearbyRequestCopyWith(_NearbyRequest value, $Res Function(_NearbyRequest) _then) = __$NearbyRequestCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'blood_type') String bloodType,@JsonKey(name: 'product_type') String productType, String? notes, double lat, double lng,@JsonKey(name: 'distance_m') double distanceM,@JsonKey(name: 'units_needed') int unitsNeeded,@JsonKey(name: 'units_accepted') int unitsAccepted,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$NearbyRequestCopyWithImpl<$Res>
    implements _$NearbyRequestCopyWith<$Res> {
  __$NearbyRequestCopyWithImpl(this._self, this._then);

  final _NearbyRequest _self;
  final $Res Function(_NearbyRequest) _then;

/// Create a copy of NearbyRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? bloodType = null,Object? productType = null,Object? notes = freezed,Object? lat = null,Object? lng = null,Object? distanceM = null,Object? unitsNeeded = null,Object? unitsAccepted = null,Object? createdAt = null,}) {
  return _then(_NearbyRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,productType: null == productType ? _self.productType : productType // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,distanceM: null == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double,unitsNeeded: null == unitsNeeded ? _self.unitsNeeded : unitsNeeded // ignore: cast_nullable_to_non_nullable
as int,unitsAccepted: null == unitsAccepted ? _self.unitsAccepted : unitsAccepted // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
