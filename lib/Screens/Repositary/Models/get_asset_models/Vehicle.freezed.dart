// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleResponse _$VehicleResponseFromJson(Map<String, dynamic> json) {
  return _VehicleResponse.fromJson(json);
}

/// @nodoc
mixin _$VehicleResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Vehicle> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleResponseCopyWith<VehicleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleResponseCopyWith<$Res> {
  factory $VehicleResponseCopyWith(
          VehicleResponse value, $Res Function(VehicleResponse) then) =
      _$VehicleResponseCopyWithImpl<$Res, VehicleResponse>;
  @useResult
  $Res call({bool success, String message, List<Vehicle> assets});
}

/// @nodoc
class _$VehicleResponseCopyWithImpl<$Res, $Val extends VehicleResponse>
    implements $VehicleResponseCopyWith<$Res> {
  _$VehicleResponseCopyWithImpl(this._value, this._then);

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
              as List<Vehicle>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleResponseImplCopyWith<$Res>
    implements $VehicleResponseCopyWith<$Res> {
  factory _$$VehicleResponseImplCopyWith(_$VehicleResponseImpl value,
          $Res Function(_$VehicleResponseImpl) then) =
      __$$VehicleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<Vehicle> assets});
}

/// @nodoc
class __$$VehicleResponseImplCopyWithImpl<$Res>
    extends _$VehicleResponseCopyWithImpl<$Res, _$VehicleResponseImpl>
    implements _$$VehicleResponseImplCopyWith<$Res> {
  __$$VehicleResponseImplCopyWithImpl(
      _$VehicleResponseImpl _value, $Res Function(_$VehicleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$VehicleResponseImpl(
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
              as List<Vehicle>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleResponseImpl
    with DiagnosticableTreeMixin
    implements _VehicleResponse {
  _$VehicleResponseImpl(
      {required this.success,
      required this.message,
      required final List<Vehicle> assets})
      : _assets = assets;

  factory _$VehicleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<Vehicle> _assets;
  @override
  List<Vehicle> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VehicleResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VehicleResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleResponseImpl &&
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
  _$$VehicleResponseImplCopyWith<_$VehicleResponseImpl> get copyWith =>
      __$$VehicleResponseImplCopyWithImpl<_$VehicleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleResponseImplToJson(
      this,
    );
  }
}

abstract class _VehicleResponse implements VehicleResponse {
  factory _VehicleResponse(
      {required final bool success,
      required final String message,
      required final List<Vehicle> assets}) = _$VehicleResponseImpl;

  factory _VehicleResponse.fromJson(Map<String, dynamic> json) =
      _$VehicleResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<Vehicle> get assets;
  @override
  @JsonKey(ignore: true)
  _$$VehicleResponseImplCopyWith<_$VehicleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get category => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String? get modelName => throw _privateConstructorUsedError;
  String get registrationNumber => throw _privateConstructorUsedError;
  String? get chassisNumber => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {String category,
      String vehicleType,
      String brandName,
      String? modelName,
      String registrationNumber,
      String? chassisNumber,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? vehicleType = null,
    Object? brandName = null,
    Object? modelName = freezed,
    Object? registrationNumber = null,
    Object? chassisNumber = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: freezed == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      chassisNumber: freezed == chassisNumber
          ? _value.chassisNumber
          : chassisNumber // ignore: cast_nullable_to_non_nullable
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
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String vehicleType,
      String brandName,
      String? modelName,
      String registrationNumber,
      String? chassisNumber,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? vehicleType = null,
    Object? brandName = null,
    Object? modelName = freezed,
    Object? registrationNumber = null,
    Object? chassisNumber = freezed,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$VehicleImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      modelName: freezed == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationNumber: null == registrationNumber
          ? _value.registrationNumber
          : registrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      chassisNumber: freezed == chassisNumber
          ? _value.chassisNumber
          : chassisNumber // ignore: cast_nullable_to_non_nullable
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
class _$VehicleImpl with DiagnosticableTreeMixin implements _Vehicle {
  _$VehicleImpl(
      {required this.category,
      required this.vehicleType,
      required this.brandName,
      required this.modelName,
      required this.registrationNumber,
      required this.chassisNumber,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  final String category;
  @override
  final String vehicleType;
  @override
  final String brandName;
  @override
  final String? modelName;
  @override
  final String registrationNumber;
  @override
  final String? chassisNumber;
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vehicle(category: $category, vehicleType: $vehicleType, brandName: $brandName, modelName: $modelName, registrationNumber: $registrationNumber, chassisNumber: $chassisNumber, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vehicle'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('vehicleType', vehicleType))
      ..add(DiagnosticsProperty('brandName', brandName))
      ..add(DiagnosticsProperty('modelName', modelName))
      ..add(DiagnosticsProperty('registrationNumber', registrationNumber))
      ..add(DiagnosticsProperty('chassisNumber', chassisNumber))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.modelName, modelName) ||
                other.modelName == modelName) &&
            (identical(other.registrationNumber, registrationNumber) ||
                other.registrationNumber == registrationNumber) &&
            (identical(other.chassisNumber, chassisNumber) ||
                other.chassisNumber == chassisNumber) &&
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
      vehicleType,
      brandName,
      modelName,
      registrationNumber,
      chassisNumber,
      comments,
      attachment,
      assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(
      this,
    );
  }
}

abstract class _Vehicle implements Vehicle {
  factory _Vehicle(
      {required final String category,
      required final String vehicleType,
      required final String brandName,
      required final String? modelName,
      required final String registrationNumber,
      required final String? chassisNumber,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$VehicleImpl;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  String get category;
  @override
  String get vehicleType;
  @override
  String get brandName;
  @override
  String? get modelName;
  @override
  String get registrationNumber;
  @override
  String? get chassisNumber;
  @override
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
