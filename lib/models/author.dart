import 'package:flutter/foundation.dart';
import 'package:json_serializable/builder.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable(nullable: false)
class Author {
  final String full_name;
  final double rewardPercent;

  Author(this.full_name, this.rewardPercent);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
