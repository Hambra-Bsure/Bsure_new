// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Myshare_asset_res.dart';

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
  bool? get success => throw _privateConstructorUsedError;
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
  $Res call({bool? success, List<Asset> assets});
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
    Object? success = freezed,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
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
  $Res call({bool? success, List<Asset> assets});
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
    Object? success = freezed,
    Object? assets = null,
  }) {
    return _then(_$MyShareAssetsResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
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
  final bool? success;
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
      {required final bool? success,
      required final List<Asset> assets}) = _$MyShareAssetsResponseImpl;

  factory _MyShareAssetsResponse.fromJson(Map<String, dynamic> json) =
      _$MyShareAssetsResponseImpl.fromJson;

  @override
  bool? get success;
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
  BankAccount? get bankAccount => throw _privateConstructorUsedError;
  MutualFund? get mutualFund => throw _privateConstructorUsedError;

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
      BankAccount? bankAccount,
      MutualFund? mutualFund});

  $BankAccountCopyWith<$Res>? get bankAccount;
  $MutualFundCopyWith<$Res>? get mutualFund;
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
    Object? bankAccount = freezed,
    Object? mutualFund = freezed,
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
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      mutualFund: freezed == mutualFund
          ? _value.mutualFund
          : mutualFund // ignore: cast_nullable_to_non_nullable
              as MutualFund?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankAccountCopyWith<$Res>? get bankAccount {
    if (_value.bankAccount == null) {
      return null;
    }

    return $BankAccountCopyWith<$Res>(_value.bankAccount!, (value) {
      return _then(_value.copyWith(bankAccount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MutualFundCopyWith<$Res>? get mutualFund {
    if (_value.mutualFund == null) {
      return null;
    }

    return $MutualFundCopyWith<$Res>(_value.mutualFund!, (value) {
      return _then(_value.copyWith(mutualFund: value) as $Val);
    });
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
      BankAccount? bankAccount,
      MutualFund? mutualFund});

  @override
  $BankAccountCopyWith<$Res>? get bankAccount;
  @override
  $MutualFundCopyWith<$Res>? get mutualFund;
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
    Object? bankAccount = freezed,
    Object? mutualFund = freezed,
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
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as BankAccount?,
      mutualFund: freezed == mutualFund
          ? _value.mutualFund
          : mutualFund // ignore: cast_nullable_to_non_nullable
              as MutualFund?,
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
      this.bankAccount,
      this.mutualFund})
      : _nominees = nominees;

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

  @override
  final BankAccount? bankAccount;
  @override
  final MutualFund? mutualFund;

  @override
  String toString() {
    return 'Asset(id: $id, userId: $userId, category: $category, nominees: $nominees, bankAccount: $bankAccount, mutualFund: $mutualFund)';
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
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.mutualFund, mutualFund) ||
                other.mutualFund == mutualFund));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, category,
      const DeepCollectionEquality().hash(_nominees), bankAccount, mutualFund);

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
      final BankAccount? bankAccount,
      final MutualFund? mutualFund}) = _$AssetImpl;

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
  BankAccount? get bankAccount;
  @override
  MutualFund? get mutualFund;
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
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

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
      String? guardianMobileNumber,
      String createdAt,
      String updatedAt,
      int userId});
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
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userId = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
      String? guardianMobileNumber,
      String createdAt,
      String updatedAt,
      int userId});
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
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userId = null,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.guardianMobileNumber,
      required this.createdAt,
      required this.updatedAt,
      required this.userId});

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
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int userId;

  @override
  String toString() {
    return 'Nominee(id: $id, firstName: $firstName, lastName: $lastName, mobileNumber: $mobileNumber, email: $email, address: $address, relation: $relation, age: $age, image: $image, idProof: $idProof, guardianName: $guardianName, guardianMobileNumber: $guardianMobileNumber, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId)';
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
      required final String? guardianMobileNumber,
      required final String createdAt,
      required final String updatedAt,
      required final int userId}) = _$NomineeImpl;

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
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$NomineeImplCopyWith<_$NomineeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  String get category => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get accountType => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;
  String? get ifscCode => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
          BankAccount value, $Res Function(BankAccount) then) =
      _$BankAccountCopyWithImpl<$Res, BankAccount>;
  @useResult
  $Res call(
      {String category,
      String bankName,
      int assetId,
      String attachment,
      String comments,
      String accountType,
      String branchName,
      String? ifscCode,
      String? accountNumber});
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res, $Val extends BankAccount>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? bankName = null,
    Object? assetId = null,
    Object? attachment = null,
    Object? comments = null,
    Object? accountType = null,
    Object? branchName = null,
    Object? ifscCode = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: freezed == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankAccountImplCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$BankAccountImplCopyWith(
          _$BankAccountImpl value, $Res Function(_$BankAccountImpl) then) =
      __$$BankAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String bankName,
      int assetId,
      String attachment,
      String comments,
      String accountType,
      String branchName,
      String? ifscCode,
      String? accountNumber});
}

