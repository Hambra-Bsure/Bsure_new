// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Get_Nominee_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetNomineeResponse _$GetNomineeResponseFromJson(Map<String, dynamic> json) {
  return _GetNomineeResponse.fromJson(json);
}

/// @nodoc
mixin _$GetNomineeResponse {
  bool? get success => throw _privateConstructorUsedError;
  List<Nominees>? get nominees => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNomineeResponseCopyWith<GetNomineeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNomineeResponseCopyWith<$Res> {
  factory $GetNomineeResponseCopyWith(
          GetNomineeResponse value, $Res Function(GetNomineeResponse) then) =
      _$GetNomineeResponseCopyWithImpl<$Res, GetNomineeResponse>;
  @useResult
  $Res call({bool? success, List<Nominees>? nominees});
}

/// @nodoc
class _$GetNomineeResponseCopyWithImpl<$Res, $Val extends GetNomineeResponse>
    implements $GetNomineeResponseCopyWith<$Res> {
  _$GetNomineeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? nominees = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      nominees: freezed == nominees
          ? _value.nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<Nominees>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetNomineeResponseImplCopyWith<$Res>
    implements $GetNomineeResponseCopyWith<$Res> {
  factory _$$GetNomineeResponseImplCopyWith(_$GetNomineeResponseImpl value,
          $Res Function(_$GetNomineeResponseImpl) then) =
      __$$GetNomineeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, List<Nominees>? nominees});
}

