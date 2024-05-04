// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_share_asset_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyShareAssetsResponse _$MyShareAssetsResponseFromJson(
    Map<String, dynamic> json) {
  return _MyShareAssetsResponse.fromJson(json);
}

/// @nodoc
mixin _$MyShareAssetsResponse {
  bool get success => throw _privateConstructorUsedError;
  List<Asset> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyShareAssetsResponseCopyWith<MyShareAssetsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyShareAssetsResponseCopyWith<$Res> {
  factory $MyShareAssetsResponseCopyWith(MyShareAssetsResponse value,
          $Res Function(MyShareAssetsResponse) then) =
      _$MyShareAssetsResponseCopyWithImpl<$Res, MyShareAssetsResponse>;
  @useResult
  $Res call({bool success, List<Asset> assets});
}

/// @nodoc
class _$MyShareAssetsResponseCopyWithImpl<$Res,
        $Val extends MyShareAssetsResponse>
    implements $MyShareAssetsResponseCopyWith<$Res> {
  _$MyShareAssetsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyShareAssetsResponseImplCopyWith<$Res>
    implements $MyShareAssetsResponseCopyWith<$Res> {
  factory _$$MyShareAssetsResponseImplCopyWith(
          _$MyShareAssetsResponseImpl value,
          $Res Function(_$MyShareAssetsResponseImpl) then) =
      __$$MyShareAssetsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, List<Asset> assets});
}

/// @nodoc
class __$$MyShareAssetsResponseImplCopyWithImpl<$Res>
    extends _$MyShareAssetsResponseCopyWithImpl<$Res,
        _$MyShareAssetsResponseImpl>
    implements _$$MyShareAssetsResponseImplCopyWith<$Res> {
  __$$MyShareAssetsResponseImplCopyWithImpl(_$MyShareAssetsResponseImpl _value,
      $Res Function(_$MyShareAssetsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? assets = null,
  }) {
    return _then(_$MyShareAssetsResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyShareAssetsResponseImpl implements _MyShareAssetsResponse {
  _$MyShareAssetsResponseImpl(
      {required this.success, required final List<Asset> assets})
      : _assets = assets;

  factory _$MyShareAssetsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyShareAssetsResponseImplFromJson(json);

  @override
  final bool success;
  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'MyShareAssetsResponse(success: $success, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyShareAssetsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyShareAssetsResponseImplCopyWith<_$MyShareAssetsResponseImpl>
      get copyWith => __$$MyShareAssetsResponseImplCopyWithImpl<
          _$MyShareAssetsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyShareAssetsResponseImplToJson(
      this,
    );
  }
}

abstract class _MyShareAssetsResponse implements MyShareAssetsResponse {
  factory _MyShareAssetsResponse(
      {required final bool success,
      required final List<Asset> assets}) = _$MyShareAssetsResponseImpl;

  factory _MyShareAssetsResponse.fromJson(Map<String, dynamic> json) =
      _$MyShareAssetsResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<Asset> get assets;
  @override
  @JsonKey(ignore: true)
  _$$MyShareAssetsResponseImplCopyWith<_$MyShareAssetsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<Nominee> get nominees => throw _privateConstructorUsedError;
  List<Detail> get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call(
      {int id,
      int userId,
      String category,
      List<Nominee> nominees,
      List<Detail> details});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? category = null,
    Object? nominees = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      nominees: null == nominees
          ? _value.nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<Nominee>,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Detail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
          _$AssetImpl value, $Res Function(_$AssetImpl) then) =
      __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int userId,
      String category,
      List<Nominee> nominees,
      List<Detail> details});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$AssetCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
      _$AssetImpl _value, $Res Function(_$AssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? category = null,
    Object? nominees = null,
    Object? details = null,
  }) {
    return _then(_$AssetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      nominees: null == nominees
          ? _value._nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<Nominee>,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<Detail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  _$AssetImpl(
      {required this.id,
      required this.userId,
      required this.category,
      required final List<Nominee> nominees,
      required final List<Detail> details})
      : _nominees = nominees,
        _details = details;

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String category;
  final List<Nominee> _nominees;
  @override
  List<Nominee> get nominees {
    if (_nominees is EqualUnmodifiableListView) return _nominees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nominees);
  }

  final List<Detail> _details;
  @override
  List<Detail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'Asset(id: $id, userId: $userId, category: $category, nominees: $nominees, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._nominees, _nominees) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      category,
      const DeepCollectionEquality().hash(_nominees),
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImplToJson(
      this,
    );
  }
}