/// @nodoc
class __$$BankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountCopyWithImpl<$Res, _$BankAccountImpl>
    implements _$$BankAccountImplCopyWith<$Res> {
  __$$BankAccountImplCopyWithImpl(
      _$BankAccountImpl _value, $Res Function(_$BankAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? bankName = null,
    Object? assetId = null,
    Object? attachment = null,
    Object? comments = null,
    Object? accountType = null,
    Object? branchName = null,
    Object? ifscCode = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_$BankAccountImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: freezed == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountImpl implements _BankAccount {
  _$BankAccountImpl(
      {required this.category,
      required this.bankName,
      required this.assetId,
      required this.attachment,
      required this.comments,
      required this.accountType,
      required this.branchName,
      required this.ifscCode,
      required this.accountNumber});

  factory _$BankAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountImplFromJson(json);

  @override
  final String category;
  @override
  final String bankName;
  @override
  final int assetId;
  @override
  final String attachment;
  @override
  final String comments;
  @override
  final String accountType;
  @override
  final String branchName;
  @override
  final String? ifscCode;
  @override
  final String? accountNumber;

  @override
  String toString() {
    return 'BankAccount(category: $category, bankName: $bankName, assetId: $assetId, attachment: $attachment, comments: $comments, accountType: $accountType, branchName: $branchName, ifscCode: $ifscCode, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, bankName, assetId,
      attachment, comments, accountType, branchName, ifscCode, accountNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      __$$BankAccountImplCopyWithImpl<_$BankAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountImplToJson(
      this,
    );
  }
}

abstract class _BankAccount implements BankAccount {
  factory _BankAccount(
      {required final String category,
      required final String bankName,
      required final int assetId,
      required final String attachment,
      required final String comments,
      required final String accountType,
      required final String branchName,
      required final String? ifscCode,
      required final String? accountNumber}) = _$BankAccountImpl;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$BankAccountImpl.fromJson;

  @override
  String get category;
  @override
  String get bankName;
  @override
  int get assetId;
  @override
  String get attachment;
  @override
  String get comments;
  @override
  String get accountType;
  @override
  String get branchName;
  @override
  String? get ifscCode;
  @override
  String? get accountNumber;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MutualFund _$MutualFundFromJson(Map<String, dynamic> json) {
  return _MutualFund.fromJson(json);
}

/// @nodoc
mixin _$MutualFund {
  int get id => throw _privateConstructorUsedError;
  String get amcName => throw _privateConstructorUsedError;
  String get schemeName => throw _privateConstructorUsedError;
  String get folioNumber => throw _privateConstructorUsedError;
  String get fundType => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MutualFundCopyWith<MutualFund> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutualFundCopyWith<$Res> {
  factory $MutualFundCopyWith(
          MutualFund value, $Res Function(MutualFund) then) =
      _$MutualFundCopyWithImpl<$Res, MutualFund>;
  @useResult
  $Res call(
      {int id,
      String amcName,
      String schemeName,
      String folioNumber,
      String fundType,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class _$MutualFundCopyWithImpl<$Res, $Val extends MutualFund>
    implements $MutualFundCopyWith<$Res> {
  _$MutualFundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amcName = null,
    Object? schemeName = null,
    Object? folioNumber = null,
    Object? fundType = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amcName: null == amcName
          ? _value.amcName
          : amcName // ignore: cast_nullable_to_non_nullable
              as String,
      schemeName: null == schemeName
          ? _value.schemeName
          : schemeName // ignore: cast_nullable_to_non_nullable
              as String,
      folioNumber: null == folioNumber
          ? _value.folioNumber
          : folioNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fundType: null == fundType
          ? _value.fundType
          : fundType // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MutualFundImplCopyWith<$Res>
    implements $MutualFundCopyWith<$Res> {
  factory _$$MutualFundImplCopyWith(
          _$MutualFundImpl value, $Res Function(_$MutualFundImpl) then) =
      __$$MutualFundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String amcName,
      String schemeName,
      String folioNumber,
      String fundType,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class __$$MutualFundImplCopyWithImpl<$Res>
    extends _$MutualFundCopyWithImpl<$Res, _$MutualFundImpl>
    implements _$$MutualFundImplCopyWith<$Res> {
  __$$MutualFundImplCopyWithImpl(
      _$MutualFundImpl _value, $Res Function(_$MutualFundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amcName = null,
    Object? schemeName = null,
    Object? folioNumber = null,
    Object? fundType = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_$MutualFundImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      amcName: null == amcName
          ? _value.amcName
          : amcName // ignore: cast_nullable_to_non_nullable
              as String,
      schemeName: null == schemeName
          ? _value.schemeName
          : schemeName // ignore: cast_nullable_to_non_nullable
              as String,
      folioNumber: null == folioNumber
          ? _value.folioNumber
          : folioNumber // ignore: cast_nullable_to_non_nullable
              as String,
      fundType: null == fundType
          ? _value.fundType
          : fundType // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MutualFundImpl implements _MutualFund {
  _$MutualFundImpl(
      {required this.id,
      required this.amcName,
      required this.schemeName,
      required this.folioNumber,
      required this.fundType,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$MutualFundImpl.fromJson(Map<String, dynamic> json) =>
      _$$MutualFundImplFromJson(json);

  @override
  final int id;
  @override
  final String amcName;
  @override
  final String schemeName;
  @override
  final String folioNumber;
  @override
  final String fundType;
  @override
  final String comments;
  @override
  final String attachment;
  @override
  final int assetId;

  @override
  String toString() {
    return 'MutualFund(id: $id, amcName: $amcName, schemeName: $schemeName, folioNumber: $folioNumber, fundType: $fundType, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutualFundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amcName, amcName) || other.amcName == amcName) &&
            (identical(other.schemeName, schemeName) ||
                other.schemeName == schemeName) &&
            (identical(other.folioNumber, folioNumber) ||
                other.folioNumber == folioNumber) &&
            (identical(other.fundType, fundType) ||
                other.fundType == fundType) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amcName, schemeName,
      folioNumber, fundType, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MutualFundImplCopyWith<_$MutualFundImpl> get copyWith =>
      __$$MutualFundImplCopyWithImpl<_$MutualFundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MutualFundImplToJson(
      this,
    );
  }
}

abstract class _MutualFund implements MutualFund {
  factory _MutualFund(
      {required final int id,
      required final String amcName,
      required final String schemeName,
      required final String folioNumber,
      required final String fundType,
      required final String comments,
      required final String attachment,
      required final int assetId}) = _$MutualFundImpl;

  factory _MutualFund.fromJson(Map<String, dynamic> json) =
      _$MutualFundImpl.fromJson;

  @override
  int get id;
  @override
  String get amcName;
  @override
  String get schemeName;
  @override
  String get folioNumber;
  @override
  String get fundType;
  @override
  String get comments;
  @override
  String get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$MutualFundImplCopyWith<_$MutualFundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
