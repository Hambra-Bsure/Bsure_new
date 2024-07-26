// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_office_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostOfficeAccountResponse _$PostOfficeAccountResponseFromJson(
    Map<String, dynamic> json) {
  return _PostOfficeAccountResponse.fromJson(json);
}

/// @nodoc
mixin _$PostOfficeAccountResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<PostOfficeAccount> get assets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostOfficeAccountResponseCopyWith<PostOfficeAccountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostOfficeAccountResponseCopyWith<$Res> {
  factory $PostOfficeAccountResponseCopyWith(PostOfficeAccountResponse value,
          $Res Function(PostOfficeAccountResponse) then) =
      _$PostOfficeAccountResponseCopyWithImpl<$Res, PostOfficeAccountResponse>;
  @useResult
  $Res call({bool success, String message, List<PostOfficeAccount> assets});
}

/// @nodoc
class _$PostOfficeAccountResponseCopyWithImpl<$Res,
        $Val extends PostOfficeAccountResponse>
    implements $PostOfficeAccountResponseCopyWith<$Res> {
  _$PostOfficeAccountResponseCopyWithImpl(this._value, this._then);

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
              as List<PostOfficeAccount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostOfficeAccountResponseImplCopyWith<$Res>
    implements $PostOfficeAccountResponseCopyWith<$Res> {
  factory _$$PostOfficeAccountResponseImplCopyWith(
          _$PostOfficeAccountResponseImpl value,
          $Res Function(_$PostOfficeAccountResponseImpl) then) =
      __$$PostOfficeAccountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<PostOfficeAccount> assets});
}

