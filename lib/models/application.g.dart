// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    id: json['id'] as int,
    title: json['title'] as String??"",
    problem: json['problem'] as String??"",
    decision: json['decision'] as String??"",
    economy: json['economy'] as bool,
    /*other_authors: (json['other_authors'] as List)
        ?.map((e) =>
            e == null ? null : Author.fromJson(e as Map<String, dynamic>))
        ?.toList(),*/
    expenses: (json['expenses'] as List)
        ?.map((e) =>
            e == null ? null : Expense.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    stages: (json['stages'] as List)
        ?.map(
            (e) => e == null ? null : Stage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    count_likes: json['count_likes'] as int,
    created_at: json['created_at'] as String??"",
    updated_at: json['updated_at'] as String??"",
    chat_id:json['chat']!=null? (json['chat'] as Map)['id'] as int:null,
    fileUrl: json['file']!=null?(json['file'] as Map)['url'] as String:null,
    filePath: json['filePath'],
    id_likers: json['id_likers'] as List,
    category: json['category']??"",
    impact:json['impact']??"",
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'problem': instance.problem,
      'decision': instance.decision,
      'economy': instance.economy,
      'other_authors': instance.mainAuthor,
      'expenses': instance.expenses,
      'stages': instance.stages,
      'count_likes': instance.count_likes,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'chat_id': instance.chat_id,
      'filePath':instance.filePath,
      'impact':instance.impact,
      'category':instance.category,
    };
