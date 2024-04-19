// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bond.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BondResponse _$BondResponseFromJson(Map<String, dynamic> json) {
  return _BondResponse.fromJson(json);
}

/// @nodoc
mixin _$BondResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Bond> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BondResponseCopyWith<BondResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondResponseCopyWith<$Res> {
  factory $BondResponseCopyWith(
          BondResponse value, $Res Function(BondResponse) then) =
      _$BondResponseCopyWithImpl<$Res, BondResponse>;
  @useResult
  $Res call({bool success, String message, List<Bond> assets});
}

/// @nodoc
class _$BondResponseCopyWithImpl<$Res, $Val extends BondResponse>
    implements $BondResponseCopyWith<$Res> {
  _$BondResponseCopyWithImpl(this._value, this._then);

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
              as List<Bond>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BondResponseImplCopyWith<$Res>
    implements $BondResponseCopyWith<$Res> {
  factory _$$BondResponseImplCopyWith(
          _$BondResponseImpl value, $Res Function(_$BondResponseImpl) then) =
      __$$BondResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<Bond> assets});
}

/// @nodoc
class __$$BondResponseImplCopyWithImpl<$Res>
    extends _$BondResponseCopyWithImpl<$Res, _$BondResponseImpl>
    implements _$$BondResponseImplCopyWith<$Res> {
  __$$BondResponseImplCopyWithImpl(
      _$BondResponseImpl _value, $Res Function(_$BondResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$BondResponseImpl(
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
              as List<Bond>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BondResponseImpl with DiagnosticableTreeMixin implements _BondResponse {
  _$BondResponseImpl(
      {required this.success,
      required this.message,
      required final List<Bond> assets})
      : _assets = assets;

  factory _$BondResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BondResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<Bond> _assets;
  @override
  List<Bond> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BondResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BondResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondResponseImpl &&
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
  _$$BondResponseImplCopyWith<_$BondResponseImpl> get copyWith =>
      __$$BondResponseImplCopyWithImpl<_$BondResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BondResponseImplToJson(
      this,
    );
  }
}

abstract class _BondResponse implements BondResponse {
  factory _BondResponse(
      {required final bool success,
      required final String message,
      required final List<Bond> assets}) = _$BondResponseImpl;

  factory _BondResponse.fromJson(Map<String, dynamic> json) =
      _$BondResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Bond> get assets;
  @override
  @JsonKey(ignore: true)
  _$$BondResponseImplCopyWith<_$BondResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Bond _$BondFromJson(Map<String, dynamic> json) {
  return _Bond.fromJson(json);
}

/// @nodoc
mixin _$Bond {
  String? get category => throw _privateConstructorUsedError;
  String? get bondName => throw _privateConstructorUsedError;
  String? get bondNumber => throw _privateConstructorUsedError;
  String? get maturityDate => throw _privateConstructorUsedError;
  String? get authorityWhoIssuedTheBond => throw _privateConstructorUsedError;
  String? get typeOfBond => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BondCopyWith<Bond> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BondCopyWith<$Res> {
  factory $BondCopyWith(Bond value, $Res Function(Bond) then) =
      _$BondCopyWithImpl<$Res, Bond>;
  @useResult
  $Res call(
      {String? category,
      String? bondName,
      String? bondNumber,
      String? maturityDate,
      String? authorityWhoIssuedTheBond,
      String? typeOfBond,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$BondCopyWithImpl<$Res, $Val extends Bond>
    implements $BondCopyWith<$Res> {
  _$BondCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? bondName = freezed,
    Object? bondNumber = freezed,
    Object? maturityDate = freezed,
    Object? authorityWhoIssuedTheBond = freezed,
    Object? typeOfBond = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      bondName: freezed == bondName
          ? _value.bondName
          : bondName // ignore: cast_nullable_to_non_nullable
              as String?,
      bondNumber: freezed == bondNumber
          ? _value.bondNumber
          : bondNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      maturityDate: freezed == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      authorityWhoIssuedTheBond: freezed == authorityWhoIssuedTheBond
          ? _value.authorityWhoIssuedTheBond
          : authorityWhoIssuedTheBond // ignore: cast_nullable_to_non_nullable
              as String?,
      typeOfBond: freezed == typeOfBond
          ? _value.typeOfBond
          : typeOfBond // ignore: cast_nullable_to_non_nullable
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
abstract class _$$BondImplCopyWith<$Res> implements $BondCopyWith<$Res> {
  factory _$$BondImplCopyWith(
          _$BondImpl value, $Res Function(_$BondImpl) then) =
      __$$BondImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? category,
      String? bondName,
      String? bondNumber,
      String? maturityDate,
      String? authorityWhoIssuedTheBond,
      String? typeOfBond,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$BondImplCopyWithImpl<$Res>
    extends _$BondCopyWithImpl<$Res, _$BondImpl>
    implements _$$BondImplCopyWith<$Res> {
  __$$BondImplCopyWithImpl(_$BondImpl _value, $Res Function(_$BondImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? bondName = freezed,
    Object? bondNumber = freezed,
    Object? maturityDate = freezed,
    Object? authorityWhoIssuedTheBond = freezed,
    Object? typeOfBond = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$BondImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      bondName: freezed == bondName
          ? _value.bondName
          : bondName // ignore: cast_nullable_to_non_nullable
              as String?,
      bondNumber: freezed == bondNumber
          ? _value.bondNumber
          : bondNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      maturityDate: freezed == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
              as String?,
      authorityWhoIssuedTheBond: freezed == authorityWhoIssuedTheBond
          ? _value.authorityWhoIssuedTheBond
          : authorityWhoIssuedTheBond // ignore: cast_nullable_to_non_nullable
              as String?,
      typeOfBond: freezed == typeOfBond
          ? _value.typeOfBond
          : typeOfBond // ignore: cast_nullable_to_non_nullable
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
class _$BondImpl with DiagnosticableTreeMixin implements _Bond {
  _$BondImpl(
      {required this.category,
      required this.bondName,
      required this.bondNumber,
      required this.maturityDate,
      required this.authorityWhoIssuedTheBond,
      required this.typeOfBond,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$BondImpl.fromJson(Map<String, dynamic> json) =>
      _$$BondImplFromJson(json);

  @override
  final String? category;
  @override
  final String? bondName;
  @override
  final String? bondNumber;
  @override
  final String? maturityDate;
  @override
  final String? authorityWhoIssuedTheBond;
  @override
  final String? typeOfBond;
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Bond(category: $category, bondName: $bondName, bondNumber: $bondNumber, maturityDate: $maturityDate, authorityWhoIssuedTheBond: $authorityWhoIssuedTheBond, typeOfBond: $typeOfBond, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Bond'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('bondName', bondName))
      ..add(DiagnosticsProperty('bondNumber', bondNumber))
      ..add(DiagnosticsProperty('maturityDate', maturityDate))
      ..add(DiagnosticsProperty(
          'authorityWhoIssuedTheBond', authorityWhoIssuedTheBond))
      ..add(DiagnosticsProperty('typeOfBond', typeOfBond))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BondImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.bondName, bondName) ||
                other.bondName == bondName) &&
            (identical(other.bondNumber, bondNumber) ||
                other.bondNumber == bondNumber) &&
            (identical(other.maturityDate, maturityDate) ||
                other.maturityDate == maturityDate) &&
            (identical(other.authorityWhoIssuedTheBond,
                    authorityWhoIssuedTheBond) ||
                other.authorityWhoIssuedTheBond == authorityWhoIssuedTheBond) &&
            (identical(other.typeOfBond, typeOfBond) ||
                other.typeOfBond == typeOfBond) &&
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
      bondName,
      bondNumber,
      maturityDate,
      authorityWhoIssuedTheBond,
      typeOfBond,
      comments,
      attachment,
      assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BondImplCopyWith<_$BondImpl> get copyWith =>
      __$$BondImplCopyWithImpl<_$BondImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BondImplToJson(
      this,
    );
  }
}

abstract class _Bond implements Bond {
  factory _Bond(
      {required final String? category,
      required final String? bondName,
      required final String? bondNumber,
      required final String? maturityDate,
      required final String? authorityWhoIssuedTheBond,
      required final String? typeOfBond,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$BondImpl;

  factory _Bond.fromJson(Map<String, dynamic> json) = _$BondImpl.fromJson;

  @override
  String? get category;
  @override
  String? get bondName;
  @override
  String? get bondNumber;
  @override
  String? get maturityDate;
  @override
  String? get authorityWhoIssuedTheBond;
  @override
  String? get typeOfBond;
  @override
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$BondImplCopyWith<_$BondImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
