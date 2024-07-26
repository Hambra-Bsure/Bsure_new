import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'crypto_exchange.freezed.dart';
part 'crypto_exchange.g.dart'; // This line is necessary for code generation

@freezed
class CryptoExchangeResponse with _$CryptoExchangeResponse {
  factory CryptoExchangeResponse({
    required bool success,
    required String message,
    required List<CryptoExchange> assets,
  }) = _CryptoExchangeResponse;

  factory CryptoExchangeResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoExchangeResponseFromJson(json);
}

@freezed
class CryptoExchange with _$CryptoExchange {
  factory CryptoExchange({
    required String category,
    required String exchangeName,
    required String accountNumber,
    required String? walletAddress,
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _CryptoExchange;

  factory CryptoExchange.fromJson(Map<String, dynamic> json) =>
      _$CryptoExchangeFromJson(json);
}

