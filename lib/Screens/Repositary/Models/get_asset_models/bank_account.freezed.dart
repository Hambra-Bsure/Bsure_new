// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankResponse _$BankResponseFromJson(Map<String, dynamic> json) {
  return _BankResponse.fromJson(json);
}

/// @nodoc
mixin _$BankResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<BankAccount> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankResponseCopyWith<BankResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankResponseCopyWith<$Res> {
  factory $BankResponseCopyWith(
          BankResponse value, $Res Function(BankResponse) then) =
      _$BankResponseCopyWithImpl<$Res, BankResponse>;
  @useResult
  $Res call({bool success, String message, List<BankAccount> assets});
}

/// @nodoc
class _$BankResponseCopyWithImpl<$Res, $Val extends BankResponse>
    implements $BankResponseCopyWith<$Res> {
  _$BankResponseCopyWithImpl(this._value, this._then);

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
              as List<BankAccount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankResponseImplCopyWith<$Res>
    implements $BankResponseCopyWith<$Res> {
  factory _$$BankResponseImplCopyWith(
          _$BankResponseImpl value, $Res Function(_$BankResponseImpl) then) =
      __$$BankResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<BankAccount> assets});
}

/// @nodoc
class __$$BankResponseImplCopyWithImpl<$Res>
    extends _$BankResponseCopyWithImpl<$Res, _$BankResponseImpl>
    implements _$$BankResponseImplCopyWith<$Res> {
  __$$BankResponseImplCopyWithImpl(
      _$BankResponseImpl _value, $Res Function(_$BankResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$BankResponseImpl(
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
              as List<BankAccount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BankResponseImpl with DiagnosticableTreeMixin implements _BankResponse {
  _$BankResponseImpl(
      {required this.success,
      required this.message,
      required final List<BankAccount> assets})
      : _assets = assets;

  factory _$BankResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<BankAccount> _assets;
  @override
  List<BankAccount> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BankResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BankResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankResponseImpl &&
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
  _$$BankResponseImplCopyWith<_$BankResponseImpl> get copyWith =>
      __$$BankResponseImplCopyWithImpl<_$BankResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankResponseImplToJson(
      this,
    );
  }
}

abstract class _BankResponse implements BankResponse {
  factory _BankResponse(
      {required final bool success,
      required final String message,
      required final List<BankAccount> assets}) = _$BankResponseImpl;

  factory _BankResponse.fromJson(Map<String, dynamic> json) =
      _$BankResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<BankAccount> get assets;
  @override
  @JsonKey(ignore: true)
  _$$BankResponseImplCopyWith<_$BankResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  String get category => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;
  String get attachment => throw _privateConstructorUsedError;
  String get comments => throw _privateConstructorUsedError;
  String get accountType => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;
  String? get ifscCode => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
          BankAccount value, $Res Function(BankAccount) then) =
      _$BankAccountCopyWithImpl<$Res, BankAccount>;
  @useResult
  $Res call(
      {String category,
      String bankName,
      int assetId,
      String attachment,
      String comments,
      String accountType,
      String branchName,
      String? ifscCode,
      String? accountNumber});
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res, $Val extends BankAccount>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? bankName = null,
    Object? assetId = null,
    Object? attachment = null,
    Object? comments = null,
    Object? accountType = null,
    Object? branchName = null,
    Object? ifscCode = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: freezed == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
          _$AssetImpl value, $Res Function(_$AssetImpl) then) =
      __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String bankName,
      int assetId,
      String attachment,
      String comments,
      String accountType,
      String branchName,
      String? ifscCode,
      String? accountNumber});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$BankAccountCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
      _$AssetImpl _value, $Res Function(_$AssetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? bankName = null,
    Object? assetId = null,
    Object? attachment = null,
    Object? comments = null,
    Object? accountType = null,
    Object? branchName = null,
    Object? ifscCode = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_$AssetImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      assetId: null == assetId
          ? _value.assetId
          : assetId // ignore: cast_nullable_to_non_nullable
              as int,
      attachment: null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as String,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      ifscCode: freezed == ifscCode
          ? _value.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl with DiagnosticableTreeMixin implements _Asset {
  _$AssetImpl(
      {required this.category,
      required this.bankName,
      required this.assetId,
      required this.attachment,
      required this.comments,
      required this.accountType,
      required this.branchName,
      required this.ifscCode,
      required this.accountNumber});

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final String category;
  @override
  final String bankName;
  @override
  final int assetId;
  @override
  final String attachment;
  @override
  final String comments;
  @override
  final String accountType;
  @override
  final String branchName;
  @override
  final String? ifscCode;
  @override
  final String? accountNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BankAccount(category: $category, bankName: $bankName, assetId: $assetId, attachment: $attachment, comments: $comments, accountType: $accountType, branchName: $branchName, ifscCode: $ifscCode, accountNumber: $accountNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BankAccount'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('bankName', bankName))
      ..add(DiagnosticsProperty('assetId', assetId))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('accountType', accountType))
      ..add(DiagnosticsProperty('branchName', branchName))
      ..add(DiagnosticsProperty('ifscCode', ifscCode))
      ..add(DiagnosticsProperty('accountNumber', accountNumber));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.assetId, assetId) || other.assetId == assetId) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, bankName, assetId,
      attachment, comments, accountType, branchName, ifscCode, accountNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImplToJson(
      this,
    );
  }
}

abstract class _Asset implements BankAccount {
  factory _Asset(
      {required final String category,
      required final String bankName,
      required final int assetId,
      required final String attachment,
      required final String comments,
      required final String accountType,
      required final String branchName,
      required final String? ifscCode,
      required final String? accountNumber}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  String get category;
  @override
  String get bankName;
  @override
  int get assetId;
  @override
  String get attachment;
  @override
  String get comments;
  @override
  String get accountType;
  @override
  String get branchName;
  @override
  String? get ifscCode;
  @override
  String? get accountNumber;
  @override
  @JsonKey(ignore: true)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
