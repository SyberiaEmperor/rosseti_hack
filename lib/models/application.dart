import 'dart:io';
import 'package:rosseti/models/author.dart';
import 'package:rosseti/models/expense.dart';
import 'package:rosseti/models/stage.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

//@JsonSerializable(nullable: true)
class Application {
  final int id;
  final String title;
  final String problem;
  final String decision;
  final bool economy;
  final List<Author> other_authors;
  final List<Expense> expenses;
  final List<Stage> stages;
  final File file;
  final File doc_app;
  final int count_likes;
  final String created_at;
  final String updated_at;
  final int chat_id;

  Application(
      {this.id,
      this.title,
      this.problem,
      this.decision,
      this.economy,
      this.other_authors,
      this.expenses,
      this.stages,
      this.file,
      this.doc_app,
      this.count_likes,
      this.created_at,
      this.updated_at,
      this.chat_id});

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
