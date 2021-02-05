// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jackpot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jackpot _$JackpotFromJson(Map<String, dynamic> json) {
  return Jackpot(
    json['id'] as int,
    (json['amount'] as num)?.toDouble(),
    json['currency'] as String,
    json['gameId'] as int,
  );
}

Map<String, dynamic> _$JackpotToJson(Jackpot instance) => <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'currency': instance.currency,
      'gameId': instance.gameId,
    };
