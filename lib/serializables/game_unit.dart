import 'package:eurpebet_main/serializables/live_casino_table.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:eurpebet_main/serializables/tag.dart';
import 'package:eurpebet_main/serializables/label.dart';
import 'package:eurpebet_main/serializables/jackpot.dart';


part 'game_unit.g.dart';

@JsonSerializable(explicitToJson: true)
class GameUnit {
  final int id;
  final String externalGameId;
  final int brandId;
  final bool isActive;
  final int typeId;
  final String name;
  final String image;
  final int integrationId;
  final String integrationName;
  final int pageId;
  final bonusContext;
  final String slug;
  final int gameVariantId;
  final List<Tag> tags;
  final List<Label> labels;
  final List<Jackpot> jackpots;
  final List<LiveCasinoTable> liveCasinoTables;
  final metaData;
  final int likeCount;
  final bool isLiked;

  const GameUnit(
    this.id,
    this.externalGameId,
    this.brandId,
    this.isActive,
    this.typeId,
    this.name,
    this.image,
    this.integrationId,
    this.integrationName,
    this.pageId,
    this.bonusContext,
    this.slug,
    this.gameVariantId,
    this.tags,
    this.labels,
    this.jackpots,
    this.liveCasinoTables,
    this.metaData,
    this.likeCount,
    this.isLiked,
  ) : assert(pageId != null);


  factory GameUnit.fromJson(Map<String, dynamic> json) => _$GameUnitFromJson(json);
  Map<String, dynamic> toJson() => _$GameUnitToJson(this);


}