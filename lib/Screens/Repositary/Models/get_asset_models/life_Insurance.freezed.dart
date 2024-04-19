// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'life_Insurance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LifeInsuranceResponse _$LifeInsuranceResponseFromJson(
    Map<String, dynamic> json) {
  return _LifeInsuranceResponse.fromJson(json);
}

/// @nodoc
mixin _$LifeInsuranceResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<LifeInsurance> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LifeInsuranceResponseCopyWith<LifeInsuranceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifeInsuranceResponseCopyWith<$Res> {
  factory $LifeInsuranceResponseCopyWith(LifeInsuranceResponse value,
          $Res Function(LifeInsuranceResponse) then) =
      _$LifeInsuranceResponseCopyWithImpl<$Res, LifeInsuranceResponse>;
  @useResult
  $Res call({bool success, String message, List<LifeInsurance> assets});
}

/// @nodoc
class _$LifeInsuranceResponseCopyWithImpl<$Res,
        $Val extends LifeInsuranceResponse>
    implements $LifeInsuranceResponseCopyWith<$Res> {
  _$LifeInsuranceResponseCopyWithImpl(this._value, this._then);

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
              as List<LifeInsurance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LifeInsuranceResponseImplCopyWith<$Res>
    implements $LifeInsuranceResponseCopyWith<$Res> {
  factory _$$LifeInsuranceResponseImplCopyWith(
          _$LifeInsuranceResponseImpl value,
          $Res Function(_$LifeInsuranceResponseImpl) then) =
      __$$LifeInsuranceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<LifeInsurance> assets});
}

