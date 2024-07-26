import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'loan_given.freezed.dart';
part 'loan_given.g.dart';

@freezed
class LoanGivenResponse with _$LoanGivenResponse {
  factory LoanGivenResponse({
    required bool success,
    required String message,
    required List<LoanGiven> assets,
  }) = _LoanGivenResponse;

  factory LoanGivenResponse.fromJson(Map<String, dynamic> json) =>
      _$LoanGivenResponseFromJson(json);
}

@freezed
class LoanGiven with _$LoanGiven {
  factory LoanGiven({
    required String category,
    required String borrowerName,
    required int loanAmount,
    required String? loanGivenDate,
    required int? interestRate, // Updated to be nullable
    required String? comments,
    required String? attachment,
    required int assetId,
  }) = _LoanGiven;

  factory LoanGiven.fromJson(Map<String, dynamic> json) =>
      _$LoanGivenFromJson(json);
}