abstract class _Asset implements Asset {
  factory _Asset(
      {required final int id,
      required final int userId,
      required final String category,
      required final List<Nominee> nominees,
      required final List<Detail> details}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String get category;
  @override
  List<Nominee> get nominees;
  @override
  List<Detail> get details;
  @override
  @JsonKey(ignore: true)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Nominee _$NomineeFromJson(Map<String, dynamic> json) {
  return _Nominee.fromJson(json);
}

/// @nodoc
mixin _$Nominee {
  int get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get relation => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get idProof => throw _privateConstructorUsedError;
  String? get guardianName => throw _privateConstructorUsedError;
  String? get guardianMobileNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NomineeCopyWith<Nominee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NomineeCopyWith<$Res> {
  factory $NomineeCopyWith(Nominee value, $Res Function(Nominee) then) =
      _$NomineeCopyWithImpl<$Res, Nominee>;
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String? mobileNumber,
      String? email,
      String address,
      String relation,
      int age,
      String? image,
      String? idProof,
      String? guardianName,
      String? guardianMobileNumber});
}

/// @nodoc
class _$NomineeCopyWithImpl<$Res, $Val extends Nominee>
    implements $NomineeCopyWith<$Res> {
  _$NomineeCopyWithImpl(this._value, this._then);

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
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? address = null,
    Object? relation = null,
    Object? age = null,
    Object? image = freezed,
    Object? idProof = freezed,
    Object? guardianName = freezed,
    Object? guardianMobileNumber = freezed,
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
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NomineeImplCopyWith<$Res> implements $NomineeCopyWith<$Res> {
  factory _$$NomineeImplCopyWith(
          _$NomineeImpl value, $Res Function(_$NomineeImpl) then) =
      __$$NomineeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String firstName,
      String lastName,
      String? mobileNumber,
      String? email,
      String address,
      String relation,
      int age,
      String? image,
      String? idProof,
      String? guardianName,
      String? guardianMobileNumber});
}

/// @nodoc
class __$$NomineeImplCopyWithImpl<$Res>
    extends _$NomineeCopyWithImpl<$Res, _$NomineeImpl>
    implements _$$NomineeImplCopyWith<$Res> {
  __$$NomineeImplCopyWithImpl(
      _$NomineeImpl _value, $Res Function(_$NomineeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? mobileNumber = freezed,
    Object? email = freezed,
    Object? address = null,
    Object? relation = null,
    Object? age = null,
    Object? image = freezed,
    Object? idProof = freezed,
    Object? guardianName = freezed,
    Object? guardianMobileNumber = freezed,
  }) {
    return _then(_$NomineeImpl(
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
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NomineeImpl implements _Nominee {
  _$NomineeImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.email,
      required this.address,
      required this.relation,
      required this.age,
      required this.image,
      required this.idProof,
      required this.guardianName,
      required this.guardianMobileNumber});

  factory _$NomineeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NomineeImplFromJson(json);

  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? mobileNumber;
  @override
  final String? email;
  @override
  final String address;
  @override
  final String relation;
  @override
  final int age;
  @override
  final String? image;
  @override
  final String? idProof;
  @override
  final String? guardianName;
  @override
  final String? guardianMobileNumber;

  @override
  String toString() {
    return 'Nominee(id: $id, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, email: $email, address: $address, relation: $relation, age: $age, image: $image, idProof: $idProof, guardianName: $guardianName, guardianMobileNumber: $guardianMobileNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NomineeImpl &&
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
                other.guardianMobileNumber == guardianMobileNumber));
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
      guardianMobileNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NomineeImplCopyWith<_$NomineeImpl> get copyWith =>
      __$$NomineeImplCopyWithImpl<_$NomineeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NomineeImplToJson(
      this,
    );
  }
}

abstract class _Nominee implements Nominee {
  factory _Nominee(
      {required final int id,
      required final String firstName,
      required final String lastName,
      required final String? mobileNumber,
      required final String? email,
      required final String address,
      required final String relation,
      required final int age,
      required final String? image,
      required final String? idProof,
      required final String? guardianName,
      required final String? guardianMobileNumber}) = _$NomineeImpl;

  factory _Nominee.fromJson(Map<String, dynamic> json) = _$NomineeImpl.fromJson;

  @override
  int get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get mobileNumber;
  @override
  String? get email;
  @override
  String get address;
  @override
  String get relation;
  @override
  int get age;
  @override
  String? get image;
  @override
  String? get idProof;
  @override
  String? get guardianName;
  @override
  String? get guardianMobileNumber;
  @override
  @JsonKey(ignore: true)
  _$$NomineeImplCopyWith<_$NomineeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  String get fieldName => throw _privateConstructorUsedError;
  String get fieldValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call({String fieldName, String fieldValue});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = null,
    Object? fieldValue = null,
  }) {
    return _then(_value.copyWith(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldValue: null == fieldValue
          ? _value.fieldValue
          : fieldValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailImplCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$DetailImplCopyWith(
          _$DetailImpl value, $Res Function(_$DetailImpl) then) =
      __$$DetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fieldName, String fieldValue});
}

/// @nodoc
class __$$DetailImplCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$DetailImpl>
    implements _$$DetailImplCopyWith<$Res> {
  __$$DetailImplCopyWithImpl(
      _$DetailImpl _value, $Res Function(_$DetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = null,
    Object? fieldValue = null,
  }) {
    return _then(_$DetailImpl(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldValue: null == fieldValue
          ? _value.fieldValue
          : fieldValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailImpl implements _Detail {
  _$DetailImpl({required this.fieldName, required this.fieldValue});

  factory _$DetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailImplFromJson(json);

  @override
  final String fieldName;
  @override
  final String fieldValue;

  @override
  String toString() {
    return 'Detail(fieldName: $fieldName, fieldValue: $fieldValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailImpl &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.fieldValue, fieldValue) ||
                other.fieldValue == fieldValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fieldName, fieldValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      __$$DetailImplCopyWithImpl<_$DetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailImplToJson(
      this,
    );
  }
}

abstract class _Detail implements Detail {
  factory _Detail(
      {required final String fieldName,
      required final String fieldValue}) = _$DetailImpl;

  factory _Detail.fromJson(Map<String, dynamic> json) = _$DetailImpl.fromJson;

  @override
  String get fieldName;
  @override
  String get fieldValue;
  @override
  @JsonKey(ignore: true)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
