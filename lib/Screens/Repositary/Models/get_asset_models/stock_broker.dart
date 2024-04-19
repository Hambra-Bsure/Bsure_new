import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'stock_broker.freezed.dart';
part 'stock_broker.g.dart'; // This line is necessary for code generation

@freezed
class StockBrokerResponse with _$StockBrokerResponse {
  factory StockBrokerResponse({
    required bool success,
    required String message,
    required List<StockBroker> assets,
  }) = _StockBrokerResponse;

  factory StockBrokerResponse.fromJson(Map<String, dynamic> json) =>
      _$StockBrokerResponseFromJson(json);
}

@freezed
class StockBroker with _$StockBroker {
  factory StockBroker({
    required String category,
    required String brokerName,
    required String dematAccountNumber,
    required String attachment,
    required String comments,
    required int assetId,
  }) = _StockBroker;

  factory StockBroker.fromJson(Map<String, dynamic> json) =>
      _$StockBrokerFromJson(json);
}
