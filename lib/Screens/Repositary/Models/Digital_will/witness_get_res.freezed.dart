// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'witness_get_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WitnessgetResponse _$WitnessgetResponseFromJson(Map<String, dynamic> json) {
  return _WitnessgetResponse.fromJson(json);
}

/// @nodoc
mixin _$WitnessgetResponse {
  bool get success => throw _privateConstructorUsedError;
  List<Witness> get witnesses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WitnessgetResponseCopyWith<WitnessgetResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WitnessgetResponseCopyWith<$Res> {
  factory $WitnessgetResponseCopyWith(
          WitnessgetResponse value, $Res Function(WitnessgetResponse) then) =
      _$WitnessgetResponseCopyWithImpl<$Res, WitnessgetResponse>;
  @useResult
  $Res call({bool success, List<Witness> witnesses});
}

/// @nodoc
class _$WitnessgetResponseCopyWithImpl<$Res, $Val extends WitnessgetResponse>
    implements $WitnessgetResponseCopyWith<$Res> {
  _$WitnessgetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? witnesses = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      witnesses: null == witnesses
          ? _value.witnesses
          : witnesses // ignore: cast_nullable_to_non_nullable
              as List<Witness>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WitnessgetResponseImplCopyWith<$Res>
    implements $WitnessgetResponseCopyWith<$Res> {
  factory _$$WitnessgetResponseImplCopyWith(_$WitnessgetResponseImpl value,
          $Res Function(_$WitnessgetResponseImpl) then) =
      __$$WitnessgetResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<Witness> witnesses});
}

/// @nodoc
class __$$WitnessgetResponseImplCopyWithImpl<$Res>
    extends _$WitnessgetResponseCopyWithImpl<$Res, _$WitnessgetResponseImpl>
    implements _$$WitnessgetResponseImplCopyWith<$Res> {
  __$$WitnessgetResponseImplCopyWithImpl(_$WitnessgetResponseImpl _value,
      $Res Function(_$WitnessgetResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? witnesses = null,
  }) {
    return _then(_$WitnessgetResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      witnesses: null == witnesses
          ? _value._witnesses
          : witnesses // ignore: cast_nullable_to_non_nullable
              as List<Witness>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WitnessgetResponseImpl implements _WitnessgetResponse {
  _$WitnessgetResponseImpl(
      {required this.success, required final List<Witness> witnesses})
      : _witnesses = witnesses;

  factory _$WitnessgetResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WitnessgetResponseImplFromJson(json);

  @override
  final bool success;
  final List<Witness> _witnesses;
  @override
  List<Witness> get witnesses {
    if (_witnesses is EqualUnmodifiableListView) return _witnesses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_witnesses);
  }

  @override
  String toString() {
    return 'WitnessgetResponse(success: $success, witnesses: $witnesses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WitnessgetResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality()
                .equals(other._witnesses, _witnesses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_witnesses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WitnessgetResponseImplCopyWith<_$WitnessgetResponseImpl> get copyWith =>
      __$$WitnessgetResponseImplCopyWithImpl<_$WitnessgetResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WitnessgetResponseImplToJson(
      this,
    );
  }
}

abstract class _WitnessgetResponse implements WitnessgetResponse {
  factory _WitnessgetResponse(
      {required final bool success,
      required final List<Witness> witnesses}) = _$WitnessgetResponseImpl;

  factory _WitnessgetResponse.fromJson(Map<String, dynamic> json) =
      _$WitnessgetResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<Witness> get witnesses;
  @override
  @JsonKey(ignore: true)
  _$$WitnessgetResponseImplCopyWith<_$WitnessgetResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Witness _$WitnessFromJson(Map<String, dynamic> json) {
  return _Witness.fromJson(json);
}

/// @nodoc
mixin _$Witness {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WitnessCopyWith<Witness> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WitnessCopyWith<$Res> {
  factory $WitnessCopyWith(Witness value, $Res Function(Witness) then) =
      _$WitnessCopyWithImpl<$Res, Witness>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String mobile,
      String address,
      bool verified});
}

/// @nodoc
class _$WitnessCopyWithImpl<$Res, $Val extends Witness>
    implements $WitnessCopyWith<$Res> {
  _$WitnessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? mobile = null,
    Object? address = null,
    Object? verified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WitnessImplCopyWith<$Res> implements $WitnessCopyWith<$Res> {
  factory _$$WitnessImplCopyWith(
          _$WitnessImpl value, $Res Function(_$WitnessImpl) then) =
      __$$WitnessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String mobile,
      String address,
      bool verified});
}

/// @nodoc
class __$$WitnessImplCopyWithImpl<$Res>
    extends _$WitnessCopyWithImpl<$Res, _$WitnessImpl>
    implements _$$WitnessImplCopyWith<$Res> {
  __$$WitnessImplCopyWithImpl(
      _$WitnessImpl _value, $Res Function(_$WitnessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? mobile = null,
    Object? address = null,
    Object? verified = null,
  }) {
    return _then(_$WitnessImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WitnessImpl implements _Witness {
  _$WitnessImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.mobile,
      required this.address,
      required this.verified});

  factory _$WitnessImpl.fromJson(Map<String, dynamic> json) =>
      _$$WitnessImplFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String mobile;
  @override
  final String address;
  @override
  final bool verified;

  @override
  String toString() {
    return 'Witness(id: $id, firstName: $firstName, lastName: $lastName, mobile: $mobile, address: $address, verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WitnessImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.verified, verified) ||
                other.verified == verified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, firstName, lastName, mobile, address, verified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WitnessImplCopyWith<_$WitnessImpl> get copyWith =>
      __$$WitnessImplCopyWithImpl<_$WitnessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WitnessImplToJson(
      this,
    );
  }
}

abstract class _Witness implements Witness {
  factory _Witness(
      {required final int id,
      required final String firstName,
      required final String lastName,
      required final String mobile,
      required final String address,
      required final bool verified}) = _$WitnessImpl;

  factory _Witness.fromJson(Map<String, dynamic> json) = _$WitnessImpl.fromJson;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get mobile;
  @override
  String get address;
  @override
  bool get verified;
  @override
  @JsonKey(ignore: true)
  _$$WitnessImplCopyWith<_$WitnessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
