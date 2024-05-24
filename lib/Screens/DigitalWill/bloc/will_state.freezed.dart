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
      {final List<Asset> assets = const <Asset>[],
      this.sameDistributionCheckbox = false})
      : _assets = assets;

  factory _$WillStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WillStateImplFromJson(json);

  final List<Asset> _assets;
  @override
  @JsonKey()
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
      {final List<Asset> assets,
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
  String get category => throw _privateConstructorUsedError;
  bool get equalDistributionCheckbox => throw _privateConstructorUsedError;
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
      {int assetId,
      String category,
      bool equalDistributionCheckbox,
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
    Object? assetId = null,
    Object? category = null,
    Object? equalDistributionCheckbox = null,
    Object? nominees = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      equalDistributionCheckbox: null == equalDistributionCheckbox
          ? _value.equalDistributionCheckbox
          : equalDistributionCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {int assetId,
      String category,
      bool equalDistributionCheckbox,
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
    Object? assetId = null,
    Object? category = null,
    Object? equalDistributionCheckbox = null,
    Object? nominees = null,
    Object? details = null,
  }) {
    return _then(_$AssetImpl(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      equalDistributionCheckbox: null == equalDistributionCheckbox
          ? _value.equalDistributionCheckbox
          : equalDistributionCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
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
  const _$AssetImpl(
      {required this.assetId,
      required this.category,
      this.equalDistributionCheckbox = false,
      final List<Nominee> nominees = const <Nominee>[],
      final List<Detail> details = const <Detail>[]})
      : _nominees = nominees,
        _details = details;

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final int assetId;
  @override
  final String category;
  @override
  @JsonKey()
  final bool equalDistributionCheckbox;
  final List<Nominee> _nominees;
  @override
  @JsonKey()
  List<Nominee> get nominees {
    if (_nominees is EqualUnmodifiableListView) return _nominees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nominees);
  }

  final List<Detail> _details;
  @override
  @JsonKey()
  List<Detail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'Asset(assetId: $assetId, category: $category, equalDistributionCheckbox: $equalDistributionCheckbox, nominees: $nominees, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.equalDistributionCheckbox,
                    equalDistributionCheckbox) ||
                other.equalDistributionCheckbox == equalDistributionCheckbox) &&
            const DeepCollectionEquality().equals(other._nominees, _nominees) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      assetId,
      category,
      equalDistributionCheckbox,
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
  const factory _Asset(
      {required final int assetId,
      required final String category,
      final bool equalDistributionCheckbox,
      final List<Nominee> nominees,
      final List<Detail> details}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  int get assetId;
  @override
  String get category;
  @override
  bool get equalDistributionCheckbox;
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
  String? get mobile => throw _privateConstructorUsedError;
  String get relation => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get share => throw _privateConstructorUsedError;
  bool get equalShareCheckbox => throw _privateConstructorUsedError;

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
      String? mobile,
      String relation,
      String name,
      double share,
      bool equalShareCheckbox});
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
    Object? mobile = freezed,
    Object? relation = null,
    Object? name = null,
    Object? share = null,
    Object? equalShareCheckbox = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
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
      equalShareCheckbox: null == equalShareCheckbox
          ? _value.equalShareCheckbox
          : equalShareCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
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
      String? mobile,
      String relation,
      String name,
      double share,
      bool equalShareCheckbox});
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
    Object? mobile = freezed,
    Object? relation = null,
    Object? name = null,
    Object? share = null,
    Object? equalShareCheckbox = null,
  }) {
    return _then(_$NomineeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
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
      equalShareCheckbox: null == equalShareCheckbox
          ? _value.equalShareCheckbox
          : equalShareCheckbox // ignore: cast_nullable_to_non_nullable
              as bool,
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
  final String? mobile;
  @override
  final String relation;
  @override
  final String name;
  @override
  final double share;
  @override
  @JsonKey()
  final bool equalShareCheckbox;

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
            (identical(other.equalShareCheckbox, equalShareCheckbox) ||
                other.equalShareCheckbox == equalShareCheckbox));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, mobile, relation, name, share, equalShareCheckbox);

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
      required final String? mobile,
      required final String relation,
      required final String name,
      required final double share,
      final bool equalShareCheckbox}) = _$NomineeImpl;

  factory _Nominee.fromJson(Map<String, dynamic> json) = _$NomineeImpl.fromJson;

  @override
  int get id;
  @override
  String? get mobile;
  @override
  String get relation;
  @override
  String get name;
  @override
  double get share;
  @override
  bool get equalShareCheckbox;
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
  String? get fieldValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call({String fieldName, String? fieldValue});
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
    Object? fieldValue = freezed,
  }) {
    return _then(_value.copyWith(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldValue: freezed == fieldValue
          ? _value.fieldValue
          : fieldValue // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String fieldName, String? fieldValue});
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
    Object? fieldValue = freezed,
  }) {
    return _then(_$DetailImpl(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldValue: freezed == fieldValue
          ? _value.fieldValue
          : fieldValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailImpl implements _Detail {
  const _$DetailImpl({required this.fieldName, required this.fieldValue});

  factory _$DetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailImplFromJson(json);

  @override
  final String fieldName;
  @override
  final String? fieldValue;

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
  const factory _Detail(
      {required final String fieldName,
      required final String? fieldValue}) = _$DetailImpl;

  factory _Detail.fromJson(Map<String, dynamic> json) = _$DetailImpl.fromJson;

  @override
  String get fieldName;
  @override
  String? get fieldValue;
  @override
  @JsonKey(ignore: true)
  _$$DetailImplCopyWith<_$DetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
