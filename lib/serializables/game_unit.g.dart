// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameUnit _$GameUnitFromJson(Map<String, dynamic> json) {
  return GameUnit(
    json['id'] as int,
    json['externalGameId'] as String,
    json['brandId'] as int,
    json['isActive'] as bool,
    json['typeId'] as int,
    json['name'] as String,
    json['image'] as String,
    json['integrationId'] as int,
    json['integrationName'] as String,
    json['pageId'] as int,
    json['bonusContext'],
    json['slug'] as String,
    json['gameVariantId'] as int,
    (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['labels'] as List)
        ?.map(
            (e) => e == null ? null : Label.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['jackpots'] as List)
        ?.map((e) =>
            e == null ? null : Jackpot.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['liveCasinoTables'] as List)
        ?.map((e) => e == null
            ? null
            : LiveCasinoTable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['metaData'],
    json['likeCount'] as int,
    json['isLiked'] as bool,
  );
}

Map<String, dynamic> _$GameUnitToJson(GameUnit instance) => <String, dynamic>{
      'id': instance.id,
      'externalGameId': instance.externalGameId,
      'brandId': instance.brandId,
      'isActive': instance.isActive,
      'typeId': instance.typeId,
      'name': instance.name,
      'image': instance.image,
      'integrationId': instance.integrationId,
      'integrationName': instance.integrationName,
      'pageId': instance.pageId,
      'bonusContext': instance.bonusContext,
      'slug': instance.slug,
      'gameVariantId': instance.gameVariantId,
      'tags': instance.tags?.map((e) => e?.toJson())?.toList(),
      'labels': instance.labels?.map((e) => e?.toJson())?.toList(),
      'jackpots': instance.jackpots?.map((e) => e?.toJson())?.toList(),
      'liveCasinoTables':
          instance.liveCasinoTables?.map((e) => e?.toJson())?.toList(),
      'metaData': instance.metaData,
      'likeCount': instance.likeCount,
      'isLiked': instance.isLiked,
    };
