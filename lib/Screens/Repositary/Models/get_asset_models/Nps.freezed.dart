// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Nps.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NPSResponse _$NPSResponseFromJson(Map<String, dynamic> json) {
  return _NPSResponse.fromJson(json);
}

/// @nodoc
mixin _$NPSResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<NPS> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NPSResponseCopyWith<NPSResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NPSResponseCopyWith<$Res> {
  factory $NPSResponseCopyWith(
          NPSResponse value, $Res Function(NPSResponse) then) =
      _$NPSResponseCopyWithImpl<$Res, NPSResponse>;
  @useResult
  $Res call({bool success, String message, List<NPS> assets});
}

/// @nodoc
class _$NPSResponseCopyWithImpl<$Res, $Val extends NPSResponse>
    implements $NPSResponseCopyWith<$Res> {
  _$NPSResponseCopyWithImpl(this._value, this._then);

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
              as List<NPS>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NPSResponseImplCopyWith<$Res>
    implements $NPSResponseCopyWith<$Res> {
  factory _$$NPSResponseImplCopyWith(
          _$NPSResponseImpl value, $Res Function(_$NPSResponseImpl) then) =
      __$$NPSResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<NPS> assets});
}

/// @nodoc
class __$$NPSResponseImplCopyWithImpl<$Res>
    extends _$NPSResponseCopyWithImpl<$Res, _$NPSResponseImpl>
    implements _$$NPSResponseImplCopyWith<$Res> {
  __$$NPSResponseImplCopyWithImpl(
      _$NPSResponseImpl _value, $Res Function(_$NPSResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$NPSResponseImpl(
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
              as List<NPS>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NPSResponseImpl with DiagnosticableTreeMixin implements _NPSResponse {
  _$NPSResponseImpl(
      {required this.success,
      required this.message,
      required final List<NPS> assets})
      : _assets = assets;

  factory _$NPSResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NPSResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<NPS> _assets;
  @override
  List<NPS> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NPSResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NPSResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NPSResponseImpl &&
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
  _$$NPSResponseImplCopyWith<_$NPSResponseImpl> get copyWith =>
      __$$NPSResponseImplCopyWithImpl<_$NPSResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NPSResponseImplToJson(
      this,
    );
  }
}

abstract class _NPSResponse implements NPSResponse {
  factory _NPSResponse(
      {required final bool success,
      required final String message,
      required final List<NPS> assets}) = _$NPSResponseImpl;

  factory _NPSResponse.fromJson(Map<String, dynamic> json) =
      _$NPSResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<NPS> get assets;
  @override
  @JsonKey(ignore: true)
  _$$NPSResponseImplCopyWith<_$NPSResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NPS _$NPSFromJson(Map<String, dynamic> json) {
  return _NPS.fromJson(json);
}

/// @nodoc
mixin _$NPS {
  String get category => throw _privateConstructorUsedError;
  String get pranNumber => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NPSCopyWith<NPS> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NPSCopyWith<$Res> {
  factory $NPSCopyWith(NPS value, $Res Function(NPS) then) =
      _$NPSCopyWithImpl<$Res, NPS>;
  @useResult
  $Res call(
      {String category,
      String pranNumber,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class _$NPSCopyWithImpl<$Res, $Val extends NPS> implements $NPSCopyWith<$Res> {
  _$NPSCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? pranNumber = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      pranNumber: null == pranNumber
          ? _value.pranNumber
          : pranNumber // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NPSImplCopyWith<$Res> implements $NPSCopyWith<$Res> {
  factory _$$NPSImplCopyWith(_$NPSImpl value, $Res Function(_$NPSImpl) then) =
      __$$NPSImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String pranNumber,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class __$$NPSImplCopyWithImpl<$Res> extends _$NPSCopyWithImpl<$Res, _$NPSImpl>
    implements _$$NPSImplCopyWith<$Res> {
  __$$NPSImplCopyWithImpl(_$NPSImpl _value, $Res Function(_$NPSImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? pranNumber = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_$NPSImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      pranNumber: null == pranNumber
          ? _value.pranNumber
          : pranNumber // ignore: cast_nullable_to_non_nullable
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
class _$NPSImpl with DiagnosticableTreeMixin implements _NPS {
  _$NPSImpl(
      {required this.category,
      required this.pranNumber,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$NPSImpl.fromJson(Map<String, dynamic> json) =>
      _$$NPSImplFromJson(json);

  @override
  final String category;
  @override
  final String pranNumber;
  @override
  final String comments;
  @override
  final String attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NPS(category: $category, pranNumber: $pranNumber, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NPS'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('pranNumber', pranNumber))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NPSImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.pranNumber, pranNumber) ||
                other.pranNumber == pranNumber) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, category, pranNumber, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NPSImplCopyWith<_$NPSImpl> get copyWith =>
      __$$NPSImplCopyWithImpl<_$NPSImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NPSImplToJson(
      this,
    );
  }
}

abstract class _NPS implements NPS {
  factory _NPS(
      {required final String category,
      required final String pranNumber,
      required final String comments,
      required final String attachment,
      required final int assetId}) = _$NPSImpl;

  factory _NPS.fromJson(Map<String, dynamic> json) = _$NPSImpl.fromJson;

  @override
  String get category;
  @override
  String get pranNumber;
  @override
  String get comments;
  @override
  String get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$NPSImplCopyWith<_$NPSImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
