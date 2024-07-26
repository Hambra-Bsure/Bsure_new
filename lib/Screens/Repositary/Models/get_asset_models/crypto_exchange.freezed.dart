// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_exchange.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CryptoExchangeResponse _$CryptoExchangeResponseFromJson(
    Map<String, dynamic> json) {
  return _CryptoExchangeResponse.fromJson(json);
}

/// @nodoc
mixin _$CryptoExchangeResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CryptoExchange> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoExchangeResponseCopyWith<CryptoExchangeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoExchangeResponseCopyWith<$Res> {
  factory $CryptoExchangeResponseCopyWith(CryptoExchangeResponse value,
          $Res Function(CryptoExchangeResponse) then) =
      _$CryptoExchangeResponseCopyWithImpl<$Res, CryptoExchangeResponse>;
  @useResult
  $Res call({bool success, String message, List<CryptoExchange> assets});
}

/// @nodoc
class _$CryptoExchangeResponseCopyWithImpl<$Res,
        $Val extends CryptoExchangeResponse>
    implements $CryptoExchangeResponseCopyWith<$Res> {
  _$CryptoExchangeResponseCopyWithImpl(this._value, this._then);

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
              as List<CryptoExchange>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoExchangeResponseImplCopyWith<$Res>
    implements $CryptoExchangeResponseCopyWith<$Res> {
  factory _$$CryptoExchangeResponseImplCopyWith(
          _$CryptoExchangeResponseImpl value,
          $Res Function(_$CryptoExchangeResponseImpl) then) =
      __$$CryptoExchangeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<CryptoExchange> assets});
}

/// @nodoc
class __$$CryptoExchangeResponseImplCopyWithImpl<$Res>
    extends _$CryptoExchangeResponseCopyWithImpl<$Res,
        _$CryptoExchangeResponseImpl>
    implements _$$CryptoExchangeResponseImplCopyWith<$Res> {
  __$$CryptoExchangeResponseImplCopyWithImpl(
      _$CryptoExchangeResponseImpl _value,
      $Res Function(_$CryptoExchangeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$CryptoExchangeResponseImpl(
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
              as List<CryptoExchange>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoExchangeResponseImpl
    with DiagnosticableTreeMixin
    implements _CryptoExchangeResponse {
  _$CryptoExchangeResponseImpl(
      {required this.success,
      required this.message,
      required final List<CryptoExchange> assets})
      : _assets = assets;

  factory _$CryptoExchangeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoExchangeResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<CryptoExchange> _assets;
  @override
  List<CryptoExchange> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CryptoExchangeResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CryptoExchangeResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoExchangeResponseImpl &&
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
  _$$CryptoExchangeResponseImplCopyWith<_$CryptoExchangeResponseImpl>
      get copyWith => __$$CryptoExchangeResponseImplCopyWithImpl<
          _$CryptoExchangeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoExchangeResponseImplToJson(
      this,
    );
  }
}

abstract class _CryptoExchangeResponse implements CryptoExchangeResponse {
  factory _CryptoExchangeResponse(
          {required final bool success,
          required final String message,
          required final List<CryptoExchange> assets}) =
      _$CryptoExchangeResponseImpl;

  factory _CryptoExchangeResponse.fromJson(Map<String, dynamic> json) =
      _$CryptoExchangeResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<CryptoExchange> get assets;
  @override
  @JsonKey(ignore: true)
  _$$CryptoExchangeResponseImplCopyWith<_$CryptoExchangeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CryptoExchange _$CryptoExchangeFromJson(Map<String, dynamic> json) {
  return _CryptoExchange.fromJson(json);
}

/// @nodoc
mixin _$CryptoExchange {
  String get category => throw _privateConstructorUsedError;
  String get exchangeName => throw _privateConstructorUsedError;
  String get accountNumber => throw _privateConstructorUsedError;
  String? get walletAddress => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoExchangeCopyWith<CryptoExchange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoExchangeCopyWith<$Res> {
  factory $CryptoExchangeCopyWith(
          CryptoExchange value, $Res Function(CryptoExchange) then) =
      _$CryptoExchangeCopyWithImpl<$Res, CryptoExchange>;
  @useResult
  $Res call(
      {String category,
      String exchangeName,
      String accountNumber,
      String? walletAddress,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$CryptoExchangeCopyWithImpl<$Res, $Val extends CryptoExchange>
    implements $CryptoExchangeCopyWith<$Res> {
  _$CryptoExchangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? exchangeName = null,
    Object? accountNumber = null,
    Object? walletAddress = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      exchangeName: null == exchangeName
          ? _value.exchangeName
          : exchangeName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: freezed == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CryptoExchangeImplCopyWith<$Res>
    implements $CryptoExchangeCopyWith<$Res> {
  factory _$$CryptoExchangeImplCopyWith(_$CryptoExchangeImpl value,
          $Res Function(_$CryptoExchangeImpl) then) =
      __$$CryptoExchangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String exchangeName,
      String accountNumber,
      String? walletAddress,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$CryptoExchangeImplCopyWithImpl<$Res>
    extends _$CryptoExchangeCopyWithImpl<$Res, _$CryptoExchangeImpl>
    implements _$$CryptoExchangeImplCopyWith<$Res> {
  __$$CryptoExchangeImplCopyWithImpl(
      _$CryptoExchangeImpl _value, $Res Function(_$CryptoExchangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? exchangeName = null,
    Object? accountNumber = null,
    Object? walletAddress = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$CryptoExchangeImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      exchangeName: null == exchangeName
          ? _value.exchangeName
          : exchangeName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: freezed == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
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
class _$CryptoExchangeImpl
    with DiagnosticableTreeMixin
    implements _CryptoExchange {
  _$CryptoExchangeImpl(
      {required this.category,
      required this.exchangeName,
      required this.accountNumber,
      required this.walletAddress,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$CryptoExchangeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoExchangeImplFromJson(json);

  @override
  final String category;
  @override
  final String exchangeName;
  @override
  final String accountNumber;
  @override
  final String? walletAddress;
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CryptoExchange(category: $category, exchangeName: $exchangeName, accountNumber: $accountNumber, walletAddress: $walletAddress, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CryptoExchange'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('exchangeName', exchangeName))
      ..add(DiagnosticsProperty('accountNumber', accountNumber))
      ..add(DiagnosticsProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoExchangeImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.exchangeName, exchangeName) ||
                other.exchangeName == exchangeName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, exchangeName,
      accountNumber, walletAddress, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoExchangeImplCopyWith<_$CryptoExchangeImpl> get copyWith =>
      __$$CryptoExchangeImplCopyWithImpl<_$CryptoExchangeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoExchangeImplToJson(
      this,
    );
  }
}

abstract class _CryptoExchange implements CryptoExchange {
  factory _CryptoExchange(
      {required final String category,
      required final String exchangeName,
      required final String accountNumber,
      required final String? walletAddress,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$CryptoExchangeImpl;

  factory _CryptoExchange.fromJson(Map<String, dynamic> json) =
      _$CryptoExchangeImpl.fromJson;

  @override
  String get category;
  @override
  String get exchangeName;
  @override
  String get accountNumber;
  @override
  String? get walletAddress;
  @override
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$CryptoExchangeImplCopyWith<_$CryptoExchangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