/// @nodoc
class __$$PostOfficeAccountResponseImplCopyWithImpl<$Res>
    extends _$PostOfficeAccountResponseCopyWithImpl<$Res,
        _$PostOfficeAccountResponseImpl>
    implements _$$PostOfficeAccountResponseImplCopyWith<$Res> {
  __$$PostOfficeAccountResponseImplCopyWithImpl(
      _$PostOfficeAccountResponseImpl _value,
      $Res Function(_$PostOfficeAccountResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? assets = null,
  }) {
    return _then(_$PostOfficeAccountResponseImpl(
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
              as List<PostOfficeAccount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostOfficeAccountResponseImpl
    with DiagnosticableTreeMixin
    implements _PostOfficeAccountResponse {
  _$PostOfficeAccountResponseImpl(
      {required this.success,
      required this.message,
      required final List<PostOfficeAccount> assets})
      : _assets = assets;

  factory _$PostOfficeAccountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostOfficeAccountResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<PostOfficeAccount> _assets;
  @override
  List<PostOfficeAccount> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostOfficeAccountResponse(success: $success, message: $message, assets: $assets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostOfficeAccountResponse'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('assets', assets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostOfficeAccountResponseImpl &&
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
  _$$PostOfficeAccountResponseImplCopyWith<_$PostOfficeAccountResponseImpl>
      get copyWith => __$$PostOfficeAccountResponseImplCopyWithImpl<
          _$PostOfficeAccountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostOfficeAccountResponseImplToJson(
      this,
    );
  }
}

abstract class _PostOfficeAccountResponse implements PostOfficeAccountResponse {
  factory _PostOfficeAccountResponse(
          {required final bool success,
          required final String message,
          required final List<PostOfficeAccount> assets}) =
      _$PostOfficeAccountResponseImpl;

  factory _PostOfficeAccountResponse.fromJson(Map<String, dynamic> json) =
      _$PostOfficeAccountResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<PostOfficeAccount> get assets;
  @override
  @JsonKey(ignore: true)
  _$$PostOfficeAccountResponseImplCopyWith<_$PostOfficeAccountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PostOfficeAccount _$PostOfficeAccountFromJson(Map<String, dynamic> json) {
  return _PostOfficeAccount.fromJson(json);
}

/// @nodoc
mixin _$PostOfficeAccount {
  String get category => throw _privateConstructorUsedError;
  String get branchName => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  String get accountType => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;
  String? get attachment => throw _privateConstructorUsedError;
  int get assetId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostOfficeAccountCopyWith<PostOfficeAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostOfficeAccountCopyWith<$Res> {
  factory $PostOfficeAccountCopyWith(
          PostOfficeAccount value, $Res Function(PostOfficeAccount) then) =
      _$PostOfficeAccountCopyWithImpl<$Res, PostOfficeAccount>;
  @useResult
  $Res call(
      {String category,
      String branchName,
      String? accountNumber,
      String accountType,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class _$PostOfficeAccountCopyWithImpl<$Res, $Val extends PostOfficeAccount>
    implements $PostOfficeAccountCopyWith<$Res> {
  _$PostOfficeAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? branchName = null,
    Object? accountNumber = freezed,
    Object? accountType = null,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$PostOfficeAccountImplCopyWith<$Res>
    implements $PostOfficeAccountCopyWith<$Res> {
  factory _$$PostOfficeAccountImplCopyWith(_$PostOfficeAccountImpl value,
          $Res Function(_$PostOfficeAccountImpl) then) =
      __$$PostOfficeAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String category,
      String branchName,
      String? accountNumber,
      String accountType,
      String? comments,
      String? attachment,
      int assetId});
}

/// @nodoc
class __$$PostOfficeAccountImplCopyWithImpl<$Res>
    extends _$PostOfficeAccountCopyWithImpl<$Res, _$PostOfficeAccountImpl>
    implements _$$PostOfficeAccountImplCopyWith<$Res> {
  __$$PostOfficeAccountImplCopyWithImpl(_$PostOfficeAccountImpl _value,
      $Res Function(_$PostOfficeAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? branchName = null,
    Object? accountNumber = freezed,
    Object? accountType = null,
    Object? comments = freezed,
    Object? attachment = freezed,
    Object? assetId = null,
  }) {
    return _then(_$PostOfficeAccountImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      branchName: null == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$PostOfficeAccountImpl
    with DiagnosticableTreeMixin
    implements _PostOfficeAccount {
  _$PostOfficeAccountImpl(
      {required this.category,
      required this.branchName,
      required this.accountNumber,
      required this.accountType,
      required this.comments,
      required this.attachment,
      required this.assetId});

  factory _$PostOfficeAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostOfficeAccountImplFromJson(json);

  @override
  final String category;
  @override
  final String branchName;
  @override
  final String? accountNumber;
  @override
  final String accountType;
  @override
  final String? comments;
  @override
  final String? attachment;
  @override
  final int assetId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostOfficeAccount(category: $category, branchName: $branchName, accountNumber: $accountNumber, accountType: $accountType, comments: $comments, attachment: $attachment, assetId: $assetId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostOfficeAccount'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('branchName', branchName))
      ..add(DiagnosticsProperty('accountNumber', accountNumber))
      ..add(DiagnosticsProperty('accountType', accountType))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('attachment', attachment))
      ..add(DiagnosticsProperty('assetId', assetId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostOfficeAccountImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment) &&
            (identical(other.assetId, assetId) || other.assetId == assetId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, category, branchName,
      accountNumber, accountType, comments, attachment, assetId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostOfficeAccountImplCopyWith<_$PostOfficeAccountImpl> get copyWith =>
      __$$PostOfficeAccountImplCopyWithImpl<_$PostOfficeAccountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostOfficeAccountImplToJson(
      this,
    );
  }
}

abstract class _PostOfficeAccount implements PostOfficeAccount {
  factory _PostOfficeAccount(
      {required final String category,
      required final String branchName,
      required final String? accountNumber,
      required final String accountType,
      required final String? comments,
      required final String? attachment,
      required final int assetId}) = _$PostOfficeAccountImpl;

  factory _PostOfficeAccount.fromJson(Map<String, dynamic> json) =
      _$PostOfficeAccountImpl.fromJson;

  @override
  String get category;
  @override
  String get branchName;
  @override
  String? get accountNumber;
  @override
  String get accountType;
  @override
  String? get comments;
  @override
  String? get attachment;
  @override
  int get assetId;
  @override
  @JsonKey(ignore: true)
  _$$PostOfficeAccountImplCopyWith<_$PostOfficeAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
