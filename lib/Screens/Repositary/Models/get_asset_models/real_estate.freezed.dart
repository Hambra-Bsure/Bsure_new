// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'real_estate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RealEstateResponse _$RealEstateResponseFromJson(Map<String, dynamic> json) {
  return _RealEstateResponse.fromJson(json);
}

/// @nodoc
mixin _$RealEstateResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<RealEstate> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealEstateResponseCopyWith<RealEstateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealEstateResponseCopyWith<$Res> {
  factory $RealEstateResponseCopyWith(
          RealEstateResponse value, $Res Function(RealEstateResponse) then) =
      _$RealEstateResponseCopyWithImpl<$Res, RealEstateResponse>;
  @useResult
  $Res call({bool success, String message, List<RealEstate> assets});
}

/// @nodoc
class _$RealEstateResponseCopyWithImpl<$Res, $Val extends RealEstateResponse>
    implements $RealEstateResponseCopyWith<$Res> {
  _$RealEstateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<RealEstate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealEstateResponseImplCopyWith<$Res>
    implements $RealEstateResponseCopyWith<$Res> {
  factory _$$RealEstateResponseImplCopyWith(_$RealEstateResponseImpl value,
          $Res Function(_$RealEstateResponseImpl) then) =
      __$$RealEstateResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<RealEstate> assets});
}

