// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'non_life_insurance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NonLifeInsuranceResponse _$NonLifeInsuranceResponseFromJson(
    Map<String, dynamic> json) {
  return _NonLifeInsuranceResponse.fromJson(json);
}

/// @nodoc
mixin _$NonLifeInsuranceResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<NonLifeInsurance> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NonLifeInsuranceResponseCopyWith<NonLifeInsuranceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonLifeInsuranceResponseCopyWith<$Res> {
  factory $NonLifeInsuranceResponseCopyWith(NonLifeInsuranceResponse value,
          $Res Function(NonLifeInsuranceResponse) then) =
      _$NonLifeInsuranceResponseCopyWithImpl<$Res, NonLifeInsuranceResponse>;
  @useResult
  $Res call({bool success, String message, List<NonLifeInsurance> assets});
}

/// @nodoc
class _$NonLifeInsuranceResponseCopyWithImpl<$Res,
        $Val extends NonLifeInsuranceResponse>
    implements $NonLifeInsuranceResponseCopyWith<$Res> {
  _$NonLifeInsuranceResponseCopyWithImpl(this._value, this._then);

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
              as List<NonLifeInsurance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NonLifeInsuranceResponseImplCopyWith<$Res>
    implements $NonLifeInsuranceResponseCopyWith<$Res> {
  factory _$$NonLifeInsuranceResponseImplCopyWith(
          _$NonLifeInsuranceResponseImpl value,
          $Res Function(_$NonLifeInsuranceResponseImpl) then) =
      __$$NonLifeInsuranceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<NonLifeInsurance> assets});
}

