import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

//@JsonSerializable(nullable: false)
class Stage {
  final String number;
  final int term;

  Stage(this.number, this.term);

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
  Map<String, dynamic> toJson() => _$StageToJson(this);
}
