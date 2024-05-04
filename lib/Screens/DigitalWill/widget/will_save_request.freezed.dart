// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'will_save_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WillSaveReq _$WillSaveReqFromJson(Map<String, dynamic> json) {
  return _WillSaveReq.fromJson(json);
}

/// @nodoc
mixin _$WillSaveReq {
  List<AssetReq> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WillSaveReqCopyWith<WillSaveReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WillSaveReqCopyWith<$Res> {
  factory $WillSaveReqCopyWith(
          WillSaveReq value, $Res Function(WillSaveReq) then) =
      _$WillSaveReqCopyWithImpl<$Res, WillSaveReq>;
  @useResult
  $Res call({List<AssetReq> assets});
}

/// @nodoc
class _$WillSaveReqCopyWithImpl<$Res, $Val extends WillSaveReq>
    implements $WillSaveReqCopyWith<$Res> {
  _$WillSaveReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetReq>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WillSaveReqImplCopyWith<$Res>
    implements $WillSaveReqCopyWith<$Res> {
  factory _$$WillSaveReqImplCopyWith(
          _$WillSaveReqImpl value, $Res Function(_$WillSaveReqImpl) then) =
      __$$WillSaveReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AssetReq> assets});
}

/// @nodoc
class __$$WillSaveReqImplCopyWithImpl<$Res>
    extends _$WillSaveReqCopyWithImpl<$Res, _$WillSaveReqImpl>
    implements _$$WillSaveReqImplCopyWith<$Res> {
  __$$WillSaveReqImplCopyWithImpl(
      _$WillSaveReqImpl _value, $Res Function(_$WillSaveReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
  }) {
    return _then(_$WillSaveReqImpl(
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<AssetReq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WillSaveReqImpl implements _WillSaveReq {
  _$WillSaveReqImpl({required final List<AssetReq> assets}) : _assets = assets;

  factory _$WillSaveReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$WillSaveReqImplFromJson(json);

  final List<AssetReq> _assets;
  @override
  List<AssetReq> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'WillSaveReq(assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WillSaveReqImpl &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WillSaveReqImplCopyWith<_$WillSaveReqImpl> get copyWith =>
      __$$WillSaveReqImplCopyWithImpl<_$WillSaveReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WillSaveReqImplToJson(
      this,
    );
  }
}

abstract class _WillSaveReq implements WillSaveReq {
  factory _WillSaveReq({required final List<AssetReq> assets}) =
      _$WillSaveReqImpl;

  factory _WillSaveReq.fromJson(Map<String, dynamic> json) =
      _$WillSaveReqImpl.fromJson;

  @override
  List<AssetReq> get assets;
  @override
  @JsonKey(ignore: true)
  _$$WillSaveReqImplCopyWith<_$WillSaveReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetReq _$AssetReqFromJson(Map<String, dynamic> json) {
  return _AssetReq.fromJson(json);
}

/// @nodoc
mixin _$AssetReq {
  int get assetId => throw _privateConstructorUsedError;
  List<NomineeReq> get nominees => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetReqCopyWith<AssetReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetReqCopyWith<$Res> {
  factory $AssetReqCopyWith(AssetReq value, $Res Function(AssetReq) then) =
      _$AssetReqCopyWithImpl<$Res, AssetReq>;
  @useResult
  $Res call({int assetId, List<NomineeReq> nominees});
}

/// @nodoc
class _$AssetReqCopyWithImpl<$Res, $Val extends AssetReq>
    implements $AssetReqCopyWith<$Res> {
  _$AssetReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetId = null,
    Object? nominees = null,
  }) {
    return _then(_value.copyWith(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      nominees: null == nominees
          ? _value.nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<NomineeReq>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetReqImplCopyWith<$Res>
    implements $AssetReqCopyWith<$Res> {
  factory _$$AssetReqImplCopyWith(
          _$AssetReqImpl value, $Res Function(_$AssetReqImpl) then) =
      __$$AssetReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int assetId, List<NomineeReq> nominees});
}

/// @nodoc
class __$$AssetReqImplCopyWithImpl<$Res>
    extends _$AssetReqCopyWithImpl<$Res, _$AssetReqImpl>
    implements _$$AssetReqImplCopyWith<$Res> {
  __$$AssetReqImplCopyWithImpl(
      _$AssetReqImpl _value, $Res Function(_$AssetReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assetId = null,
    Object? nominees = null,
  }) {
    return _then(_$AssetReqImpl(
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      nominees: null == nominees
          ? _value._nominees
          : nominees // ignore: cast_nullable_to_non_nullable
              as List<NomineeReq>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetReqImpl implements _AssetReq {
  _$AssetReqImpl(
      {required this.assetId, required final List<NomineeReq> nominees})
      : _nominees = nominees;

  factory _$AssetReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetReqImplFromJson(json);

  @override
  final int assetId;
  final List<NomineeReq> _nominees;
  @override
  List<NomineeReq> get nominees {
    if (_nominees is EqualUnmodifiableListView) return _nominees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nominees);
  }

  @override
  String toString() {
    return 'AssetReq(assetId: $assetId, nominees: $nominees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetReqImpl &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            const DeepCollectionEquality().equals(other._nominees, _nominees));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, assetId, const DeepCollectionEquality().hash(_nominees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetReqImplCopyWith<_$AssetReqImpl> get copyWith =>
      __$$AssetReqImplCopyWithImpl<_$AssetReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetReqImplToJson(
      this,
    );
  }
}

abstract class _AssetReq implements AssetReq {
  factory _AssetReq(
      {required final int assetId,
      required final List<NomineeReq> nominees}) = _$AssetReqImpl;

  factory _AssetReq.fromJson(Map<String, dynamic> json) =
      _$AssetReqImpl.fromJson;

  @override
  int get assetId;
  @override
  List<NomineeReq> get nominees;
  @override
  @JsonKey(ignore: true)
  _$$AssetReqImplCopyWith<_$AssetReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NomineeReq _$NomineeReqFromJson(Map<String, dynamic> json) {
  return _NomineeReq.fromJson(json);
}

/// @nodoc
mixin _$NomineeReq {
  int get nomineeId => throw _privateConstructorUsedError;
  double get share => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NomineeReqCopyWith<NomineeReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NomineeReqCopyWith<$Res> {
  factory $NomineeReqCopyWith(
          NomineeReq value, $Res Function(NomineeReq) then) =
      _$NomineeReqCopyWithImpl<$Res, NomineeReq>;
  @useResult
  $Res call({int nomineeId, double share});
}

/// @nodoc
class _$NomineeReqCopyWithImpl<$Res, $Val extends NomineeReq>
    implements $NomineeReqCopyWith<$Res> {
  _$NomineeReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomineeId = null,
    Object? share = null,
  }) {
    return _then(_value.copyWith(
      nomineeId: null == nomineeId
          ? _value.nomineeId
          : nomineeId // ignore: cast_nullable_to_non_nullable
              as int,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NomineeReqImplCopyWith<$Res>
    implements $NomineeReqCopyWith<$Res> {
  factory _$$NomineeReqImplCopyWith(
          _$NomineeReqImpl value, $Res Function(_$NomineeReqImpl) then) =
      __$$NomineeReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int nomineeId, double share});
}

/// @nodoc
class __$$NomineeReqImplCopyWithImpl<$Res>
    extends _$NomineeReqCopyWithImpl<$Res, _$NomineeReqImpl>
    implements _$$NomineeReqImplCopyWith<$Res> {
  __$$NomineeReqImplCopyWithImpl(
      _$NomineeReqImpl _value, $Res Function(_$NomineeReqImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nomineeId = null,
    Object? share = null,
  }) {
    return _then(_$NomineeReqImpl(
      nomineeId: null == nomineeId
          ? _value.nomineeId
          : nomineeId // ignore: cast_nullable_to_non_nullable
              as int,
      share: null == share
          ? _value.share
          : share // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NomineeReqImpl implements _NomineeReq {
  _$NomineeReqImpl({required this.nomineeId, required this.share});

  factory _$NomineeReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$NomineeReqImplFromJson(json);

  @override
  final int nomineeId;
  @override
  final double share;

  @override
  String toString() {
    return 'NomineeReq(nomineeId: $nomineeId, share: $share)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NomineeReqImpl &&
            (identical(other.nomineeId, nomineeId) ||
                other.nomineeId == nomineeId) &&
            (identical(other.share, share) || other.share == share));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nomineeId, share);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NomineeReqImplCopyWith<_$NomineeReqImpl> get copyWith =>
      __$$NomineeReqImplCopyWithImpl<_$NomineeReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NomineeReqImplToJson(
      this,
    );
  }
}

abstract class _NomineeReq implements NomineeReq {
  factory _NomineeReq(
      {required final int nomineeId,
      required final double share}) = _$NomineeReqImpl;

  factory _NomineeReq.fromJson(Map<String, dynamic> json) =
      _$NomineeReqImpl.fromJson;

  @override
  int get nomineeId;
  @override
  double get share;
  @override
  @JsonKey(ignore: true)
  _$$NomineeReqImplCopyWith<_$NomineeReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
