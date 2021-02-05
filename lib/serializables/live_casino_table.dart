import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'live_casino_table.g.dart';

@JsonSerializable()
class LiveCasinoTable {
  final int id;
  final String startTime;
  final String endTime;
  final bool isOpen;
  final int totalNumberOfSeats;
  final int seatsAvailable;
  final int numberOfPlayers;
  final double minBet;
  final double maxBet;
  final String results;
  final String externalGameId;
  final String tableId;

  LiveCasinoTable(
      this.id,
      this.startTime,
      this.endTime,
      this.isOpen,
      this.totalNumberOfSeats,
      this.seatsAvailable,
      this.numberOfPlayers,
      this.minBet,
      this.maxBet,
      this.results,
      this.externalGameId,

      this.tableId)
      : assert(id != null);

  factory LiveCasinoTable.fromJson(Map<String, dynamic> json) =>
      _$LiveCasinoTableFromJson(json);

  Map<String, dynamic> toJson() => _$LiveCasinoTableToJson(this);
}