/// @nodoc
class __$$LifeInsuranceResponseImplCopyWithImpl<$Res>
    extends _$LifeInsuranceResponseCopyWithImpl<$Res,
        _$LifeInsuranceResponseImpl>
    implements _$$LifeInsuranceResponseImplCopyWith<$Res> {
  __$$LifeInsuranceResponseImplCopyWithImpl(_$LifeInsuranceResponseImpl _value,
      $Res Function(_$LifeInsuranceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$LifeInsuranceResponseImpl(
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
              as List<LifeInsurance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LifeInsuranceResponseImpl
    with DiagnosticableTreeMixin
    implements _LifeInsuranceResponse {
  _$LifeInsuranceResponseImpl(
      {required this.success,
      required this.message,
      required final List<LifeInsurance> assets})
      : _assets = assets;

  factory _$LifeInsuranceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LifeInsuranceResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<LifeInsurance> _assets;
  @override
  List<LifeInsurance> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifeInsuranceResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LifeInsuranceResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifeInsuranceResponseImpl &&
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
  _$$LifeInsuranceResponseImplCopyWith<_$LifeInsuranceResponseImpl>
      get copyWith => __$$LifeInsuranceResponseImplCopyWithImpl<
          _$LifeInsuranceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LifeInsuranceResponseImplToJson(
      this,
    );
  }
}

abstract class _LifeInsuranceResponse implements LifeInsuranceResponse {
  factory _LifeInsuranceResponse(
      {required final bool success,
      required final String message,
      required final List<LifeInsurance> assets}) = _$LifeInsuranceResponseImpl;

  factory _LifeInsuranceResponse.fromJson(Map<String, dynamic> json) =
      _$LifeInsuranceResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<LifeInsurance> get assets;
  @override
  @JsonKey(ignore: true)
  _$$LifeInsuranceResponseImplCopyWith<_$LifeInsuranceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LifeInsurance _$LifeInsuranceFromJson(Map<String, dynamic> json) {
  return _LifeInsurance.fromJson(json);
}

/// @nodoc
mixin _$LifeInsurance {
  String get category => throw _privateConstructorUsedError;
  String get insuranceCompanyName => throw _privateConstructorUsedError;
  String get policyName => throw _privateConstructorUsedError;
  String get policyNumber => throw _privateConstructorUsedError;
  int get coverageAmount =>
      throw _privateConstructorUsedError; // Assuming coverageAmount is an integer
  String get maturityDate => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LifeInsuranceCopyWith<LifeInsurance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifeInsuranceCopyWith<$Res> {
  factory $LifeInsuranceCopyWith(
          LifeInsurance value, $Res Function(LifeInsurance) then) =
      _$LifeInsuranceCopyWithImpl<$Res, LifeInsurance>;
  @useResult
  $Res call(
      {String category,
      String insuranceCompanyName,
      String policyName,
      String policyNumber,
      int coverageAmount,
      String maturityDate,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class _$LifeInsuranceCopyWithImpl<$Res, $Val extends LifeInsurance>
    implements $LifeInsuranceCopyWith<$Res> {
  _$LifeInsuranceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? insuranceCompanyName = null,
    Object? policyName = null,
    Object? policyNumber = null,
    Object? coverageAmount = null,
    Object? maturityDate = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      insuranceCompanyName: null == insuranceCompanyName
          ? _value.insuranceCompanyName
          : insuranceCompanyName // ignore: cast_nullable_to_non_nullable
              as String,
      policyName: null == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String,
      policyNumber: null == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String,
      coverageAmount: null == coverageAmount
          ? _value.coverageAmount
          : coverageAmount // ignore: cast_nullable_to_non_nullable
              as int,
      maturityDate: null == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LifeInsuranceImplCopyWith<$Res>
    implements $LifeInsuranceCopyWith<$Res> {
  factory _$$LifeInsuranceImplCopyWith(
          _$LifeInsuranceImpl value, $Res Function(_$LifeInsuranceImpl) then) =
      __$$LifeInsuranceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String insuranceCompanyName,
      String policyName,
      String policyNumber,
      int coverageAmount,
      String maturityDate,
      String comments,
      String attachment,
      int assetId});
}

/// @nodoc
class __$$LifeInsuranceImplCopyWithImpl<$Res>
    extends _$LifeInsuranceCopyWithImpl<$Res, _$LifeInsuranceImpl>
    implements _$$LifeInsuranceImplCopyWith<$Res> {
  __$$LifeInsuranceImplCopyWithImpl(
      _$LifeInsuranceImpl _value, $Res Function(_$LifeInsuranceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? insuranceCompanyName = null,
    Object? policyName = null,
    Object? policyNumber = null,
    Object? coverageAmount = null,
    Object? maturityDate = null,
    Object? comments = null,
    Object? attachment = null,
    Object? assetId = null,
  }) {
    return _then(_$LifeInsuranceImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      insuranceCompanyName: null == insuranceCompanyName
          ? _value.insuranceCompanyName
          : insuranceCompanyName // ignore: cast_nullable_to_non_nullable
              as String,
      policyName: null == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String,
      policyNumber: null == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
              as String,
      coverageAmount: null == coverageAmount
          ? _value.coverageAmount
          : coverageAmount // ignore: cast_nullable_to_non_nullable
              as int,
      maturityDate: null == maturityDate
          ? _value.maturityDate
          : maturityDate // ignore: cast_nullable_to_non_nullable
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
class _$LifeInsuranceImpl
    with DiagnosticableTreeMixin
    implements _LifeInsurance {
  _$LifeInsuranceImpl(
      {required this.category,
      required this.insuranceCompanyName,
      required this.policyName,
      required this.policyNumber,
      required this.coverageAmount,
      required this.maturityDate,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$LifeInsuranceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LifeInsuranceImplFromJson(json);

  @override
  final String category;
  @override
  final String insuranceCompanyName;
  @override
  final String policyName;
  @override
  final String policyNumber;
  @override
  final int coverageAmount;
// Assuming coverageAmount is an integer
  @override
  final String maturityDate;
  @override
  final String comments;
  @override
  final String attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LifeInsurance(category: $category, insuranceCompanyName: $insuranceCompanyName, policyName: $policyName, policyNumber: $policyNumber, coverageAmount: $coverageAmount, maturityDate: $maturityDate, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LifeInsurance'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('insuranceCompanyName', insuranceCompanyName))
      ..add(DiagnosticsProperty('policyName', policyName))
      ..add(DiagnosticsProperty('policyNumber', policyNumber))
      ..add(DiagnosticsProperty('coverageAmount', coverageAmount))
      ..add(DiagnosticsProperty('maturityDate', maturityDate))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifeInsuranceImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.insuranceCompanyName, insuranceCompanyName) ||
                other.insuranceCompanyName == insuranceCompanyName) &&
            (identical(other.policyName, policyName) ||
                other.policyName == policyName) &&
            (identical(other.policyNumber, policyNumber) ||
                other.policyNumber == policyNumber) &&
            (identical(other.coverageAmount, coverageAmount) ||
                other.coverageAmount == coverageAmount) &&
            (identical(other.maturityDate, maturityDate) ||
                other.maturityDate == maturityDate) &&
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
      insuranceCompanyName,
      policyName,
      policyNumber,
      coverageAmount,
      maturityDate,
      comments,
      attachment,
      assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LifeInsuranceImplCopyWith<_$LifeInsuranceImpl> get copyWith =>
      __$$LifeInsuranceImplCopyWithImpl<_$LifeInsuranceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LifeInsuranceImplToJson(
      this,
    );
  }
}

abstract class _LifeInsurance implements LifeInsurance {
  factory _LifeInsurance(
      {required final String category,
      required final String insuranceCompanyName,
      required final String policyName,
      required final String policyNumber,
      required final int coverageAmount,
      required final String maturityDate,
      required final String comments,
      required final String attachment,
      required final int assetId}) = _$LifeInsuranceImpl;

  factory _LifeInsurance.fromJson(Map<String, dynamic> json) =
      _$LifeInsuranceImpl.fromJson;

  @override
  String get category;
  @override
  String get insuranceCompanyName;
  @override
  String get policyName;
  @override
  String get policyNumber;
  @override
  int get coverageAmount;
  @override // Assuming coverageAmount is an integer
  String get maturityDate;
  @override
  String get comments;
  @override
  String get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$LifeInsuranceImplCopyWith<_$LifeInsuranceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
