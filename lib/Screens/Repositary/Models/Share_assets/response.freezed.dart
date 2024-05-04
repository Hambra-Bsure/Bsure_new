// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetAssetsResponse _$GetAssetsResponseFromJson(Map<String, dynamic> json) {
  return _GetAssetsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetAssetsResponse {
  List<Asset> get assets => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAssetsResponseCopyWith<GetAssetsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAssetsResponseCopyWith<$Res> {
  factory $GetAssetsResponseCopyWith(
          GetAssetsResponse value, $Res Function(GetAssetsResponse) then) =
      _$GetAssetsResponseCopyWithImpl<$Res, GetAssetsResponse>;
  @useResult
  $Res call({List<Asset> assets, bool success, String message});
}

/// @nodoc
class _$GetAssetsResponseCopyWithImpl<$Res, $Val extends GetAssetsResponse>
    implements $GetAssetsResponseCopyWith<$Res> {
  _$GetAssetsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAssetsResponseImplCopyWith<$Res>
    implements $GetAssetsResponseCopyWith<$Res> {
  factory _$$GetAssetsResponseImplCopyWith(_$GetAssetsResponseImpl value,
          $Res Function(_$GetAssetsResponseImpl) then) =
      __$$GetAssetsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Asset> assets, bool success, String message});
}

/// @nodoc
class __$$GetAssetsResponseImplCopyWithImpl<$Res>
    extends _$GetAssetsResponseCopyWithImpl<$Res, _$GetAssetsResponseImpl>
    implements _$$GetAssetsResponseImplCopyWith<$Res> {
  __$$GetAssetsResponseImplCopyWithImpl(_$GetAssetsResponseImpl _value,
      $Res Function(_$GetAssetsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assets = null,
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$GetAssetsResponseImpl(
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAssetsResponseImpl implements _GetAssetsResponse {
  const _$GetAssetsResponseImpl(
      {required final List<Asset> assets,
      required this.success,
      required this.message})
      : _assets = assets;

  factory _$GetAssetsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAssetsResponseImplFromJson(json);

  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  final bool success;
  @override
  final String message;

  @override
  String toString() {
    return 'GetAssetsResponse(assets: $assets, success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAssetsResponseImpl &&
            const DeepCollectionEquality().equals(other._assets, _assets) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_assets), success, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAssetsResponseImplCopyWith<_$GetAssetsResponseImpl> get copyWith =>
      __$$GetAssetsResponseImplCopyWithImpl<_$GetAssetsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAssetsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetAssetsResponse implements GetAssetsResponse {
  const factory _GetAssetsResponse(
      {required final List<Asset> assets,
      required final bool success,
      required final String message}) = _$GetAssetsResponseImpl;

  factory _GetAssetsResponse.fromJson(Map<String, dynamic> json) =
      _$GetAssetsResponseImpl.fromJson;

  @override
  List<Asset> get assets;
  @override
  bool get success;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$GetAssetsResponseImplCopyWith<_$GetAssetsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  String get category => throw _privateConstructorUsedError;
  List<AssetList> get assetList => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

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
      {String category, List<AssetList> assetList, bool? isSelected, int? id});
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
    Object? category = null,
    Object? assetList = null,
    Object? isSelected = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      assetList: null == assetList
          ? _value.assetList
          : assetList // ignore: cast_nullable_to_non_nullable
              as List<AssetList>,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {String category, List<AssetList> assetList, bool? isSelected, int? id});
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
    Object? category = null,
    Object? assetList = null,
    Object? isSelected = freezed,
    Object? id = freezed,
  }) {
    return _then(_$AssetImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      assetList: null == assetList
          ? _value._assetList
          : assetList // ignore: cast_nullable_to_non_nullable
              as List<AssetList>,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl(
      {required this.category,
      required final List<AssetList> assetList,
      this.isSelected,
      this.id})
      : _assetList = assetList;

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final String category;
  final List<AssetList> _assetList;
  @override
  List<AssetList> get assetList {
    if (_assetList is EqualUnmodifiableListView) return _assetList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetList);
  }

  @override
  final bool? isSelected;
  @override
  final int? id;

  @override
  String toString() {
    return 'Asset(category: $category, assetList: $assetList, isSelected: $isSelected, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._assetList, _assetList) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category,
      const DeepCollectionEquality().hash(_assetList), isSelected, id);

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
      {required final String category,
      required final List<AssetList> assetList,
      final bool? isSelected,
      final int? id}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  String get category;
  @override
  List<AssetList> get assetList;
  @override
  bool? get isSelected;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssetList _$AssetListFromJson(Map<String, dynamic> json) {
  return _AssetList.fromJson(json);
}

/// @nodoc
mixin _$AssetList {
  String get fieldName => throw _privateConstructorUsedError;
  dynamic get fieldValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssetListCopyWith<AssetList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetListCopyWith<$Res> {
  factory $AssetListCopyWith(AssetList value, $Res Function(AssetList) then) =
      _$AssetListCopyWithImpl<$Res, AssetList>;
  @useResult
  $Res call({String fieldName, dynamic fieldValue});
}

/// @nodoc
class _$AssetListCopyWithImpl<$Res, $Val extends AssetList>
    implements $AssetListCopyWith<$Res> {
  _$AssetListCopyWithImpl(this._value, this._then);

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
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetListImplCopyWith<$Res>
    implements $AssetListCopyWith<$Res> {
  factory _$$AssetListImplCopyWith(
          _$AssetListImpl value, $Res Function(_$AssetListImpl) then) =
      __$$AssetListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fieldName, dynamic fieldValue});
}

/// @nodoc
class __$$AssetListImplCopyWithImpl<$Res>
    extends _$AssetListCopyWithImpl<$Res, _$AssetListImpl>
    implements _$$AssetListImplCopyWith<$Res> {
  __$$AssetListImplCopyWithImpl(
      _$AssetListImpl _value, $Res Function(_$AssetListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldName = null,
    Object? fieldValue = freezed,
  }) {
    return _then(_$AssetListImpl(
      fieldName: null == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String,
      fieldValue: freezed == fieldValue
          ? _value.fieldValue
          : fieldValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetListImpl implements _AssetList {
  const _$AssetListImpl({required this.fieldName, required this.fieldValue});

  factory _$AssetListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetListImplFromJson(json);

  @override
  final String fieldName;
  @override
  final dynamic fieldValue;

  @override
  String toString() {
    return 'AssetList(fieldName: $fieldName, fieldValue: $fieldValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetListImpl &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            const DeepCollectionEquality()
                .equals(other.fieldValue, fieldValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, fieldName, const DeepCollectionEquality().hash(fieldValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetListImplCopyWith<_$AssetListImpl> get copyWith =>
      __$$AssetListImplCopyWithImpl<_$AssetListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetListImplToJson(
      this,
    );
  }
}

abstract class _AssetList implements AssetList {
  const factory _AssetList(
      {required final String fieldName,
      required final dynamic fieldValue}) = _$AssetListImpl;

  factory _AssetList.fromJson(Map<String, dynamic> json) =
      _$AssetListImpl.fromJson;

  @override
  String get fieldName;
  @override
  dynamic get fieldValue;
  @override
  @JsonKey(ignore: true)
  _$$AssetListImplCopyWith<_$AssetListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