/// @nodoc
class __$$RealEstateResponseImplCopyWithImpl<$Res>
    extends _$RealEstateResponseCopyWithImpl<$Res, _$RealEstateResponseImpl>
    implements _$$RealEstateResponseImplCopyWith<$Res> {
  __$$RealEstateResponseImplCopyWithImpl(_$RealEstateResponseImpl _value,
      $Res Function(_$RealEstateResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$RealEstateResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<RealEstate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealEstateResponseImpl
    with DiagnosticableTreeMixin
    implements _RealEstateResponse {
  _$RealEstateResponseImpl(
      {required this.success,
      required this.message,
      required final List<RealEstate> assets})
      : _assets = assets;

  factory _$RealEstateResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealEstateResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<RealEstate> _assets;
  @override
  List<RealEstate> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RealEstateResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RealEstateResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealEstateResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_assets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RealEstateResponseImplCopyWith<_$RealEstateResponseImpl> get copyWith =>
      __$$RealEstateResponseImplCopyWithImpl<_$RealEstateResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealEstateResponseImplToJson(
      this,
    );
  }
}

abstract class _RealEstateResponse implements RealEstateResponse {
  factory _RealEstateResponse(
      {required final bool success,
      required final String message,
      required final List<RealEstate> assets}) = _$RealEstateResponseImpl;

  factory _RealEstateResponse.fromJson(Map<String, dynamic> json) =
      _$RealEstateResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<RealEstate> get assets;
  @override
  @JsonKey(ignore: true)
  _$$RealEstateResponseImplCopyWith<_$RealEstateResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RealEstate _$RealEstateFromJson(Map<String, dynamic> json) {
  return _RealEstate.fromJson(json);
}

/// @nodoc
mixin _$RealEstate {
  String get category => throw _privateConstructorUsedError;
  String? get typeOfProperty => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get khataNumber => throw _privateConstructorUsedError;
  String? get northOfProperty => throw _privateConstructorUsedError;
  String? get southOfProperty => throw _privateConstructorUsedError;
  String? get eastOfProperty => throw _privateConstructorUsedError;
  String? get westOfProperty =>
      throw _privateConstructorUsedError; // Corrected typo
  String? get image => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RealEstateCopyWith<RealEstate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RealEstateCopyWith<$Res> {
  factory $RealEstateCopyWith(
          RealEstate value, $Res Function(RealEstate) then) =
      _$RealEstateCopyWithImpl<$Res, RealEstate>;
  @useResult
  $Res call(
      {String category,
      String? typeOfProperty,
      String? address,
      String? khataNumber,
      String? northOfProperty,
      String? southOfProperty,
      String? eastOfProperty,
      String? westOfProperty,
      String? image,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$RealEstateCopyWithImpl<$Res, $Val extends RealEstate>
    implements $RealEstateCopyWith<$Res> {
  _$RealEstateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? typeOfProperty = freezed,
    Object? address = freezed,
    Object? khataNumber = freezed,
    Object? northOfProperty = freezed,
    Object? southOfProperty = freezed,
    Object? eastOfProperty = freezed,
    Object? westOfProperty = freezed,
    Object? image = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfProperty: freezed == typeOfProperty
          ? _value.typeOfProperty
          : typeOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      khataNumber: freezed == khataNumber
          ? _value.khataNumber
          : khataNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      northOfProperty: freezed == northOfProperty
          ? _value.northOfProperty
          : northOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      southOfProperty: freezed == southOfProperty
          ? _value.southOfProperty
          : southOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      eastOfProperty: freezed == eastOfProperty
          ? _value.eastOfProperty
          : eastOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      westOfProperty: freezed == westOfProperty
          ? _value.westOfProperty
          : westOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RealEstateImplCopyWith<$Res>
    implements $RealEstateCopyWith<$Res> {
  factory _$$RealEstateImplCopyWith(
          _$RealEstateImpl value, $Res Function(_$RealEstateImpl) then) =
      __$$RealEstateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String? typeOfProperty,
      String? address,
      String? khataNumber,
      String? northOfProperty,
      String? southOfProperty,
      String? eastOfProperty,
      String? westOfProperty,
      String? image,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$RealEstateImplCopyWithImpl<$Res>
    extends _$RealEstateCopyWithImpl<$Res, _$RealEstateImpl>
    implements _$$RealEstateImplCopyWith<$Res> {
  __$$RealEstateImplCopyWithImpl(
      _$RealEstateImpl _value, $Res Function(_$RealEstateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? typeOfProperty = freezed,
    Object? address = freezed,
    Object? khataNumber = freezed,
    Object? northOfProperty = freezed,
    Object? southOfProperty = freezed,
    Object? eastOfProperty = freezed,
    Object? westOfProperty = freezed,
    Object? image = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$RealEstateImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfProperty: freezed == typeOfProperty
          ? _value.typeOfProperty
          : typeOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      khataNumber: freezed == khataNumber
          ? _value.khataNumber
          : khataNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      northOfProperty: freezed == northOfProperty
          ? _value.northOfProperty
          : northOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      southOfProperty: freezed == southOfProperty
          ? _value.southOfProperty
          : southOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      eastOfProperty: freezed == eastOfProperty
          ? _value.eastOfProperty
          : eastOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      westOfProperty: freezed == westOfProperty
          ? _value.westOfProperty
          : westOfProperty // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RealEstateImpl with DiagnosticableTreeMixin implements _RealEstate {
  _$RealEstateImpl(
      {required this.category,
      required this.typeOfProperty,
      required this.address,
      required this.khataNumber,
      required this.northOfProperty,
      required this.southOfProperty,
      required this.eastOfProperty,
      required this.westOfProperty,
      required this.image,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$RealEstateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RealEstateImplFromJson(json);

  @override
  final String category;
  @override
  final String? typeOfProperty;
  @override
  final String? address;
  @override
  final String? khataNumber;
  @override
  final String? northOfProperty;
  @override
  final String? southOfProperty;
  @override
  final String? eastOfProperty;
  @override
  final String? westOfProperty;
// Corrected typo
  @override
  final String? image;
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RealEstate(category: $category, typeOfProperty: $typeOfProperty, address: $address, khataNumber: $khataNumber, northOfProperty: $northOfProperty, southOfProperty: $southOfProperty, eastOfProperty: $eastOfProperty, westOfProperty: $westOfProperty, image: $image, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RealEstate'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('typeOfProperty', typeOfProperty))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('khataNumber', khataNumber))
      ..add(DiagnosticsProperty('northOfProperty', northOfProperty))
      ..add(DiagnosticsProperty('southOfProperty', southOfProperty))
      ..add(DiagnosticsProperty('eastOfProperty', eastOfProperty))
      ..add(DiagnosticsProperty('westOfProperty', westOfProperty))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealEstateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.typeOfProperty, typeOfProperty) ||
                other.typeOfProperty == typeOfProperty) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.khataNumber, khataNumber) ||
                other.khataNumber == khataNumber) &&
            (identical(other.northOfProperty, northOfProperty) ||
                other.northOfProperty == northOfProperty) &&
            (identical(other.southOfProperty, southOfProperty) ||
                other.southOfProperty == southOfProperty) &&
            (identical(other.eastOfProperty, eastOfProperty) ||
                other.eastOfProperty == eastOfProperty) &&
            (identical(other.westOfProperty, westOfProperty) ||
                other.westOfProperty == westOfProperty) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      typeOfProperty,
      address,
      khataNumber,
      northOfProperty,
      southOfProperty,
      eastOfProperty,
      westOfProperty,
      image,
      comments,
      attachment,
      assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RealEstateImplCopyWith<_$RealEstateImpl> get copyWith =>
      __$$RealEstateImplCopyWithImpl<_$RealEstateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RealEstateImplToJson(
      this,
    );
  }
}

abstract class _RealEstate implements RealEstate {
  factory _RealEstate(
      {required final String category,
      required final String? typeOfProperty,
      required final String? address,
      required final String? khataNumber,
      required final String? northOfProperty,
      required final String? southOfProperty,
      required final String? eastOfProperty,
      required final String? westOfProperty,
      required final String? image,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$RealEstateImpl;

  factory _RealEstate.fromJson(Map<String, dynamic> json) =
      _$RealEstateImpl.fromJson;

  @override
  String get category;
  @override
  String? get typeOfProperty;
  @override
  String? get address;
  @override
  String? get khataNumber;
  @override
  String? get northOfProperty;
  @override
  String? get southOfProperty;
  @override
  String? get eastOfProperty;
  @override
  String? get westOfProperty;
  @override // Corrected typo
  String? get image;
  @override
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$RealEstateImplCopyWith<_$RealEstateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
