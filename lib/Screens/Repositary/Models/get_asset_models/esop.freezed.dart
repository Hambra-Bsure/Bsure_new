// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'esop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EsopResponse _$EsopResponseFromJson(Map<String, dynamic> json) {
  return _EsopResponse.fromJson(json);
}

/// @nodoc
mixin _$EsopResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Esop> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EsopResponseCopyWith<EsopResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsopResponseCopyWith<$Res> {
  factory $EsopResponseCopyWith(
          EsopResponse value, $Res Function(EsopResponse) then) =
      _$EsopResponseCopyWithImpl<$Res, EsopResponse>;
  @useResult
  $Res call({bool success, String message, List<Esop> assets});
}

/// @nodoc
class _$EsopResponseCopyWithImpl<$Res, $Val extends EsopResponse>
    implements $EsopResponseCopyWith<$Res> {
  _$EsopResponseCopyWithImpl(this._value, this._then);

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
              as List<Esop>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EsopResponseImplCopyWith<$Res>
    implements $EsopResponseCopyWith<$Res> {
  factory _$$EsopResponseImplCopyWith(
          _$EsopResponseImpl value, $Res Function(_$EsopResponseImpl) then) =
      __$$EsopResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<Esop> assets});
}

/// @nodoc
class __$$EsopResponseImplCopyWithImpl<$Res>
    extends _$EsopResponseCopyWithImpl<$Res, _$EsopResponseImpl>
    implements _$$EsopResponseImplCopyWith<$Res> {
  __$$EsopResponseImplCopyWithImpl(
      _$EsopResponseImpl _value, $Res Function(_$EsopResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$EsopResponseImpl(
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
              as List<Esop>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EsopResponseImpl with DiagnosticableTreeMixin implements _EsopResponse {
  _$EsopResponseImpl(
      {required this.success,
      required this.message,
      required final List<Esop> assets})
      : _assets = assets;

  factory _$EsopResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EsopResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<Esop> _assets;
  @override
  List<Esop> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EsopResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EsopResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsopResponseImpl &&
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
  _$$EsopResponseImplCopyWith<_$EsopResponseImpl> get copyWith =>
      __$$EsopResponseImplCopyWithImpl<_$EsopResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EsopResponseImplToJson(
      this,
    );
  }
}

abstract class _EsopResponse implements EsopResponse {
  factory _EsopResponse(
      {required final bool success,
      required final String message,
      required final List<Esop> assets}) = _$EsopResponseImpl;

  factory _EsopResponse.fromJson(Map<String, dynamic> json) =
      _$EsopResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Esop> get assets;
  @override
  @JsonKey(ignore: true)
  _$$EsopResponseImplCopyWith<_$EsopResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Esop _$EsopFromJson(Map<String, dynamic> json) {
  return _Esop.fromJson(json);
}

/// @nodoc
mixin _$Esop {
  String get category => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  int get numberOfStocks =>
      throw _privateConstructorUsedError; // Change type to int
  int? get optionPrice => throw _privateConstructorUsedError;
  String? get expiryDate => throw _privateConstructorUsedError;
  int? get totalSharesAvailableForIssue =>
      throw _privateConstructorUsedError; // Change type to int
  int? get issuePricePerShare => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EsopCopyWith<Esop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EsopCopyWith<$Res> {
  factory $EsopCopyWith(Esop value, $Res Function(Esop) then) =
      _$EsopCopyWithImpl<$Res, Esop>;
  @useResult
  $Res call(
      {String category,
      String companyName,
      int numberOfStocks,
      int? optionPrice,
      String? expiryDate,
      int? totalSharesAvailableForIssue,
      int? issuePricePerShare,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$EsopCopyWithImpl<$Res, $Val extends Esop>
    implements $EsopCopyWith<$Res> {
  _$EsopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? companyName = null,
    Object? numberOfStocks = null,
    Object? optionPrice = freezed,
    Object? expiryDate = freezed,
    Object? totalSharesAvailableForIssue = freezed,
    Object? issuePricePerShare = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfStocks: null == numberOfStocks
          ? _value.numberOfStocks
          : numberOfStocks // ignore: cast_nullable_to_non_nullable
              as int,
      optionPrice: freezed == optionPrice
          ? _value.optionPrice
          : optionPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSharesAvailableForIssue: freezed == totalSharesAvailableForIssue
          ? _value.totalSharesAvailableForIssue
          : totalSharesAvailableForIssue // ignore: cast_nullable_to_non_nullable
              as int?,
      issuePricePerShare: freezed == issuePricePerShare
          ? _value.issuePricePerShare
          : issuePricePerShare // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$EsopImplCopyWith<$Res> implements $EsopCopyWith<$Res> {
  factory _$$EsopImplCopyWith(
          _$EsopImpl value, $Res Function(_$EsopImpl) then) =
      __$$EsopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String companyName,
      int numberOfStocks,
      int? optionPrice,
      String? expiryDate,
      int? totalSharesAvailableForIssue,
      int? issuePricePerShare,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$EsopImplCopyWithImpl<$Res>
    extends _$EsopCopyWithImpl<$Res, _$EsopImpl>
    implements _$$EsopImplCopyWith<$Res> {
  __$$EsopImplCopyWithImpl(_$EsopImpl _value, $Res Function(_$EsopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? companyName = null,
    Object? numberOfStocks = null,
    Object? optionPrice = freezed,
    Object? expiryDate = freezed,
    Object? totalSharesAvailableForIssue = freezed,
    Object? issuePricePerShare = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$EsopImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfStocks: null == numberOfStocks
          ? _value.numberOfStocks
          : numberOfStocks // ignore: cast_nullable_to_non_nullable
              as int,
      optionPrice: freezed == optionPrice
          ? _value.optionPrice
          : optionPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      totalSharesAvailableForIssue: freezed == totalSharesAvailableForIssue
          ? _value.totalSharesAvailableForIssue
          : totalSharesAvailableForIssue // ignore: cast_nullable_to_non_nullable
              as int?,
      issuePricePerShare: freezed == issuePricePerShare
          ? _value.issuePricePerShare
          : issuePricePerShare // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$EsopImpl with DiagnosticableTreeMixin implements _Esop {
  _$EsopImpl(
      {required this.category,
      required this.companyName,
      required this.numberOfStocks,
      required this.optionPrice,
      required this.expiryDate,
      required this.totalSharesAvailableForIssue,
      required this.issuePricePerShare,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$EsopImpl.fromJson(Map<String, dynamic> json) =>
      _$$EsopImplFromJson(json);

  @override
  final String category;
  @override
  final String companyName;
  @override
  final int numberOfStocks;
// Change type to int
  @override
  final int? optionPrice;
  @override
  final String? expiryDate;
  @override
  final int? totalSharesAvailableForIssue;
// Change type to int
  @override
  final int? issuePricePerShare;
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Esop(category: $category, companyName: $companyName, numberOfStocks: $numberOfStocks, optionPrice: $optionPrice, expiryDate: $expiryDate, totalSharesAvailableForIssue: $totalSharesAvailableForIssue, issuePricePerShare: $issuePricePerShare, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Esop'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('numberOfStocks', numberOfStocks))
      ..add(DiagnosticsProperty('optionPrice', optionPrice))
      ..add(DiagnosticsProperty('expiryDate', expiryDate))
      ..add(DiagnosticsProperty(
          'totalSharesAvailableForIssue', totalSharesAvailableForIssue))
      ..add(DiagnosticsProperty('issuePricePerShare', issuePricePerShare))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsopImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.numberOfStocks, numberOfStocks) ||
                other.numberOfStocks == numberOfStocks) &&
            (identical(other.optionPrice, optionPrice) ||
                other.optionPrice == optionPrice) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.totalSharesAvailableForIssue,
                    totalSharesAvailableForIssue) ||
                other.totalSharesAvailableForIssue ==
                    totalSharesAvailableForIssue) &&
            (identical(other.issuePricePerShare, issuePricePerShare) ||
                other.issuePricePerShare == issuePricePerShare) &&
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
      companyName,
      numberOfStocks,
      optionPrice,
      expiryDate,
      totalSharesAvailableForIssue,
      issuePricePerShare,
      comments,
      attachment,
      assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EsopImplCopyWith<_$EsopImpl> get copyWith =>
      __$$EsopImplCopyWithImpl<_$EsopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EsopImplToJson(
      this,
    );
  }
}

abstract class _Esop implements Esop {
  factory _Esop(
      {required final String category,
      required final String companyName,
      required final int numberOfStocks,
      required final int? optionPrice,
      required final String? expiryDate,
      required final int? totalSharesAvailableForIssue,
      required final int? issuePricePerShare,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$EsopImpl;

  factory _Esop.fromJson(Map<String, dynamic> json) = _$EsopImpl.fromJson;

  @override
  String get category;
  @override
  String get companyName;
  @override
  int get numberOfStocks;
  @override // Change type to int
  int? get optionPrice;
  @override
  String? get expiryDate;
  @override
  int? get totalSharesAvailableForIssue;
  @override // Change type to int
  int? get issuePricePerShare;
  @override
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$EsopImplCopyWith<_$EsopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
