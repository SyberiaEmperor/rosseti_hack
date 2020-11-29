

import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';


class Author {
  final String full_name;
  final double rewardPercent;

  Author(this.full_name, this.rewardPercent);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
