import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'label.g.dart';

@JsonSerializable()
class Label {
  final int id;
  final String name;
  final String color;
  final int gameId;

  Label(this.id, this.name, this.color, this.gameId) : assert(id != null);

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
