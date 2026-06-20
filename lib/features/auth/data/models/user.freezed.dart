// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get email; String? get phone; String get name; String? get region;@JsonKey(name: 'blood_type') String get bloodType;@JsonKey(name: 'is_donor_active') bool get isDonorActive;@JsonKey(name: 'last_donation_date') DateTime? get lastDonationDate;@JsonKey(name: 'cooldown_until') DateTime? get cooldownUntil;@JsonKey(name: 'fcm_token') String? get fcmToken;@JsonKey(name: 'last_seen_at') DateTime get lastSeenAt;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.isDonorActive, isDonorActive) || other.isDonorActive == isDonorActive)&&(identical(other.lastDonationDate, lastDonationDate) || other.lastDonationDate == lastDonationDate)&&(identical(other.cooldownUntil, cooldownUntil) || other.cooldownUntil == cooldownUntil)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,phone,name,region,bloodType,isDonorActive,lastDonationDate,cooldownUntil,fcmToken,lastSeenAt,createdAt,updatedAt);

@override
String toString() {
  return 'User(id: $id, email: $email, phone: $phone, name: $name, region: $region, bloodType: $bloodType, isDonorActive: $isDonorActive, lastDonationDate: $lastDonationDate, cooldownUntil: $cooldownUntil, fcmToken: $fcmToken, lastSeenAt: $lastSeenAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String email, String? phone, String name, String? region,@JsonKey(name: 'blood_type') String bloodType,@JsonKey(name: 'is_donor_active') bool isDonorActive,@JsonKey(name: 'last_donation_date') DateTime? lastDonationDate,@JsonKey(name: 'cooldown_until') DateTime? cooldownUntil,@JsonKey(name: 'fcm_token') String? fcmToken,@JsonKey(name: 'last_seen_at') DateTime lastSeenAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? phone = freezed,Object? name = null,Object? region = freezed,Object? bloodType = null,Object? isDonorActive = null,Object? lastDonationDate = freezed,Object? cooldownUntil = freezed,Object? fcmToken = freezed,Object? lastSeenAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,isDonorActive: null == isDonorActive ? _self.isDonorActive : isDonorActive // ignore: cast_nullable_to_non_nullable
as bool,lastDonationDate: freezed == lastDonationDate ? _self.lastDonationDate : lastDonationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,cooldownUntil: freezed == cooldownUntil ? _self.cooldownUntil : cooldownUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String? phone,  String name,  String? region, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'is_donor_active')  bool isDonorActive, @JsonKey(name: 'last_donation_date')  DateTime? lastDonationDate, @JsonKey(name: 'cooldown_until')  DateTime? cooldownUntil, @JsonKey(name: 'fcm_token')  String? fcmToken, @JsonKey(name: 'last_seen_at')  DateTime lastSeenAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.phone,_that.name,_that.region,_that.bloodType,_that.isDonorActive,_that.lastDonationDate,_that.cooldownUntil,_that.fcmToken,_that.lastSeenAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String? phone,  String name,  String? region, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'is_donor_active')  bool isDonorActive, @JsonKey(name: 'last_donation_date')  DateTime? lastDonationDate, @JsonKey(name: 'cooldown_until')  DateTime? cooldownUntil, @JsonKey(name: 'fcm_token')  String? fcmToken, @JsonKey(name: 'last_seen_at')  DateTime lastSeenAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.email,_that.phone,_that.name,_that.region,_that.bloodType,_that.isDonorActive,_that.lastDonationDate,_that.cooldownUntil,_that.fcmToken,_that.lastSeenAt,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String? phone,  String name,  String? region, @JsonKey(name: 'blood_type')  String bloodType, @JsonKey(name: 'is_donor_active')  bool isDonorActive, @JsonKey(name: 'last_donation_date')  DateTime? lastDonationDate, @JsonKey(name: 'cooldown_until')  DateTime? cooldownUntil, @JsonKey(name: 'fcm_token')  String? fcmToken, @JsonKey(name: 'last_seen_at')  DateTime lastSeenAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.phone,_that.name,_that.region,_that.bloodType,_that.isDonorActive,_that.lastDonationDate,_that.cooldownUntil,_that.fcmToken,_that.lastSeenAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.email, this.phone, required this.name, this.region, @JsonKey(name: 'blood_type') required this.bloodType, @JsonKey(name: 'is_donor_active') required this.isDonorActive, @JsonKey(name: 'last_donation_date') this.lastDonationDate, @JsonKey(name: 'cooldown_until') this.cooldownUntil, @JsonKey(name: 'fcm_token') this.fcmToken, @JsonKey(name: 'last_seen_at') required this.lastSeenAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String email;
@override final  String? phone;
@override final  String name;
@override final  String? region;
@override@JsonKey(name: 'blood_type') final  String bloodType;
@override@JsonKey(name: 'is_donor_active') final  bool isDonorActive;
@override@JsonKey(name: 'last_donation_date') final  DateTime? lastDonationDate;
@override@JsonKey(name: 'cooldown_until') final  DateTime? cooldownUntil;
@override@JsonKey(name: 'fcm_token') final  String? fcmToken;
@override@JsonKey(name: 'last_seen_at') final  DateTime lastSeenAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region)&&(identical(other.bloodType, bloodType) || other.bloodType == bloodType)&&(identical(other.isDonorActive, isDonorActive) || other.isDonorActive == isDonorActive)&&(identical(other.lastDonationDate, lastDonationDate) || other.lastDonationDate == lastDonationDate)&&(identical(other.cooldownUntil, cooldownUntil) || other.cooldownUntil == cooldownUntil)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,phone,name,region,bloodType,isDonorActive,lastDonationDate,cooldownUntil,fcmToken,lastSeenAt,createdAt,updatedAt);

@override
String toString() {
  return 'User(id: $id, email: $email, phone: $phone, name: $name, region: $region, bloodType: $bloodType, isDonorActive: $isDonorActive, lastDonationDate: $lastDonationDate, cooldownUntil: $cooldownUntil, fcmToken: $fcmToken, lastSeenAt: $lastSeenAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String? phone, String name, String? region,@JsonKey(name: 'blood_type') String bloodType,@JsonKey(name: 'is_donor_active') bool isDonorActive,@JsonKey(name: 'last_donation_date') DateTime? lastDonationDate,@JsonKey(name: 'cooldown_until') DateTime? cooldownUntil,@JsonKey(name: 'fcm_token') String? fcmToken,@JsonKey(name: 'last_seen_at') DateTime lastSeenAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? phone = freezed,Object? name = null,Object? region = freezed,Object? bloodType = null,Object? isDonorActive = null,Object? lastDonationDate = freezed,Object? cooldownUntil = freezed,Object? fcmToken = freezed,Object? lastSeenAt = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,bloodType: null == bloodType ? _self.bloodType : bloodType // ignore: cast_nullable_to_non_nullable
as String,isDonorActive: null == isDonorActive ? _self.isDonorActive : isDonorActive // ignore: cast_nullable_to_non_nullable
as bool,lastDonationDate: freezed == lastDonationDate ? _self.lastDonationDate : lastDonationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,cooldownUntil: freezed == cooldownUntil ? _self.cooldownUntil : cooldownUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,lastSeenAt: null == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
