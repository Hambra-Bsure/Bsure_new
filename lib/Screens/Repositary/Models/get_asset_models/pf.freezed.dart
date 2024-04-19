// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pf.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PfResponse _$PfResponseFromJson(Map<String, dynamic> json) {
  return _PfResponse.fromJson(json);
}

/// @nodoc
mixin _$PfResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<PF> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PfResponseCopyWith<PfResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PfResponseCopyWith<$Res> {
  factory $PfResponseCopyWith(
          PfResponse value, $Res Function(PfResponse) then) =
      _$PfResponseCopyWithImpl<$Res, PfResponse>;
  @useResult
  $Res call({bool success, String message, List<PF> assets});
}

/// @nodoc
class _$PfResponseCopyWithImpl<$Res, $Val extends PfResponse>
    implements $PfResponseCopyWith<$Res> {
  _$PfResponseCopyWithImpl(this._value, this._then);

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
              as List<PF>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PfResponseImplCopyWith<$Res>
    implements $PfResponseCopyWith<$Res> {
  factory _$$PfResponseImplCopyWith(
          _$PfResponseImpl value, $Res Function(_$PfResponseImpl) then) =
      __$$PfResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<PF> assets});
}

/// @nodoc
class __$$PfResponseImplCopyWithImpl<$Res>
    extends _$PfResponseCopyWithImpl<$Res, _$PfResponseImpl>
    implements _$$PfResponseImplCopyWith<$Res> {
  __$$PfResponseImplCopyWithImpl(
      _$PfResponseImpl _value, $Res Function(_$PfResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$PfResponseImpl(
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
              as List<PF>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PfResponseImpl with DiagnosticableTreeMixin implements _PfResponse {
  _$PfResponseImpl(
      {required this.success,
      required this.message,
      required final List<PF> assets})
      : _assets = assets;

  factory _$PfResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PfResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<PF> _assets;
  @override
  List<PF> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PfResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PfResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PfResponseImpl &&
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
  _$$PfResponseImplCopyWith<_$PfResponseImpl> get copyWith =>
      __$$PfResponseImplCopyWithImpl<_$PfResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PfResponseImplToJson(
      this,
    );
  }
}

abstract class _PfResponse implements PfResponse {
  factory _PfResponse(
      {required final bool success,
      required final String message,
      required final List<PF> assets}) = _$PfResponseImpl;

  factory _PfResponse.fromJson(Map<String, dynamic> json) =
      _$PfResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<PF> get assets;
  @override
  @JsonKey(ignore: true)
  _$$PfResponseImplCopyWith<_$PfResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PF _$PFFromJson(Map<String, dynamic> json) {
  return _PF.fromJson(json);
}

/// @nodoc
mixin _$PF {
  String get category => throw _privateConstructorUsedError;
  String get uanNumber => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PFCopyWith<PF> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PFCopyWith<$Res> {
  factory $PFCopyWith(PF value, $Res Function(PF) then) =
      _$PFCopyWithImpl<$Res, PF>;
  @useResult
  $Res call(
      {String category,
      String uanNumber,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class _$PFCopyWithImpl<$Res, $Val extends PF> implements $PFCopyWith<$Res> {
  _$PFCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? uanNumber = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      uanNumber: null == uanNumber
          ? _value.uanNumber
          : uanNumber // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PFImplCopyWith<$Res> implements $PFCopyWith<$Res> {
  factory _$$PFImplCopyWith(_$PFImpl value, $Res Function(_$PFImpl) then) =
      __$$PFImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String uanNumber,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class __$$PFImplCopyWithImpl<$Res> extends _$PFCopyWithImpl<$Res, _$PFImpl>
    implements _$$PFImplCopyWith<$Res> {
  __$$PFImplCopyWithImpl(_$PFImpl _value, $Res Function(_$PFImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? uanNumber = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_$PFImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      uanNumber: null == uanNumber
          ? _value.uanNumber
          : uanNumber // ignore: cast_nullable_to_non_nullable
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
class _$PFImpl with DiagnosticableTreeMixin implements _PF {
  _$PFImpl(
      {required this.category,
      required this.uanNumber,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$PFImpl.fromJson(Map<String, dynamic> json) =>
      _$$PFImplFromJson(json);

  @override
  final String category;
  @override
  final String uanNumber;
  @override
  final String comments;
  @override
  final String attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PF(category: $category, uanNumber: $uanNumber, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PF'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('uanNumber', uanNumber))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PFImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.uanNumber, uanNumber) ||
                other.uanNumber == uanNumber) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, uanNumber, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PFImplCopyWith<_$PFImpl> get copyWith =>
      __$$PFImplCopyWithImpl<_$PFImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PFImplToJson(
      this,
    );
  }
}

abstract class _PF implements PF {
  factory _PF(
      {required final String category,
      required final String uanNumber,
      required final String comments,
      required final String attachment,
      required final int assetId}) = _$PFImpl;

  factory _PF.fromJson(Map<String, dynamic> json) = _$PFImpl.fromJson;

  @override
  String get category;
  @override
  String get uanNumber;
  @override
  String get comments;
  @override
  String get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$PFImplCopyWith<_$PFImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
