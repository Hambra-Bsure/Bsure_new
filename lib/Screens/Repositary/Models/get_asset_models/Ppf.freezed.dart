// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Ppf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PPfResponse _$PPfResponseFromJson(Map<String, dynamic> json) {
  return _PPfResponse.fromJson(json);
}

/// @nodoc
mixin _$PPfResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<PPf> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PPfResponseCopyWith<PPfResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PPfResponseCopyWith<$Res> {
  factory $PPfResponseCopyWith(
          PPfResponse value, $Res Function(PPfResponse) then) =
      _$PPfResponseCopyWithImpl<$Res, PPfResponse>;
  @useResult
  $Res call({bool success, String message, List<PPf> assets});
}

/// @nodoc
class _$PPfResponseCopyWithImpl<$Res, $Val extends PPfResponse>
    implements $PPfResponseCopyWith<$Res> {
  _$PPfResponseCopyWithImpl(this._value, this._then);

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
              as List<PPf>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PPfResponseImplCopyWith<$Res>
    implements $PPfResponseCopyWith<$Res> {
  factory _$$PPfResponseImplCopyWith(
          _$PPfResponseImpl value, $Res Function(_$PPfResponseImpl) then) =
      __$$PPfResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<PPf> assets});
}

/// @nodoc
class __$$PPfResponseImplCopyWithImpl<$Res>
    extends _$PPfResponseCopyWithImpl<$Res, _$PPfResponseImpl>
    implements _$$PPfResponseImplCopyWith<$Res> {
  __$$PPfResponseImplCopyWithImpl(
      _$PPfResponseImpl _value, $Res Function(_$PPfResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$PPfResponseImpl(
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
              as List<PPf>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PPfResponseImpl with DiagnosticableTreeMixin implements _PPfResponse {
  _$PPfResponseImpl(
      {required this.success,
      required this.message,
      required final List<PPf> assets})
      : _assets = assets;

  factory _$PPfResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PPfResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<PPf> _assets;
  @override
  List<PPf> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PPfResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PPfResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PPfResponseImpl &&
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
  _$$PPfResponseImplCopyWith<_$PPfResponseImpl> get copyWith =>
      __$$PPfResponseImplCopyWithImpl<_$PPfResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PPfResponseImplToJson(
      this,
    );
  }
}

abstract class _PPfResponse implements PPfResponse {
  factory _PPfResponse(
      {required final bool success,
      required final String message,
      required final List<PPf> assets}) = _$PPfResponseImpl;

  factory _PPfResponse.fromJson(Map<String, dynamic> json) =
      _$PPfResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<PPf> get assets;
  @override
  @JsonKey(ignore: true)
  _$$PPfResponseImplCopyWith<_$PPfResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PPf _$PPfFromJson(Map<String, dynamic> json) {
  return _PPf.fromJson(json);
}

/// @nodoc
mixin _$PPf {
  String get category => throw _privateConstructorUsedError;
  String get ppfAccountNumber => throw _privateConstructorUsedError;
  String get institutionName => throw _privateConstructorUsedError;
  String? get comments =>
      throw _privateConstructorUsedError; // Making comments field nullable if it's not always present
  String? get attachment =>
      throw _privateConstructorUsedError; // Making attachment field nullable if it's not always present
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PPfCopyWith<PPf> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PPfCopyWith<$Res> {
  factory $PPfCopyWith(PPf value, $Res Function(PPf) then) =
      _$PPfCopyWithImpl<$Res, PPf>;
  @useResult
  $Res call(
      {String category,
      String ppfAccountNumber,
      String institutionName,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$PPfCopyWithImpl<$Res, $Val extends PPf> implements $PPfCopyWith<$Res> {
  _$PPfCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? ppfAccountNumber = null,
    Object? institutionName = null,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ppfAccountNumber: null == ppfAccountNumber
          ? _value.ppfAccountNumber
          : ppfAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      institutionName: null == institutionName
          ? _value.institutionName
          : institutionName // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$PPfImplCopyWith<$Res> implements $PPfCopyWith<$Res> {
  factory _$$PPfImplCopyWith(_$PPfImpl value, $Res Function(_$PPfImpl) then) =
      __$$PPfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String ppfAccountNumber,
      String institutionName,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$PPfImplCopyWithImpl<$Res> extends _$PPfCopyWithImpl<$Res, _$PPfImpl>
    implements _$$PPfImplCopyWith<$Res> {
  __$$PPfImplCopyWithImpl(_$PPfImpl _value, $Res Function(_$PPfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? ppfAccountNumber = null,
    Object? institutionName = null,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$PPfImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ppfAccountNumber: null == ppfAccountNumber
          ? _value.ppfAccountNumber
          : ppfAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      institutionName: null == institutionName
          ? _value.institutionName
          : institutionName // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$PPfImpl with DiagnosticableTreeMixin implements _PPf {
  _$PPfImpl(
      {required this.category,
      required this.ppfAccountNumber,
      required this.institutionName,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$PPfImpl.fromJson(Map<String, dynamic> json) =>
      _$$PPfImplFromJson(json);

  @override
  final String category;
  @override
  final String ppfAccountNumber;
  @override
  final String institutionName;
  @override
  final String? comments;
// Making comments field nullable if it's not always present
  @override
  final String? attachment;
// Making attachment field nullable if it's not always present
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PPf(category: $category, ppfAccountNumber: $ppfAccountNumber, institutionName: $institutionName, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PPf'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('ppfAccountNumber', ppfAccountNumber))
      ..add(DiagnosticsProperty('institutionName', institutionName))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PPfImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.ppfAccountNumber, ppfAccountNumber) ||
                other.ppfAccountNumber == ppfAccountNumber) &&
            (identical(other.institutionName, institutionName) ||
                other.institutionName == institutionName) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, ppfAccountNumber,
      institutionName, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PPfImplCopyWith<_$PPfImpl> get copyWith =>
      __$$PPfImplCopyWithImpl<_$PPfImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PPfImplToJson(
      this,
    );
  }
}

abstract class _PPf implements PPf {
  factory _PPf(
      {required final String category,
      required final String ppfAccountNumber,
      required final String institutionName,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$PPfImpl;

  factory _PPf.fromJson(Map<String, dynamic> json) = _$PPfImpl.fromJson;

  @override
  String get category;
  @override
  String get ppfAccountNumber;
  @override
  String get institutionName;
  @override
  String? get comments;
  @override // Making comments field nullable if it's not always present
  String? get attachment;
  @override // Making attachment field nullable if it's not always present
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$PPfImplCopyWith<_$PPfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
