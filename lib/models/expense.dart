import 'package:json_annotation/json_annotation.dart';

part 'expense.g.dart';

//@JsonSerializable(nullable: false)
class Expense {
  final String position;
  final int sum;

  Expense(this.position, this.sum);

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
