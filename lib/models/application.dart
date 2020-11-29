import 'dart:io';
import 'package:rosseti/models/author.dart';
import 'package:rosseti/models/expense.dart';
import 'package:rosseti/models/stage.dart';
part 'application.g.dart';

//@JsonSerializable(nullable: true)
class Application {
  final int id;
  final String title;
  final String filePath;
  final String problem;
  final String decision;
  final String impact;
  final String category;
  final bool economy;
  final List<int> id_likers;
  final List<Author> other_authors;
  final List<Expense> expenses;
  final List<Stage> stages;
  final String fileUrl;
  final int count_likes;
  final String created_at;
  final String updated_at;
  final int chat_id;
  final String mainAuthor;

  Application(
      {this.id,
      this.filePath,
      this.category,
      this.impact,
      this.id_likers,
      this.title,
      this.problem,
      this.decision,
      this.economy,
      this.other_authors,
      this.expenses,
      this.stages,
      this.fileUrl,
      this.count_likes,
      this.created_at,
      this.updated_at,
      this.chat_id,
      this.mainAuthor});

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
