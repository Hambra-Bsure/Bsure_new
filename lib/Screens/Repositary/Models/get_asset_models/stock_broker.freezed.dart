// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_broker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockBrokerResponse _$StockBrokerResponseFromJson(Map<String, dynamic> json) {
  return _StockBrokerResponse.fromJson(json);
}

/// @nodoc
mixin _$StockBrokerResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<StockBroker> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockBrokerResponseCopyWith<StockBrokerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockBrokerResponseCopyWith<$Res> {
  factory $StockBrokerResponseCopyWith(
          StockBrokerResponse value, $Res Function(StockBrokerResponse) then) =
      _$StockBrokerResponseCopyWithImpl<$Res, StockBrokerResponse>;
  @useResult
  $Res call({bool success, String message, List<StockBroker> assets});
}

/// @nodoc
class _$StockBrokerResponseCopyWithImpl<$Res, $Val extends StockBrokerResponse>
    implements $StockBrokerResponseCopyWith<$Res> {
  _$StockBrokerResponseCopyWithImpl(this._value, this._then);

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
              as List<StockBroker>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockBrokerResponseImplCopyWith<$Res>
    implements $StockBrokerResponseCopyWith<$Res> {
  factory _$$StockBrokerResponseImplCopyWith(_$StockBrokerResponseImpl value,
          $Res Function(_$StockBrokerResponseImpl) then) =
      __$$StockBrokerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<StockBroker> assets});
}

/// @nodoc
class __$$StockBrokerResponseImplCopyWithImpl<$Res>
    extends _$StockBrokerResponseCopyWithImpl<$Res, _$StockBrokerResponseImpl>
    implements _$$StockBrokerResponseImplCopyWith<$Res> {
  __$$StockBrokerResponseImplCopyWithImpl(_$StockBrokerResponseImpl _value,
      $Res Function(_$StockBrokerResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$StockBrokerResponseImpl(
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
              as List<StockBroker>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockBrokerResponseImpl
    with DiagnosticableTreeMixin
    implements _StockBrokerResponse {
  _$StockBrokerResponseImpl(
      {required this.success,
      required this.message,
      required final List<StockBroker> assets})
      : _assets = assets;

  factory _$StockBrokerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockBrokerResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<StockBroker> _assets;
  @override
  List<StockBroker> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockBrokerResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockBrokerResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockBrokerResponseImpl &&
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
  _$$StockBrokerResponseImplCopyWith<_$StockBrokerResponseImpl> get copyWith =>
      __$$StockBrokerResponseImplCopyWithImpl<_$StockBrokerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockBrokerResponseImplToJson(
      this,
    );
  }
}

abstract class _StockBrokerResponse implements StockBrokerResponse {
  factory _StockBrokerResponse(
      {required final bool success,
      required final String message,
      required final List<StockBroker> assets}) = _$StockBrokerResponseImpl;

  factory _StockBrokerResponse.fromJson(Map<String, dynamic> json) =
      _$StockBrokerResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<StockBroker> get assets;
  @override
  @JsonKey(ignore: true)
  _$$StockBrokerResponseImplCopyWith<_$StockBrokerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockBroker _$StockBrokerFromJson(Map<String, dynamic> json) {
  return _StockBroker.fromJson(json);
}

/// @nodoc
mixin _$StockBroker {
  String get category => throw _privateConstructorUsedError;
  String get brokerName => throw _privateConstructorUsedError;
  String get dematAccountNumber => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockBrokerCopyWith<StockBroker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockBrokerCopyWith<$Res> {
  factory $StockBrokerCopyWith(
          StockBroker value, $Res Function(StockBroker) then) =
      _$StockBrokerCopyWithImpl<$Res, StockBroker>;
  @useResult
  $Res call(
      {String category,
      String brokerName,
      String dematAccountNumber,
      String attachment,
      String comments,
      int assetId});
}

/// @nodoc
class _$StockBrokerCopyWithImpl<$Res, $Val extends StockBroker>
    implements $StockBrokerCopyWith<$Res> {
  _$StockBrokerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? brokerName = null,
    Object? dematAccountNumber = null,
    Object? attachment = null,
    Object? comments = null,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brokerName: null == brokerName
          ? _value.brokerName
          : brokerName // ignore: cast_nullable_to_non_nullable
              as String,
      dematAccountNumber: null == dematAccountNumber
          ? _value.dematAccountNumber
          : dematAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockBrokerImplCopyWith<$Res>
    implements $StockBrokerCopyWith<$Res> {
  factory _$$StockBrokerImplCopyWith(
          _$StockBrokerImpl value, $Res Function(_$StockBrokerImpl) then) =
      __$$StockBrokerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String brokerName,
      String dematAccountNumber,
      String attachment,
      String comments,
      int assetId});
}

/// @nodoc
class __$$StockBrokerImplCopyWithImpl<$Res>
    extends _$StockBrokerCopyWithImpl<$Res, _$StockBrokerImpl>
    implements _$$StockBrokerImplCopyWith<$Res> {
  __$$StockBrokerImplCopyWithImpl(
      _$StockBrokerImpl _value, $Res Function(_$StockBrokerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? brokerName = null,
    Object? dematAccountNumber = null,
    Object? attachment = null,
    Object? comments = null,
    Object? assetId = null,
  }) {
    return _then(_$StockBrokerImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brokerName: null == brokerName
          ? _value.brokerName
          : brokerName // ignore: cast_nullable_to_non_nullable
              as String,
      dematAccountNumber: null == dematAccountNumber
          ? _value.dematAccountNumber
          : dematAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
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
class _$StockBrokerImpl with DiagnosticableTreeMixin implements _StockBroker {
  _$StockBrokerImpl(
      {required this.category,
      required this.brokerName,
      required this.dematAccountNumber,
      required this.attachment,
      required this.comments,
      required this.assetId});

  factory _$StockBrokerImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockBrokerImplFromJson(json);

  @override
  final String category;
  @override
  final String brokerName;
  @override
  final String dematAccountNumber;
  @override
  final String attachment;
  @override
  final String comments;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockBroker(category: $category, brokerName: $brokerName, dematAccountNumber: $dematAccountNumber, attachment: $attachment, comments: $comments, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockBroker'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('brokerName', brokerName))
      ..add(DiagnosticsProperty('dematAccountNumber', dematAccountNumber))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockBrokerImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brokerName, brokerName) ||
                other.brokerName == brokerName) &&
            (identical(other.dematAccountNumber, dematAccountNumber) ||
                other.dematAccountNumber == dematAccountNumber) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, brokerName,
      dematAccountNumber, attachment, comments, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockBrokerImplCopyWith<_$StockBrokerImpl> get copyWith =>
      __$$StockBrokerImplCopyWithImpl<_$StockBrokerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockBrokerImplToJson(
      this,
    );
  }
}

abstract class _StockBroker implements StockBroker {
  factory _StockBroker(
      {required final String category,
      required final String brokerName,
      required final String dematAccountNumber,
      required final String attachment,
      required final String comments,
      required final int assetId}) = _$StockBrokerImpl;

  factory _StockBroker.fromJson(Map<String, dynamic> json) =
      _$StockBrokerImpl.fromJson;

  @override
  String get category;
  @override
  String get brokerName;
  @override
  String get dematAccountNumber;
  @override
  String get attachment;
  @override
  String get comments;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$StockBrokerImplCopyWith<_$StockBrokerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
