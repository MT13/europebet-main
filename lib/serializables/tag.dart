import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  final int id;
  final String name;
  final String color;
  final int gameId;

  Tag(this.id, this.name, this.color, this.gameId) : assert(id != null);

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
