// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoldResponseImpl _$$GoldResponseImplFromJson(Map<String, dynamic> json) =>
    _$GoldResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => Golds.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GoldResponseImplToJson(_$GoldResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$GoldsImpl _$$GoldsImplFromJson(Map<String, dynamic> json) => _$GoldsImpl(
      category: json['category'] as String,
      metalType: json['metalType'] as String,
      type: json['type'] as String,
      weightInGrams: (json['weightInGrams'] as num?)?.toInt(),
      whereItIsKept: json['whereItIsKept'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: (json['assetId'] as num).toInt(),
    );

Map<String, dynamic> _$$GoldsImplToJson(_$GoldsImpl instance) =>
    <String, dynamic>{
      'category': instance.category,
      'metalType': instance.metalType,
      'type': instance.type,
      'weightInGrams': instance.weightInGrams,
      'whereItIsKept': instance.whereItIsKept,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
