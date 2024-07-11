// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_given.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoanGivenResponseImpl _$$LoanGivenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoanGivenResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => LoanGiven.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LoanGivenResponseImplToJson(
        _$LoanGivenResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$LoanGivenImpl _$$LoanGivenImplFromJson(Map<String, dynamic> json) =>
    _$LoanGivenImpl(
      category: json['category'] as String,
      borrowerName: json['borrowerName'] as String,
      loanAmount: (json['loanAmount'] as num?)?.toInt(),
      loanGivenDate: json['loanGivenDate'] as String,
      interestRate: (json['interestRate'] as num?)?.toInt(),
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: (json['assetId'] as num).toInt(),
    );

Map<String, dynamic> _$$LoanGivenImplToJson(_$LoanGivenImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'borrowerName': instance.borrowerName,
      'loanAmount': instance.loanAmount,
      'loanGivenDate': instance.loanGivenDate,
      'interestRate': instance.interestRate,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
