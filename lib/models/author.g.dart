// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    json['full_name'] as String,
    (json['rewardPercent'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'full_name': instance.full_name,
      'rewardPercent': instance.rewardPercent,
    };