/// @nodoc
class __$$GetNomineeResponseImplCopyWithImpl<$Res>
    extends _$GetNomineeResponseCopyWithImpl<$Res, _$GetNomineeResponseImpl>
    implements _$$GetNomineeResponseImplCopyWith<$Res> {
  __$$GetNomineeResponseImplCopyWithImpl(_$GetNomineeResponseImpl _value,
      $Res Function(_$GetNomineeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? nominees = freezed,
  }) {
    return _then(_$GetNomineeResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      nominees: freezed == nominees
          ? _value._nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<Nominees>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetNomineeResponseImpl implements _GetNomineeResponse {
  _$GetNomineeResponseImpl({this.success, final List<Nominees>? nominees})
      : _nominees = nominees;

  factory _$GetNomineeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetNomineeResponseImplFromJson(json);

  @override
  final bool? success;
  final List<Nominees>? _nominees;
  @override
  List<Nominees>? get nominees {
    final value = _nominees;
    if (value == null) return null;
    if (_nominees is EqualUnmodifiableListView) return _nominees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetNomineeResponse(success: $success, nominees: $nominees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNomineeResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._nominees, _nominees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_nominees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNomineeResponseImplCopyWith<_$GetNomineeResponseImpl> get copyWith =>
      __$$GetNomineeResponseImplCopyWithImpl<_$GetNomineeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetNomineeResponseImplToJson(
      this,
    );
  }
}

abstract class _GetNomineeResponse implements GetNomineeResponse {
  factory _GetNomineeResponse(
      {final bool? success,
      final List<Nominees>? nominees}) = _$GetNomineeResponseImpl;

  factory _GetNomineeResponse.fromJson(Map<String, dynamic> json) =
      _$GetNomineeResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  List<Nominees>? get nominees;
  @override
  @JsonKey(ignore: true)
  _$$GetNomineeResponseImplCopyWith<_$GetNomineeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Nominees _$NomineesFromJson(Map<String, dynamic> json) {
  return _Nominees.fromJson(json);
}

/// @nodoc
mixin _$Nominees {
  int? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get relation => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get idProof => throw _privateConstructorUsedError;
  String? get guardianName => throw _privateConstructorUsedError;
  String? get guardianMobileNumber => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NomineesCopyWith<Nominees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NomineesCopyWith<$Res> {
  factory $NomineesCopyWith(Nominees value, $Res Function(Nominees) then) =
      _$NomineesCopyWithImpl<$Res, Nominees>;
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? mobileNumber,
      String? email,
      String? address,
      String? relation,
      int? age,
      String? image,
      String? idProof,
      String? guardianName,
      String? guardianMobileNumber,
      String? createdAt,
      String? updatedAt,
      int? userId});
}

/// @nodoc
class _$NomineesCopyWithImpl<$Res, $Val extends Nominees>
    implements $NomineesCopyWith<$Res> {
  _$NomineesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? relation = freezed,
    Object? age = freezed,
    Object? image = freezed,
    Object? idProof = freezed,
    Object? guardianName = freezed,
    Object? guardianMobileNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      relation: freezed == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      idProof: freezed == idProof
          ? _value.idProof
          : idProof // ignore: cast_nullable_to_non_nullable
              as String?,
      guardianName: freezed == guardianName
          ? _value.guardianName
          : guardianName // ignore: cast_nullable_to_non_nullable
              as String?,
      guardianMobileNumber: freezed == guardianMobileNumber
          ? _value.guardianMobileNumber
          : guardianMobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NomineesImplCopyWith<$Res>
    implements $NomineesCopyWith<$Res> {
  factory _$$NomineesImplCopyWith(
          _$NomineesImpl value, $Res Function(_$NomineesImpl) then) =
      __$$NomineesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? mobileNumber,
      String? email,
      String? address,
      String? relation,
      int? age,
      String? image,
      String? idProof,
      String? guardianName,
      String? guardianMobileNumber,
      String? createdAt,
      String? updatedAt,
      int? userId});
}

/// @nodoc
class __$$NomineesImplCopyWithImpl<$Res>
    extends _$NomineesCopyWithImpl<$Res, _$NomineesImpl>
    implements _$$NomineesImplCopyWith<$Res> {
  __$$NomineesImplCopyWithImpl(
      _$NomineesImpl _value, $Res Function(_$NomineesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? relation = freezed,
    Object? age = freezed,
    Object? image = freezed,
    Object? idProof = freezed,
    Object? guardianName = freezed,
    Object? guardianMobileNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$NomineesImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      relation: freezed == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      idProof: freezed == idProof
          ? _value.idProof
          : idProof // ignore: cast_nullable_to_non_nullable
              as String?,
      guardianName: freezed == guardianName
          ? _value.guardianName
          : guardianName // ignore: cast_nullable_to_non_nullable
              as String?,
      guardianMobileNumber: freezed == guardianMobileNumber
          ? _value.guardianMobileNumber
          : guardianMobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NomineesImpl implements _Nominees {
  _$NomineesImpl(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobileNumber,
      this.email,
      this.address,
      this.relation,
      this.age,
      this.image,
      this.idProof,
      this.guardianName,
      this.guardianMobileNumber,
      this.createdAt,
      this.updatedAt,
      this.userId});

  factory _$NomineesImpl.fromJson(Map<String, dynamic> json) =>
      _$$NomineesImplFromJson(json);

  @override
  final int? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? mobileNumber;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? relation;
  @override
  final int? age;
  @override
  final String? image;
  @override
  final String? idProof;
  @override
  final String? guardianName;
  @override
  final String? guardianMobileNumber;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? userId;

  @override
  String toString() {
    return 'Nominees(id: $id, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, email: $email, address: $address, relation: $relation, age: $age, image: $image, idProof: $idProof, guardianName: $guardianName, guardianMobileNumber: $guardianMobileNumber, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NomineesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.relation, relation) ||
                other.relation == relation) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.idProof, idProof) || other.idProof == idProof) &&
            (identical(other.guardianName, guardianName) ||
                other.guardianName == guardianName) &&
            (identical(other.guardianMobileNumber, guardianMobileNumber) ||
                other.guardianMobileNumber == guardianMobileNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      mobileNumber,
      email,
      address,
      relation,
      age,
      image,
      idProof,
      guardianName,
      guardianMobileNumber,
      createdAt,
      updatedAt,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NomineesImplCopyWith<_$NomineesImpl> get copyWith =>
      __$$NomineesImplCopyWithImpl<_$NomineesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NomineesImplToJson(
      this,
    );
  }
}

abstract class _Nominees implements Nominees {
  factory _Nominees(
      {final int? id,
      final String? firstName,
      final String? lastName,
      final String? mobileNumber,
      final String? email,
      final String? address,
      final String? relation,
      final int? age,
      final String? image,
      final String? idProof,
      final String? guardianName,
      final String? guardianMobileNumber,
      final String? createdAt,
      final String? updatedAt,
      final int? userId}) = _$NomineesImpl;

  factory _Nominees.fromJson(Map<String, dynamic> json) =
      _$NomineesImpl.fromJson;

  @override
  int? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get mobileNumber;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get relation;
  @override
  int? get age;
  @override
  String? get image;
  @override
  String? get idProof;
  @override
  String? get guardianName;
  @override
  String? get guardianMobileNumber;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get userId;
  @override
  @JsonKey(ignore: true)
  _$$NomineesImplCopyWith<_$NomineesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
