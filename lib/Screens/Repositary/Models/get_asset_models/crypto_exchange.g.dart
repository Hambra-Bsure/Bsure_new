// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoExchangeResponseImpl _$$CryptoExchangeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CryptoExchangeResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => CryptoExchange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CryptoExchangeResponseImplToJson(
        _$CryptoExchangeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$CryptoExchangeImpl _$$CryptoExchangeImplFromJson(Map<String, dynamic> json) =>
    _$CryptoExchangeImpl(
      category: json['category'] as String,
      exchangeName: json['exchangeName'] as String,
      accountNumber: json['accountNumber'] as String,
      walletAddress: json['walletAddress'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$CryptoExchangeImplToJson(
        _$CryptoExchangeImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'exchangeName': instance.exchangeName,
      'accountNumber': instance.accountNumber,
      'walletAddress': instance.walletAddress,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
