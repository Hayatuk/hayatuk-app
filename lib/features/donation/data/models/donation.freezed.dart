// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Donation {

 String get id;@JsonKey(name: 'request_id') String get requestId;@JsonKey(name: 'donor_id') String get donorId;@JsonKey(name: 'requester_id') String get requesterId;@JsonKey(name: 'donated_at') DateTime get donatedAt;@JsonKey(name: 'confirmed_at') DateTime? get confirmedAt;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DonationCopyWith<Donation> get copyWith => _$DonationCopyWithImpl<Donation>(this as Donation, _$identity);

  /// Serializes this Donation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Donation&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.donorId, donorId) || other.donorId == donorId)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.donatedAt, donatedAt) || other.donatedAt == donatedAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestId,donorId,requesterId,donatedAt,confirmedAt,createdAt);

@override
String toString() {
  return 'Donation(id: $id, requestId: $requestId, donorId: $donorId, requesterId: $requesterId, donatedAt: $donatedAt, confirmedAt: $confirmedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DonationCopyWith<$Res>  {
  factory $DonationCopyWith(Donation value, $Res Function(Donation) _then) = _$DonationCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'donor_id') String donorId,@JsonKey(name: 'requester_id') String requesterId,@JsonKey(name: 'donated_at') DateTime donatedAt,@JsonKey(name: 'confirmed_at') DateTime? confirmedAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$DonationCopyWithImpl<$Res>
    implements $DonationCopyWith<$Res> {
  _$DonationCopyWithImpl(this._self, this._then);

  final Donation _self;
  final $Res Function(Donation) _then;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requestId = null,Object? donorId = null,Object? requesterId = null,Object? donatedAt = null,Object? confirmedAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,donorId: null == donorId ? _self.donorId : donorId // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,donatedAt: null == donatedAt ? _self.donatedAt : donatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Donation].
extension DonationPatterns on Donation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Donation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Donation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Donation value)  $default,){
final _that = this;
switch (_that) {
case _Donation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Donation value)?  $default,){
final _that = this;
switch (_that) {
case _Donation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'donor_id')  String donorId, @JsonKey(name: 'requester_id')  String requesterId, @JsonKey(name: 'donated_at')  DateTime donatedAt, @JsonKey(name: 'confirmed_at')  DateTime? confirmedAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Donation() when $default != null:
return $default(_that.id,_that.requestId,_that.donorId,_that.requesterId,_that.donatedAt,_that.confirmedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'donor_id')  String donorId, @JsonKey(name: 'requester_id')  String requesterId, @JsonKey(name: 'donated_at')  DateTime donatedAt, @JsonKey(name: 'confirmed_at')  DateTime? confirmedAt, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Donation():
return $default(_that.id,_that.requestId,_that.donorId,_that.requesterId,_that.donatedAt,_that.confirmedAt,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'request_id')  String requestId, @JsonKey(name: 'donor_id')  String donorId, @JsonKey(name: 'requester_id')  String requesterId, @JsonKey(name: 'donated_at')  DateTime donatedAt, @JsonKey(name: 'confirmed_at')  DateTime? confirmedAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Donation() when $default != null:
return $default(_that.id,_that.requestId,_that.donorId,_that.requesterId,_that.donatedAt,_that.confirmedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Donation implements Donation {
  const _Donation({required this.id, @JsonKey(name: 'request_id') required this.requestId, @JsonKey(name: 'donor_id') required this.donorId, @JsonKey(name: 'requester_id') required this.requesterId, @JsonKey(name: 'donated_at') required this.donatedAt, @JsonKey(name: 'confirmed_at') this.confirmedAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Donation.fromJson(Map<String, dynamic> json) => _$DonationFromJson(json);

@override final  String id;
@override@JsonKey(name: 'request_id') final  String requestId;
@override@JsonKey(name: 'donor_id') final  String donorId;
@override@JsonKey(name: 'requester_id') final  String requesterId;
@override@JsonKey(name: 'donated_at') final  DateTime donatedAt;
@override@JsonKey(name: 'confirmed_at') final  DateTime? confirmedAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DonationCopyWith<_Donation> get copyWith => __$DonationCopyWithImpl<_Donation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DonationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Donation&&(identical(other.id, id) || other.id == id)&&(identical(other.requestId, requestId) || other.requestId == requestId)&&(identical(other.donorId, donorId) || other.donorId == donorId)&&(identical(other.requesterId, requesterId) || other.requesterId == requesterId)&&(identical(other.donatedAt, donatedAt) || other.donatedAt == donatedAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestId,donorId,requesterId,donatedAt,confirmedAt,createdAt);

@override
String toString() {
  return 'Donation(id: $id, requestId: $requestId, donorId: $donorId, requesterId: $requesterId, donatedAt: $donatedAt, confirmedAt: $confirmedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DonationCopyWith<$Res> implements $DonationCopyWith<$Res> {
  factory _$DonationCopyWith(_Donation value, $Res Function(_Donation) _then) = __$DonationCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'request_id') String requestId,@JsonKey(name: 'donor_id') String donorId,@JsonKey(name: 'requester_id') String requesterId,@JsonKey(name: 'donated_at') DateTime donatedAt,@JsonKey(name: 'confirmed_at') DateTime? confirmedAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$DonationCopyWithImpl<$Res>
    implements _$DonationCopyWith<$Res> {
  __$DonationCopyWithImpl(this._self, this._then);

  final _Donation _self;
  final $Res Function(_Donation) _then;

/// Create a copy of Donation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requestId = null,Object? donorId = null,Object? requesterId = null,Object? donatedAt = null,Object? confirmedAt = freezed,Object? createdAt = null,}) {
  return _then(_Donation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestId: null == requestId ? _self.requestId : requestId // ignore: cast_nullable_to_non_nullable
as String,donorId: null == donorId ? _self.donorId : donorId // ignore: cast_nullable_to_non_nullable
as String,requesterId: null == requesterId ? _self.requesterId : requesterId // ignore: cast_nullable_to_non_nullable
as String,donatedAt: null == donatedAt ? _self.donatedAt : donatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
