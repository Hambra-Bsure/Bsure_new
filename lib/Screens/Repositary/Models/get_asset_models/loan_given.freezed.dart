// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loan_given.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoanGivenResponse _$LoanGivenResponseFromJson(Map<String, dynamic> json) {
  return _LoanGivenResponse.fromJson(json);
}

/// @nodoc
mixin _$LoanGivenResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<LoanGiven> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoanGivenResponseCopyWith<LoanGivenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanGivenResponseCopyWith<$Res> {
  factory $LoanGivenResponseCopyWith(
          LoanGivenResponse value, $Res Function(LoanGivenResponse) then) =
      _$LoanGivenResponseCopyWithImpl<$Res, LoanGivenResponse>;
  @useResult
  $Res call({bool success, String message, List<LoanGiven> assets});
}

/// @nodoc
class _$LoanGivenResponseCopyWithImpl<$Res, $Val extends LoanGivenResponse>
    implements $LoanGivenResponseCopyWith<$Res> {
  _$LoanGivenResponseCopyWithImpl(this._value, this._then);

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
              as List<LoanGiven>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoanGivenResponseImplCopyWith<$Res>
    implements $LoanGivenResponseCopyWith<$Res> {
  factory _$$LoanGivenResponseImplCopyWith(_$LoanGivenResponseImpl value,
          $Res Function(_$LoanGivenResponseImpl) then) =
      __$$LoanGivenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<LoanGiven> assets});
}

