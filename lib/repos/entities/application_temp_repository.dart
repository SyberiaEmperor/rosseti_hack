import 'dart:convert';
import 'dart:io';

import 'package:rosseti/helpers/requests/requests.dart';
import 'package:rosseti/models/application.dart';
import 'package:rosseti/models/author.dart';
import 'package:rosseti/models/expense.dart';
import 'package:rosseti/models/stage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationTempRepository {
  static ApplicationTempRepository instance;
  ApplicationTempRepository._();
  factory ApplicationTempRepository() {
    if (instance == null) {
      instance = ApplicationTempRepository._();
    }
    return instance;
  }
  String mainAuthor ='';
  String title = '';
  String category = '';
  String problem = '';
  String decision = '';
  String impact = '';
  List<Expense> expenses = [];
  List<Stage> stages = [];
  List<Author> otherAuthors = [];
  bool economy = false;
  File file;

  Future<void> persistData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("application", jsonEncode(application.toJson()));
  }

  void clear() {
    title = '';
    category = '';
    problem = '';
    decision = '';
    impact = '';
    expenses = [];
    stages = [];
    otherAuthors = [];
    economy = false;
    file = null;
  }

  Future<bool> sendToServer() async {
    try {
      await sendApplication(application);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("application");
      clear();
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }

  void uploadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('application'))
      getDataFromApplication(
          Application.fromJson(jsonDecode(prefs.getString('application'))));
  }

  void getDataFromApplication(Application app) {
    title = app.title;
    category = app.category;
    problem = app.problem;
    decision = app.decision;
    impact = app.impact;
    expenses = app.expenses;
    stages = app.stages;
    otherAuthors = app.other_authors;
    economy = app.economy;
    mainAuthor = app.mainAuthor;
    file = app.filePath != null ? File(app.filePath) : null;
  }

  Application get application => Application(
        title: title,
        category: category,
        problem: problem,
        decision: decision,
        impact: impact,
        expenses: expenses,
        stages: stages,
        other_authors: otherAuthors,
        economy: economy,
        mainAuthor: mainAuthor,
        filePath: file!=null?file.path:null,
        fileUrl: file!=null?file.path:'',
      );
}
