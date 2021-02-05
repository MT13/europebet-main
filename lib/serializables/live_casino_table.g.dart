// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_casino_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveCasinoTable _$LiveCasinoTableFromJson(Map<String, dynamic> json) {
  return LiveCasinoTable(
    json['id'] as int,
    json['startTime'] as String,
    json['endTime'] as String,
    json['isOpen'] as bool,
    json['totalNumberOfSeats'] as int,
    json['seatsAvailable'] as int,
    json['numberOfPlayers'] as int,
    (json['minBet'] as num)?.toDouble(),
    (json['maxBet'] as num)?.toDouble(),
    json['results'] as String,
    json['externalGameId'] as String,
    json['tableId'] as String,
  );
}

Map<String, dynamic> _$LiveCasinoTableToJson(LiveCasinoTable instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'isOpen': instance.isOpen,
      'totalNumberOfSeats': instance.totalNumberOfSeats,
      'seatsAvailable': instance.seatsAvailable,
      'numberOfPlayers': instance.numberOfPlayers,
      'minBet': instance.minBet,
      'maxBet': instance.maxBet,
      'results': instance.results,
      'externalGameId': instance.externalGameId,
      'tableId': instance.tableId,
    };