/// @nodoc
class __$$LoanGivenResponseImplCopyWithImpl<$Res>
    extends _$LoanGivenResponseCopyWithImpl<$Res, _$LoanGivenResponseImpl>
    implements _$$LoanGivenResponseImplCopyWith<$Res> {
  __$$LoanGivenResponseImplCopyWithImpl(_$LoanGivenResponseImpl _value,
      $Res Function(_$LoanGivenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$LoanGivenResponseImpl(
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
              as List<LoanGiven>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoanGivenResponseImpl
    with DiagnosticableTreeMixin
    implements _LoanGivenResponse {
  _$LoanGivenResponseImpl(
      {required this.success,
      required this.message,
      required final List<LoanGiven> assets})
      : _assets = assets;

  factory _$LoanGivenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanGivenResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<LoanGiven> _assets;
  @override
  List<LoanGiven> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoanGivenResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoanGivenResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanGivenResponseImpl &&
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
  _$$LoanGivenResponseImplCopyWith<_$LoanGivenResponseImpl> get copyWith =>
      __$$LoanGivenResponseImplCopyWithImpl<_$LoanGivenResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanGivenResponseImplToJson(
      this,
    );
  }
}

abstract class _LoanGivenResponse implements LoanGivenResponse {
  factory _LoanGivenResponse(
      {required final bool success,
      required final String message,
      required final List<LoanGiven> assets}) = _$LoanGivenResponseImpl;

  factory _LoanGivenResponse.fromJson(Map<String, dynamic> json) =
      _$LoanGivenResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<LoanGiven> get assets;
  @override
  @JsonKey(ignore: true)
  _$$LoanGivenResponseImplCopyWith<_$LoanGivenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoanGiven _$LoanGivenFromJson(Map<String, dynamic> json) {
  return _LoanGiven.fromJson(json);
}

/// @nodoc
mixin _$LoanGiven {
  String get category => throw _privateConstructorUsedError;
  String get borrowerName => throw _privateConstructorUsedError;
  int get loanAmount => throw _privateConstructorUsedError;
  String? get loanGivenDate => throw _privateConstructorUsedError;
  int? get interestRate =>
      throw _privateConstructorUsedError; // Updated to be nullable
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoanGivenCopyWith<LoanGiven> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoanGivenCopyWith<$Res> {
  factory $LoanGivenCopyWith(LoanGiven value, $Res Function(LoanGiven) then) =
      _$LoanGivenCopyWithImpl<$Res, LoanGiven>;
  @useResult
  $Res call(
      {String category,
      String borrowerName,
      int loanAmount,
      String? loanGivenDate,
      int? interestRate,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$LoanGivenCopyWithImpl<$Res, $Val extends LoanGiven>
    implements $LoanGivenCopyWith<$Res> {
  _$LoanGivenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? borrowerName = null,
    Object? loanAmount = null,
    Object? loanGivenDate = freezed,
    Object? interestRate = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      borrowerName: null == borrowerName
          ? _value.borrowerName
          : borrowerName // ignore: cast_nullable_to_non_nullable
              as String,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as int,
      loanGivenDate: freezed == loanGivenDate
          ? _value.loanGivenDate
          : loanGivenDate // ignore: cast_nullable_to_non_nullable
              as String?,
      interestRate: freezed == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LoanGivenImplCopyWith<$Res>
    implements $LoanGivenCopyWith<$Res> {
  factory _$$LoanGivenImplCopyWith(
          _$LoanGivenImpl value, $Res Function(_$LoanGivenImpl) then) =
      __$$LoanGivenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String borrowerName,
      int loanAmount,
      String? loanGivenDate,
      int? interestRate,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$LoanGivenImplCopyWithImpl<$Res>
    extends _$LoanGivenCopyWithImpl<$Res, _$LoanGivenImpl>
    implements _$$LoanGivenImplCopyWith<$Res> {
  __$$LoanGivenImplCopyWithImpl(
      _$LoanGivenImpl _value, $Res Function(_$LoanGivenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? borrowerName = null,
    Object? loanAmount = null,
    Object? loanGivenDate = freezed,
    Object? interestRate = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$LoanGivenImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      borrowerName: null == borrowerName
          ? _value.borrowerName
          : borrowerName // ignore: cast_nullable_to_non_nullable
              as String,
      loanAmount: null == loanAmount
          ? _value.loanAmount
          : loanAmount // ignore: cast_nullable_to_non_nullable
              as int,
      loanGivenDate: freezed == loanGivenDate
          ? _value.loanGivenDate
          : loanGivenDate // ignore: cast_nullable_to_non_nullable
              as String?,
      interestRate: freezed == interestRate
          ? _value.interestRate
          : interestRate // ignore: cast_nullable_to_non_nullable
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
class _$LoanGivenImpl with DiagnosticableTreeMixin implements _LoanGiven {
  _$LoanGivenImpl(
      {required this.category,
      required this.borrowerName,
      required this.loanAmount,
      required this.loanGivenDate,
      required this.interestRate,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$LoanGivenImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoanGivenImplFromJson(json);

  @override
  final String category;
  @override
  final String borrowerName;
  @override
  final int loanAmount;
  @override
  final String? loanGivenDate;
  @override
  final int? interestRate;
// Updated to be nullable
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoanGiven(category: $category, borrowerName: $borrowerName, loanAmount: $loanAmount, loanGivenDate: $loanGivenDate, interestRate: $interestRate, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoanGiven'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('borrowerName', borrowerName))
      ..add(DiagnosticsProperty('loanAmount', loanAmount))
      ..add(DiagnosticsProperty('loanGivenDate', loanGivenDate))
      ..add(DiagnosticsProperty('interestRate', interestRate))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoanGivenImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.borrowerName, borrowerName) ||
                other.borrowerName == borrowerName) &&
            (identical(other.loanAmount, loanAmount) ||
                other.loanAmount == loanAmount) &&
            (identical(other.loanGivenDate, loanGivenDate) ||
                other.loanGivenDate == loanGivenDate) &&
            (identical(other.interestRate, interestRate) ||
                other.interestRate == interestRate) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, borrowerName,
      loanAmount, loanGivenDate, interestRate, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoanGivenImplCopyWith<_$LoanGivenImpl> get copyWith =>
      __$$LoanGivenImplCopyWithImpl<_$LoanGivenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoanGivenImplToJson(
      this,
    );
  }
}

abstract class _LoanGiven implements LoanGiven {
  factory _LoanGiven(
      {required final String category,
      required final String borrowerName,
      required final int loanAmount,
      required final String? loanGivenDate,
      required final int? interestRate,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$LoanGivenImpl;

  factory _LoanGiven.fromJson(Map<String, dynamic> json) =
      _$LoanGivenImpl.fromJson;

  @override
  String get category;
  @override
  String get borrowerName;
  @override
  int get loanAmount;
  @override
  String? get loanGivenDate;
  @override
  int? get interestRate;
  @override // Updated to be nullable
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$LoanGivenImplCopyWith<_$LoanGivenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
