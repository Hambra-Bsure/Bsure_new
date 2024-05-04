// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'will_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WillState _$WillStateFromJson(Map<String, dynamic> json) {
  return _WillState.fromJson(json);
}

/// @nodoc
mixin _$WillState {
  List<Asset> get assets => throw _privateConstructorUsedError;
  bool get sameDistributionCheckbox => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WillStateCopyWith<WillState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WillStateCopyWith<$Res> {
  factory $WillStateCopyWith(WillState value, $Res Function(WillState) then) =
      _$WillStateCopyWithImpl<$Res, WillState>;
  @useResult
  $Res call({List<Asset> assets, bool sameDistributionCheckbox});
}

/// @nodoc
class _$WillStateCopyWithImpl<$Res, $Val extends WillState>
    implements $WillStateCopyWith<$Res> {
  _$WillStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
    Object? sameDistributionCheckbox = null,
  }) {
    return _then(_value.copyWith(
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      sameDistributionCheckbox: null == sameDistributionCheckbox
          ? _value.sameDistributionCheckbox
          : sameDistributionCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WillStateImplCopyWith<$Res>
    implements $WillStateCopyWith<$Res> {
  factory _$$WillStateImplCopyWith(
          _$WillStateImpl value, $Res Function(_$WillStateImpl) then) =
      __$$WillStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Asset> assets, bool sameDistributionCheckbox});
}

/// @nodoc
class __$$WillStateImplCopyWithImpl<$Res>
    extends _$WillStateCopyWithImpl<$Res, _$WillStateImpl>
    implements _$$WillStateImplCopyWith<$Res> {
  __$$WillStateImplCopyWithImpl(
      _$WillStateImpl _value, $Res Function(_$WillStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
    Object? sameDistributionCheckbox = null,
  }) {
    return _then(_$WillStateImpl(
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      sameDistributionCheckbox: null == sameDistributionCheckbox
          ? _value.sameDistributionCheckbox
          : sameDistributionCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WillStateImpl implements _WillState {
  const _$WillStateImpl(
      {required final List<Asset> assets,
      this.sameDistributionCheckbox = false})
      : _assets = assets;

  factory _$WillStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WillStateImplFromJson(json);

  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  @JsonKey()
  final bool sameDistributionCheckbox;

  @override
  String toString() {
    return 'WillState(assets: $assets, sameDistributionCheckbox: $sameDistributionCheckbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WillStateImpl &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(
                    other.sameDistributionCheckbox, sameDistributionCheckbox) ||
                other.sameDistributionCheckbox == sameDistributionCheckbox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_assets), sameDistributionCheckbox);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WillStateImplCopyWith<_$WillStateImpl> get copyWith =>
      __$$WillStateImplCopyWithImpl<_$WillStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WillStateImplToJson(
      this,
    );
  }
}

abstract class _WillState implements WillState {
  const factory _WillState(
      {required final List<Asset> assets,
      final bool sameDistributionCheckbox}) = _$WillStateImpl;

  factory _WillState.fromJson(Map<String, dynamic> json) =
      _$WillStateImpl.fromJson;

  @override
  List<Asset> get assets;
  @override
  bool get sameDistributionCheckbox;
  @override
  @JsonKey(ignore: true)
  _$$WillStateImplCopyWith<_$WillStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  int get assetId => throw _privateConstructorUsedError;
  String get assetName => throw _privateConstructorUsedError;
  String? get assetIdentity => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  bool get equalDistributionCheckbox => throw _privateConstructorUsedError;
  List<Nominee> get nominees => throw _privateConstructorUsedError;

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
      {int assetId,
      String assetName,
      String? assetIdentity,
      int categoryId,
      bool equalDistributionCheckbox,
      List<Nominee> nominees});
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
    Object? assetId = null,
    Object? assetName = null,
    Object? assetIdentity = freezed,
    Object? categoryId = null,
    Object? equalDistributionCheckbox = null,
    Object? nominees = null,
  }) {
    return _then(_value.copyWith(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetIdentity: freezed == assetIdentity
          ? _value.assetIdentity
          : assetIdentity // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      equalDistributionCheckbox: null == equalDistributionCheckbox
          ? _value.equalDistributionCheckbox
          : equalDistributionCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
      nominees: null == nominees
          ? _value.nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<Nominee>,
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
      {int assetId,
      String assetName,
      String? assetIdentity,
      int categoryId,
      bool equalDistributionCheckbox,
      List<Nominee> nominees});
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
    Object? assetId = null,
    Object? assetName = null,
    Object? assetIdentity = freezed,
    Object? categoryId = null,
    Object? equalDistributionCheckbox = null,
    Object? nominees = null,
  }) {
    return _then(_$AssetImpl(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      assetName: null == assetName
          ? _value.assetName
          : assetName // ignore: cast_nullable_to_non_nullable
              as String,
      assetIdentity: freezed == assetIdentity
          ? _value.assetIdentity
          : assetIdentity // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      equalDistributionCheckbox: null == equalDistributionCheckbox
          ? _value.equalDistributionCheckbox
          : equalDistributionCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
      nominees: null == nominees
          ? _value._nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<Nominee>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl(
      {required this.assetId,
      required this.assetName,
      required this.assetIdentity,
      required this.categoryId,
      this.equalDistributionCheckbox = false,
      required final List<Nominee> nominees})
      : _nominees = nominees;

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final int assetId;
  @override
  final String assetName;
  @override
  final String? assetIdentity;
  @override
  final int categoryId;
  @override
  @JsonKey()
  final bool equalDistributionCheckbox;
  final List<Nominee> _nominees;
  @override
  List<Nominee> get nominees {
    if (_nominees is EqualUnmodifiableListView) return _nominees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nominees);
  }

  @override
  String toString() {
    return 'Asset(assetId: $assetId, assetName: $assetName, assetIdentity: $assetIdentity, categoryId: $categoryId, equalDistributionCheckbox: $equalDistributionCheckbox, nominees: $nominees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.assetName, assetName) ||
                other.assetName == assetName) &&
            (identical(other.assetIdentity, assetIdentity) ||
                other.assetIdentity == assetIdentity) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.equalDistributionCheckbox,
                    equalDistributionCheckbox) ||
                other.equalDistributionCheckbox == equalDistributionCheckbox) &&
            const DeepCollectionEquality().equals(other._nominees, _nominees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assetId,
      assetName,
      assetIdentity,
      categoryId,
      equalDistributionCheckbox,
      const DeepCollectionEquality().hash(_nominees));

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
  const factory _Asset(
      {required final int assetId,
      required final String assetName,
      required final String? assetIdentity,
      required final int categoryId,
      final bool equalDistributionCheckbox,
      required final List<Nominee> nominees}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  int get assetId;
  @override
  String get assetName;
  @override
  String? get assetIdentity;
  @override
  int get categoryId;
  @override
  bool get equalDistributionCheckbox;
  @override
  List<Nominee> get nominees;
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
  String get mobile => throw _privateConstructorUsedError;
  String get relation => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get share => throw _privateConstructorUsedError;
  dynamic get equalShareCheckbox => throw _privateConstructorUsedError;

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
      String mobile,
      String relation,
      String name,
      double share,
      dynamic equalShareCheckbox});
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
    Object? mobile = null,
    Object? relation = null,
    Object? name = null,
    Object? share = null,
    Object? equalShareCheckbox = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as double,
      equalShareCheckbox: freezed == equalShareCheckbox
          ? _value.equalShareCheckbox
          : equalShareCheckbox // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      String mobile,
      String relation,
      String name,
      double share,
      dynamic equalShareCheckbox});
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
    Object? mobile = null,
    Object? relation = null,
    Object? name = null,
    Object? share = null,
    Object? equalShareCheckbox = freezed,
  }) {
    return _then(_$NomineeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      relation: null == relation
          ? _value.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as double,
      equalShareCheckbox: freezed == equalShareCheckbox
          ? _value.equalShareCheckbox!
          : equalShareCheckbox,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NomineeImpl implements _Nominee {
  const _$NomineeImpl(
      {required this.id,
      required this.mobile,
      required this.relation,
      required this.name,
      required this.share,
      this.equalShareCheckbox = false});

  factory _$NomineeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NomineeImplFromJson(json);

  @override
  final int id;
  @override
  final String mobile;
  @override
  final String relation;
  @override
  final String name;
  @override
  final double share;
  @override
  @JsonKey()
  final dynamic equalShareCheckbox;

  @override
  String toString() {
    return 'Nominee(id: $id, mobile: $mobile, relation: $relation, name: $name, share: $share, equalShareCheckbox: $equalShareCheckbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NomineeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.relation, relation) ||
                other.relation == relation) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.share, share) || other.share == share) &&
            const DeepCollectionEquality()
                .equals(other.equalShareCheckbox, equalShareCheckbox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mobile, relation, name,
      share, const DeepCollectionEquality().hash(equalShareCheckbox));

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
  const factory _Nominee(
      {required final int id,
      required final String mobile,
      required final String relation,
      required final String name,
      required final double share,
      final dynamic equalShareCheckbox}) = _$NomineeImpl;

  factory _Nominee.fromJson(Map<String, dynamic> json) = _$NomineeImpl.fromJson;

  @override
  int get id;
  @override
  String get mobile;
  @override
  String get relation;
  @override
  String get name;
  @override
  double get share;
  @override
  dynamic get equalShareCheckbox;
  @override
  @JsonKey(ignore: true)
  _$$NomineeImplCopyWith<_$NomineeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
