// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoldResponse _$GoldResponseFromJson(Map<String, dynamic> json) {
  return _GoldResponse.fromJson(json);
}

/// @nodoc
mixin _$GoldResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Golds> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoldResponseCopyWith<GoldResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldResponseCopyWith<$Res> {
  factory $GoldResponseCopyWith(
          GoldResponse value, $Res Function(GoldResponse) then) =
      _$GoldResponseCopyWithImpl<$Res, GoldResponse>;
  @useResult
  $Res call({bool success, String message, List<Golds> assets});
}

/// @nodoc
class _$GoldResponseCopyWithImpl<$Res, $Val extends GoldResponse>
    implements $GoldResponseCopyWith<$Res> {
  _$GoldResponseCopyWithImpl(this._value, this._then);

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
              as List<Golds>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoldResponseImplCopyWith<$Res>
    implements $GoldResponseCopyWith<$Res> {
  factory _$$GoldResponseImplCopyWith(
          _$GoldResponseImpl value, $Res Function(_$GoldResponseImpl) then) =
      __$$GoldResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<Golds> assets});
}

/// @nodoc
class __$$GoldResponseImplCopyWithImpl<$Res>
    extends _$GoldResponseCopyWithImpl<$Res, _$GoldResponseImpl>
    implements _$$GoldResponseImplCopyWith<$Res> {
  __$$GoldResponseImplCopyWithImpl(
      _$GoldResponseImpl _value, $Res Function(_$GoldResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$GoldResponseImpl(
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
              as List<Golds>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoldResponseImpl with DiagnosticableTreeMixin implements _GoldResponse {
  _$GoldResponseImpl(
      {required this.success,
      required this.message,
      required final List<Golds> assets})
      : _assets = assets;

  factory _$GoldResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoldResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<Golds> _assets;
  @override
  List<Golds> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoldResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoldResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldResponseImpl &&
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
  _$$GoldResponseImplCopyWith<_$GoldResponseImpl> get copyWith =>
      __$$GoldResponseImplCopyWithImpl<_$GoldResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldResponseImplToJson(
      this,
    );
  }
}

abstract class _GoldResponse implements GoldResponse {
  factory _GoldResponse(
      {required final bool success,
      required final String message,
      required final List<Golds> assets}) = _$GoldResponseImpl;

  factory _GoldResponse.fromJson(Map<String, dynamic> json) =
      _$GoldResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Golds> get assets;
  @override
  @JsonKey(ignore: true)
  _$$GoldResponseImplCopyWith<_$GoldResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Golds _$GoldsFromJson(Map<String, dynamic> json) {
  return _Golds.fromJson(json);
}

/// @nodoc
mixin _$Golds {
  String get category => throw _privateConstructorUsedError;
  String get metalType => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get weightInGrams => throw _privateConstructorUsedError;
  String get whereItIsKept =>
      throw _privateConstructorUsedError; // Change type to String
  String get comments => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoldsCopyWith<Golds> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldsCopyWith<$Res> {
  factory $GoldsCopyWith(Golds value, $Res Function(Golds) then) =
      _$GoldsCopyWithImpl<$Res, Golds>;
  @useResult
  $Res call(
      {String category,
      String metalType,
      String type,
      int? weightInGrams,
      String whereItIsKept,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class _$GoldsCopyWithImpl<$Res, $Val extends Golds>
    implements $GoldsCopyWith<$Res> {
  _$GoldsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? metalType = null,
    Object? type = null,
    Object? weightInGrams = freezed,
    Object? whereItIsKept = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      metalType: null == metalType
          ? _value.metalType
          : metalType // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      weightInGrams: freezed == weightInGrams
          ? _value.weightInGrams
          : weightInGrams // ignore: cast_nullable_to_non_nullable
              as int?,
      whereItIsKept: null == whereItIsKept
          ? _value.whereItIsKept
          : whereItIsKept // ignore: cast_nullable_to_non_nullable
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
abstract class _$$GoldsImplCopyWith<$Res> implements $GoldsCopyWith<$Res> {
  factory _$$GoldsImplCopyWith(
          _$GoldsImpl value, $Res Function(_$GoldsImpl) then) =
      __$$GoldsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String metalType,
      String type,
      int? weightInGrams,
      String whereItIsKept,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class __$$GoldsImplCopyWithImpl<$Res>
    extends _$GoldsCopyWithImpl<$Res, _$GoldsImpl>
    implements _$$GoldsImplCopyWith<$Res> {
  __$$GoldsImplCopyWithImpl(
      _$GoldsImpl _value, $Res Function(_$GoldsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? metalType = null,
    Object? type = null,
    Object? weightInGrams = freezed,
    Object? whereItIsKept = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_$GoldsImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      metalType: null == metalType
          ? _value.metalType
          : metalType // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      weightInGrams: freezed == weightInGrams
          ? _value.weightInGrams
          : weightInGrams // ignore: cast_nullable_to_non_nullable
              as int?,
      whereItIsKept: null == whereItIsKept
          ? _value.whereItIsKept
          : whereItIsKept // ignore: cast_nullable_to_non_nullable
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
class _$GoldsImpl with DiagnosticableTreeMixin implements _Golds {
  _$GoldsImpl(
      {required this.category,
      required this.metalType,
      required this.type,
      required this.weightInGrams,
      required this.whereItIsKept,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$GoldsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoldsImplFromJson(json);

  @override
  final String category;
  @override
  final String metalType;
  @override
  final String type;
  @override
  final int? weightInGrams;
  @override
  final String whereItIsKept;
// Change type to String
  @override
  final String comments;
  @override
  final String attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Golds(category: $category, metalType: $metalType, type: $type, weightInGrams: $weightInGrams, whereItIsKept: $whereItIsKept, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Golds'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('metalType', metalType))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('weightInGrams', weightInGrams))
      ..add(DiagnosticsProperty('whereItIsKept', whereItIsKept))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldsImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.metalType, metalType) ||
                other.metalType == metalType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.weightInGrams, weightInGrams) ||
                other.weightInGrams == weightInGrams) &&
            (identical(other.whereItIsKept, whereItIsKept) ||
                other.whereItIsKept == whereItIsKept) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, metalType, type,
      weightInGrams, whereItIsKept, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoldsImplCopyWith<_$GoldsImpl> get copyWith =>
      __$$GoldsImplCopyWithImpl<_$GoldsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldsImplToJson(
      this,
    );
  }
}

abstract class _Golds implements Golds {
  factory _Golds(
      {required final String category,
      required final String metalType,
      required final String type,
      required final int? weightInGrams,
      required final String whereItIsKept,
      required final String comments,
      required final String attachment,
      required final int assetId}) = _$GoldsImpl;

  factory _Golds.fromJson(Map<String, dynamic> json) = _$GoldsImpl.fromJson;

  @override
  String get category;
  @override
  String get metalType;
  @override
  String get type;
  @override
  int? get weightInGrams;
  @override
  String get whereItIsKept;
  @override // Change type to String
  String get comments;
  @override
  String get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$GoldsImplCopyWith<_$GoldsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
