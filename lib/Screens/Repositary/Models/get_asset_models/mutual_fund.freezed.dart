// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutual_fund.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MutualFundResponse _$MutualFundResponseFromJson(Map<String, dynamic> json) {
  return _MutualFundResponse.fromJson(json);
}

/// @nodoc
mixin _$MutualFundResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<MutualFund> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MutualFundResponseCopyWith<MutualFundResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutualFundResponseCopyWith<$Res> {
  factory $MutualFundResponseCopyWith(
          MutualFundResponse value, $Res Function(MutualFundResponse) then) =
      _$MutualFundResponseCopyWithImpl<$Res, MutualFundResponse>;
  @useResult
  $Res call({bool success, String message, List<MutualFund> assets});
}

/// @nodoc
class _$MutualFundResponseCopyWithImpl<$Res, $Val extends MutualFundResponse>
    implements $MutualFundResponseCopyWith<$Res> {
  _$MutualFundResponseCopyWithImpl(this._value, this._then);

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
              as List<MutualFund>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MutualFundResponseImplCopyWith<$Res>
    implements $MutualFundResponseCopyWith<$Res> {
  factory _$$MutualFundResponseImplCopyWith(_$MutualFundResponseImpl value,
          $Res Function(_$MutualFundResponseImpl) then) =
      __$$MutualFundResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<MutualFund> assets});
}

/// @nodoc
class __$$MutualFundResponseImplCopyWithImpl<$Res>
    extends _$MutualFundResponseCopyWithImpl<$Res, _$MutualFundResponseImpl>
    implements _$$MutualFundResponseImplCopyWith<$Res> {
  __$$MutualFundResponseImplCopyWithImpl(_$MutualFundResponseImpl _value,
      $Res Function(_$MutualFundResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$MutualFundResponseImpl(
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
              as List<MutualFund>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MutualFundResponseImpl
    with DiagnosticableTreeMixin
    implements _MutualFundResponse {
  _$MutualFundResponseImpl(
      {required this.success,
      required this.message,
      required final List<MutualFund> assets})
      : _assets = assets;

  factory _$MutualFundResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MutualFundResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<MutualFund> _assets;
  @override
  List<MutualFund> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MutualFundResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MutualFundResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutualFundResponseImpl &&
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
  _$$MutualFundResponseImplCopyWith<_$MutualFundResponseImpl> get copyWith =>
      __$$MutualFundResponseImplCopyWithImpl<_$MutualFundResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MutualFundResponseImplToJson(
      this,
    );
  }
}

abstract class _MutualFundResponse implements MutualFundResponse {
  factory _MutualFundResponse(
      {required final bool success,
      required final String message,
      required final List<MutualFund> assets}) = _$MutualFundResponseImpl;

  factory _MutualFundResponse.fromJson(Map<String, dynamic> json) =
      _$MutualFundResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<MutualFund> get assets;
  @override
  @JsonKey(ignore: true)
  _$$MutualFundResponseImplCopyWith<_$MutualFundResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MutualFund _$MutualFundFromJson(Map<String, dynamic> json) {
  return _MutualFund.fromJson(json);
}

/// @nodoc
mixin _$MutualFund {
  String? get category => throw _privateConstructorUsedError;
  String? get amcName => throw _privateConstructorUsedError;
  String? get schemeName => throw _privateConstructorUsedError;
  String? get folioNumber => throw _privateConstructorUsedError;
  String? get fundType => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  int? get assetId => throw _privateConstructorUsedError;

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
      {String? category,
      String? amcName,
      String? schemeName,
      String? folioNumber,
      String? fundType,
      String? attachment,
      String? comments,
      int? assetId});
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
    Object? category = freezed,
    Object? amcName = freezed,
    Object? schemeName = freezed,
    Object? folioNumber = freezed,
    Object? fundType = freezed,
    Object? attachment = freezed,
    Object? comments = freezed,
    Object? assetId = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      amcName: freezed == amcName
          ? _value.amcName
          : amcName // ignore: cast_nullable_to_non_nullable
              as String?,
      schemeName: freezed == schemeName
          ? _value.schemeName
          : schemeName // ignore: cast_nullable_to_non_nullable
              as String?,
      folioNumber: freezed == folioNumber
          ? _value.folioNumber
          : folioNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fundType: freezed == fundType
          ? _value.fundType
          : fundType // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      assetId: freezed == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {String? category,
      String? amcName,
      String? schemeName,
      String? folioNumber,
      String? fundType,
      String? attachment,
      String? comments,
      int? assetId});
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
    Object? category = freezed,
    Object? amcName = freezed,
    Object? schemeName = freezed,
    Object? folioNumber = freezed,
    Object? fundType = freezed,
    Object? attachment = freezed,
    Object? comments = freezed,
    Object? assetId = freezed,
  }) {
    return _then(_$MutualFundImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      amcName: freezed == amcName
          ? _value.amcName
          : amcName // ignore: cast_nullable_to_non_nullable
              as String?,
      schemeName: freezed == schemeName
          ? _value.schemeName
          : schemeName // ignore: cast_nullable_to_non_nullable
              as String?,
      folioNumber: freezed == folioNumber
          ? _value.folioNumber
          : folioNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fundType: freezed == fundType
          ? _value.fundType
          : fundType // ignore: cast_nullable_to_non_nullable
              as String?,
      attachment: freezed == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      assetId: freezed == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MutualFundImpl with DiagnosticableTreeMixin implements _MutualFund {
  _$MutualFundImpl(
      {required this.category,
      required this.amcName,
      required this.schemeName,
      required this.folioNumber,
      required this.fundType,
      required this.attachment,
      required this.comments,
      required this.assetId});

  factory _$MutualFundImpl.fromJson(Map<String, dynamic> json) =>
      _$$MutualFundImplFromJson(json);

  @override
  final String? category;
  @override
  final String? amcName;
  @override
  final String? schemeName;
  @override
  final String? folioNumber;
  @override
  final String? fundType;
  @override
  final String? attachment;
  @override
  final String? comments;
  @override
  final int? assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MutualFund(category: $category, amcName: $amcName, schemeName: $schemeName, folioNumber: $folioNumber, fundType: $fundType, attachment: $attachment, comments: $comments, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MutualFund'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('amcName', amcName))
      ..add(DiagnosticsProperty('schemeName', schemeName))
      ..add(DiagnosticsProperty('folioNumber', folioNumber))
      ..add(DiagnosticsProperty('fundType', fundType))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MutualFundImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amcName, amcName) || other.amcName == amcName) &&
            (identical(other.schemeName, schemeName) ||
                other.schemeName == schemeName) &&
            (identical(other.folioNumber, folioNumber) ||
                other.folioNumber == folioNumber) &&
            (identical(other.fundType, fundType) ||
                other.fundType == fundType) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, amcName, schemeName,
      folioNumber, fundType, attachment, comments, assetId);

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
      {required final String? category,
      required final String? amcName,
      required final String? schemeName,
      required final String? folioNumber,
      required final String? fundType,
      required final String? attachment,
      required final String? comments,
      required final int? assetId}) = _$MutualFundImpl;

  factory _MutualFund.fromJson(Map<String, dynamic> json) =
      _$MutualFundImpl.fromJson;

  @override
  String? get category;
  @override
  String? get amcName;
  @override
  String? get schemeName;
  @override
  String? get folioNumber;
  @override
  String? get fundType;
  @override
  String? get attachment;
  @override
  String? get comments;
  @override
  int? get assetId;
  @override
  @JsonKey(ignore: true)
  _$$MutualFundImplCopyWith<_$MutualFundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
