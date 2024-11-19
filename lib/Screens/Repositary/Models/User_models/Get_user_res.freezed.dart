// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Get_user_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) {
  return _GetUserResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserResponse {
  bool? get success => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserResponseCopyWith<GetUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserResponseCopyWith<$Res> {
  factory $GetUserResponseCopyWith(
          GetUserResponse value, $Res Function(GetUserResponse) then) =
      _$GetUserResponseCopyWithImpl<$Res, GetUserResponse>;
  @useResult
  $Res call({bool? success, User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$GetUserResponseCopyWithImpl<$Res, $Val extends GetUserResponse>
    implements $GetUserResponseCopyWith<$Res> {
  _$GetUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetUserResponseImplCopyWith<$Res>
    implements $GetUserResponseCopyWith<$Res> {
  factory _$$GetUserResponseImplCopyWith(_$GetUserResponseImpl value,
          $Res Function(_$GetUserResponseImpl) then) =
      __$$GetUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$GetUserResponseImplCopyWithImpl<$Res>
    extends _$GetUserResponseCopyWithImpl<$Res, _$GetUserResponseImpl>
    implements _$$GetUserResponseImplCopyWith<$Res> {
  __$$GetUserResponseImplCopyWithImpl(
      _$GetUserResponseImpl _value, $Res Function(_$GetUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? user = freezed,
  }) {
    return _then(_$GetUserResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserResponseImpl
    with DiagnosticableTreeMixin
    implements _GetUserResponse {
  _$GetUserResponseImpl({this.success = false, this.user});

  factory _$GetUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool? success;
  @override
  final User? user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetUserResponse(success: $success, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetUserResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserResponseImplCopyWith<_$GetUserResponseImpl> get copyWith =>
      __$$GetUserResponseImplCopyWithImpl<_$GetUserResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserResponseImplToJson(
      this,
    );
  }
}

abstract class _GetUserResponse implements GetUserResponse {
  factory _GetUserResponse({final bool? success, final User? user}) =
      _$GetUserResponseImpl;

  factory _GetUserResponse.fromJson(Map<String, dynamic> json) =
      _$GetUserResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$GetUserResponseImplCopyWith<_$GetUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get fatherName => throw _privateConstructorUsedError;
  String? get religion => throw _privateConstructorUsedError;
  String? get spouseName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get whatsappNumber => throw _privateConstructorUsedError;
  String? get secondaryNumber => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get panNumber => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? fatherName,
      String? religion,
      String? spouseName,
      String? email,
      String? mobileNumber,
      String? whatsappNumber,
      String? secondaryNumber,
      String? address,
      String? panNumber,
      int? age,
      String? gender,
      String? photo});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    Object? fatherName = freezed,
    Object? religion = freezed,
    Object? spouseName = freezed,
    Object? email = freezed,
    Object? mobileNumber = freezed,
    Object? whatsappNumber = freezed,
    Object? secondaryNumber = freezed,
    Object? address = freezed,
    Object? panNumber = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? photo = freezed,
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
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      spouseName: freezed == spouseName
          ? _value.spouseName
          : spouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNumber: freezed == whatsappNumber
          ? _value.whatsappNumber
          : whatsappNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryNumber: freezed == secondaryNumber
          ? _value.secondaryNumber
          : secondaryNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      panNumber: freezed == panNumber
          ? _value.panNumber
          : panNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? firstName,
      String? lastName,
      String? fatherName,
      String? religion,
      String? spouseName,
      String? email,
      String? mobileNumber,
      String? whatsappNumber,
      String? secondaryNumber,
      String? address,
      String? panNumber,
      int? age,
      String? gender,
      String? photo});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? fatherName = freezed,
    Object? religion = freezed,
    Object? spouseName = freezed,
    Object? email = freezed,
    Object? mobileNumber = freezed,
    Object? whatsappNumber = freezed,
    Object? secondaryNumber = freezed,
    Object? address = freezed,
    Object? panNumber = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$UserImpl(
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
      fatherName: freezed == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      spouseName: freezed == spouseName
          ? _value.spouseName
          : spouseName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsappNumber: freezed == whatsappNumber
          ? _value.whatsappNumber
          : whatsappNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryNumber: freezed == secondaryNumber
          ? _value.secondaryNumber
          : secondaryNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      panNumber: freezed == panNumber
          ? _value.panNumber
          : panNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl with DiagnosticableTreeMixin implements _User {
  _$UserImpl(
      {this.id,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.religion,
      this.spouseName,
      this.email,
      this.mobileNumber,
      this.whatsappNumber,
      this.secondaryNumber,
      this.address,
      this.panNumber,
      this.age,
      this.gender,
      this.photo});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? fatherName;
  @override
  final String? religion;
  @override
  final String? spouseName;
  @override
  final String? email;
  @override
  final String? mobileNumber;
  @override
  final String? whatsappNumber;
  @override
  final String? secondaryNumber;
  @override
  final String? address;
  @override
  final String? panNumber;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? photo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, fatherName: $fatherName, religion: $religion, spouseName: $spouseName, email: $email, mobileNumber: $mobileNumber, whatsappNumber: $whatsappNumber, secondaryNumber: $secondaryNumber, address: $address, panNumber: $panNumber, age: $age, gender: $gender, photo: $photo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('fatherName', fatherName))
      ..add(DiagnosticsProperty('religion', religion))
      ..add(DiagnosticsProperty('spouseName', spouseName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('mobileNumber', mobileNumber))
      ..add(DiagnosticsProperty('whatsappNumber', whatsappNumber))
      ..add(DiagnosticsProperty('secondaryNumber', secondaryNumber))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('panNumber', panNumber))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('photo', photo));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            (identical(other.spouseName, spouseName) ||
                other.spouseName == spouseName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.whatsappNumber, whatsappNumber) ||
                other.whatsappNumber == whatsappNumber) &&
            (identical(other.secondaryNumber, secondaryNumber) ||
                other.secondaryNumber == secondaryNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.panNumber, panNumber) ||
                other.panNumber == panNumber) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      fatherName,
      religion,
      spouseName,
      email,
      mobileNumber,
      whatsappNumber,
      secondaryNumber,
      address,
      panNumber,
      age,
      gender,
      photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {final int? id,
      final String? firstName,
      final String? lastName,
      final String? fatherName,
      final String? religion,
      final String? spouseName,
      final String? email,
      final String? mobileNumber,
      final String? whatsappNumber,
      final String? secondaryNumber,
      final String? address,
      final String? panNumber,
      final int? age,
      final String? gender,
      final String? photo}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int? get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get fatherName;
  @override
  String? get religion;
  @override
  String? get spouseName;
  @override
  String? get email;
  @override
  String? get mobileNumber;
  @override
  String? get whatsappNumber;
  @override
  String? get secondaryNumber;
  @override
  String? get address;
  @override
  String? get panNumber;
  @override
  int? get age;
  @override
  String? get gender;
  @override
  String? get photo;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