/// @nodoc
class __$$NonLifeInsuranceResponseImplCopyWithImpl<$Res>
    extends _$NonLifeInsuranceResponseCopyWithImpl<$Res,
        _$NonLifeInsuranceResponseImpl>
    implements _$$NonLifeInsuranceResponseImplCopyWith<$Res> {
  __$$NonLifeInsuranceResponseImplCopyWithImpl(
      _$NonLifeInsuranceResponseImpl _value,
      $Res Function(_$NonLifeInsuranceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$NonLifeInsuranceResponseImpl(
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
              as List<NonLifeInsurance>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NonLifeInsuranceResponseImpl
    with DiagnosticableTreeMixin
    implements _NonLifeInsuranceResponse {
  _$NonLifeInsuranceResponseImpl(
      {required this.success,
      required this.message,
      required final List<NonLifeInsurance> assets})
      : _assets = assets;

  factory _$NonLifeInsuranceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NonLifeInsuranceResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<NonLifeInsurance> _assets;
  @override
  List<NonLifeInsurance> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NonLifeInsuranceResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NonLifeInsuranceResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonLifeInsuranceResponseImpl &&
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
  _$$NonLifeInsuranceResponseImplCopyWith<_$NonLifeInsuranceResponseImpl>
      get copyWith => __$$NonLifeInsuranceResponseImplCopyWithImpl<
          _$NonLifeInsuranceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NonLifeInsuranceResponseImplToJson(
      this,
    );
  }
}

abstract class _NonLifeInsuranceResponse implements NonLifeInsuranceResponse {
  factory _NonLifeInsuranceResponse(
          {required final bool success,
          required final String message,
          required final List<NonLifeInsurance> assets}) =
      _$NonLifeInsuranceResponseImpl;

  factory _NonLifeInsuranceResponse.fromJson(Map<String, dynamic> json) =
      _$NonLifeInsuranceResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<NonLifeInsurance> get assets;
  @override
  @JsonKey(ignore: true)
  _$$NonLifeInsuranceResponseImplCopyWith<_$NonLifeInsuranceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

NonLifeInsurance _$NonLifeInsuranceFromJson(Map<String, dynamic> json) {
  return _NonLifeInsurance.fromJson(json);
}

/// @nodoc
mixin _$NonLifeInsurance {
  String get category => throw _privateConstructorUsedError;
  String get insuranceCompanyName => throw _privateConstructorUsedError;
  String get typeOfInsurance => throw _privateConstructorUsedError;
  String? get policyName => throw _privateConstructorUsedError;
  String? get policyNumber => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NonLifeInsuranceCopyWith<NonLifeInsurance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonLifeInsuranceCopyWith<$Res> {
  factory $NonLifeInsuranceCopyWith(
          NonLifeInsurance value, $Res Function(NonLifeInsurance) then) =
      _$NonLifeInsuranceCopyWithImpl<$Res, NonLifeInsurance>;
  @useResult
  $Res call(
      {String category,
      String insuranceCompanyName,
      String typeOfInsurance,
      String? policyName,
      String? policyNumber,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$NonLifeInsuranceCopyWithImpl<$Res, $Val extends NonLifeInsurance>
    implements $NonLifeInsuranceCopyWith<$Res> {
  _$NonLifeInsuranceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? insuranceCompanyName = null,
    Object? typeOfInsurance = null,
    Object? policyName = freezed,
    Object? policyNumber = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
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
      typeOfInsurance: null == typeOfInsurance
          ? _value.typeOfInsurance
          : typeOfInsurance // ignore: cast_nullable_to_non_nullable
              as String,
      policyName: freezed == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String?,
      policyNumber: freezed == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
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
abstract class _$$NonLifeInsuranceImplCopyWith<$Res>
    implements $NonLifeInsuranceCopyWith<$Res> {
  factory _$$NonLifeInsuranceImplCopyWith(_$NonLifeInsuranceImpl value,
          $Res Function(_$NonLifeInsuranceImpl) then) =
      __$$NonLifeInsuranceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String insuranceCompanyName,
      String typeOfInsurance,
      String? policyName,
      String? policyNumber,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$NonLifeInsuranceImplCopyWithImpl<$Res>
    extends _$NonLifeInsuranceCopyWithImpl<$Res, _$NonLifeInsuranceImpl>
    implements _$$NonLifeInsuranceImplCopyWith<$Res> {
  __$$NonLifeInsuranceImplCopyWithImpl(_$NonLifeInsuranceImpl _value,
      $Res Function(_$NonLifeInsuranceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? insuranceCompanyName = null,
    Object? typeOfInsurance = null,
    Object? policyName = freezed,
    Object? policyNumber = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$NonLifeInsuranceImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      insuranceCompanyName: null == insuranceCompanyName
          ? _value.insuranceCompanyName
          : insuranceCompanyName // ignore: cast_nullable_to_non_nullable
              as String,
      typeOfInsurance: null == typeOfInsurance
          ? _value.typeOfInsurance
          : typeOfInsurance // ignore: cast_nullable_to_non_nullable
              as String,
      policyName: freezed == policyName
          ? _value.policyName
          : policyName // ignore: cast_nullable_to_non_nullable
              as String?,
      policyNumber: freezed == policyNumber
          ? _value.policyNumber
          : policyNumber // ignore: cast_nullable_to_non_nullable
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
class _$NonLifeInsuranceImpl
    with DiagnosticableTreeMixin
    implements _NonLifeInsurance {
  _$NonLifeInsuranceImpl(
      {required this.category,
      required this.insuranceCompanyName,
      required this.typeOfInsurance,
      required this.policyName,
      required this.policyNumber,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$NonLifeInsuranceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NonLifeInsuranceImplFromJson(json);

  @override
  final String category;
  @override
  final String insuranceCompanyName;
  @override
  final String typeOfInsurance;
  @override
  final String? policyName;
  @override
  final String? policyNumber;
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NonLifeInsurance(category: $category, insuranceCompanyName: $insuranceCompanyName, typeOfInsurance: $typeOfInsurance, policyName: $policyName, policyNumber: $policyNumber, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NonLifeInsurance'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('insuranceCompanyName', insuranceCompanyName))
      ..add(DiagnosticsProperty('typeOfInsurance', typeOfInsurance))
      ..add(DiagnosticsProperty('policyName', policyName))
      ..add(DiagnosticsProperty('policyNumber', policyNumber))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonLifeInsuranceImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.insuranceCompanyName, insuranceCompanyName) ||
                other.insuranceCompanyName == insuranceCompanyName) &&
            (identical(other.typeOfInsurance, typeOfInsurance) ||
                other.typeOfInsurance == typeOfInsurance) &&
            (identical(other.policyName, policyName) ||
                other.policyName == policyName) &&
            (identical(other.policyNumber, policyNumber) ||
                other.policyNumber == policyNumber) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, insuranceCompanyName,
      typeOfInsurance, policyName, policyNumber, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NonLifeInsuranceImplCopyWith<_$NonLifeInsuranceImpl> get copyWith =>
      __$$NonLifeInsuranceImplCopyWithImpl<_$NonLifeInsuranceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NonLifeInsuranceImplToJson(
      this,
    );
  }
}

abstract class _NonLifeInsurance implements NonLifeInsurance {
  factory _NonLifeInsurance(
      {required final String category,
      required final String insuranceCompanyName,
      required final String typeOfInsurance,
      required final String? policyName,
      required final String? policyNumber,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$NonLifeInsuranceImpl;

  factory _NonLifeInsurance.fromJson(Map<String, dynamic> json) =
      _$NonLifeInsuranceImpl.fromJson;

  @override
  String get category;
  @override
  String get insuranceCompanyName;
  @override
  String get typeOfInsurance;
  @override
  String? get policyName;
  @override
  String? get policyNumber;
  @override
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$NonLifeInsuranceImplCopyWith<_$NonLifeInsuranceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
