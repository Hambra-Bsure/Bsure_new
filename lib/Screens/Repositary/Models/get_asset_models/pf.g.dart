// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PfResponseImpl _$$PfResponseImplFromJson(Map<String, dynamic> json) =>
    _$PfResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      assets: (json['assets'] as List<dynamic>)
          .map((e) => PF.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PfResponseImplToJson(_$PfResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'assets': instance.assets,
    };

_$PFImpl _$$PFImplFromJson(Map<String, dynamic> json) => _$PFImpl(
      category: json['category'] as String,
      uanNumber: json['uanNumber'] as String,
      comments: json['comments'] as String,
      attachment: json['attachment'] as String,
      assetId: json['assetId'] as int,
    );

Map<String, dynamic> _$$PFImplToJson(_$PFImpl instance) => <String, dynamic>{
      'category': instance.category,
      'uanNumber': instance.uanNumber,
      'comments': instance.comments,
      'attachment': instance.attachment,
      'assetId': instance.assetId,
    };
