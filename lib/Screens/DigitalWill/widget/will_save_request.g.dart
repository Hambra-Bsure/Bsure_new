// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'will_save_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WillSaveReqImpl _$$WillSaveReqImplFromJson(Map<String, dynamic> json) =>
    _$WillSaveReqImpl(
      assets: (json['assets'] as List<dynamic>)
          .map((e) => AssetReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WillSaveReqImplToJson(_$WillSaveReqImpl instance) =>
    <String, dynamic>{
      'assets': instance.assets,
    };

_$AssetReqImpl _$$AssetReqImplFromJson(Map<String, dynamic> json) =>
    _$AssetReqImpl(
      assetId: (json['assetId'] as num).toInt(),
      nominees: (json['nominees'] as List<dynamic>)
          .map((e) => NomineeReq.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AssetReqImplToJson(_$AssetReqImpl instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'nominees': instance.nominees,
    };

_$NomineeReqImpl _$$NomineeReqImplFromJson(Map<String, dynamic> json) =>
    _$NomineeReqImpl(
      nomineeId: (json['nomineeId'] as num).toInt(),
      share: (json['share'] as num).toDouble(),
    );

Map<String, dynamic> _$$NomineeReqImplToJson(_$NomineeReqImpl instance) =>
    <String, dynamic>{
      'nomineeId': instance.nomineeId,
      'share': instance.share,
    };
