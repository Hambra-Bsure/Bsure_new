import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_broker.freezed.dart';
part 'stock_broker.g.dart';

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
    String? attachment, // Make this field optional
    String? comments,   // Make this field optional
    required int assetId,
  }) = _StockBroker;

  factory StockBroker.fromJson(Map<String, dynamic> json) =>
      _$StockBrokerFromJson(json);
}
