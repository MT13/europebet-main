import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jackpot.g.dart';

@JsonSerializable()
class Jackpot {
  final int id;
  final double amount;
  final String currency;
  final int gameId;

  Jackpot(this.id, this.amount, this.currency, this.gameId) : assert(id != null);

  factory Jackpot.fromJson(Map<String, dynamic> json) => _$JackpotFromJson(json);

  Map<String, dynamic> toJson() => _$JackpotToJson(this);
}
