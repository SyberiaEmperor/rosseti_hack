import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/models/profile.dart';
import 'package:rosseti/helpers/requests/requests.dart';

class RegistryItem {
  final int id;
  final int chatID;
  final String currentStateDes;
  final DateTime date;
  final Profile user;
  final String title;
  int numberAccepted;
  final Direction direction;
  final Status status;
  final String predictedStateDes;
  final String ideaStateDes;
  bool isLiked;
  final int uniq;
  final int popularity;

  void liked() {
    if (isLiked) return;
    isLiked = true;
    numberAccepted++;
    like(id);
  }

  void disliked() {
    if (!isLiked) return;
    isLiked = false;
    numberAccepted--;
    dislike(id);
  }

  factory RegistryItem.fromData(Map<String, dynamic> data, int userId) {
    int id = data['id'] as int;
    int chatID = data['chat']['id'] as int;
    String currentStateDes = data['problem'] as String;
    DateTime date = DateTime.parse(data['created_at']);
    Profile user = Profile.test();
    /*if (data["other_authors"] != null)
      user = Profile.fromJson((data["other_authors"] as List<dynamic>).first);*/
    String title = data['title'] as String;
    int numberAccepted = data["count_likes"] as int;
    Direction direction = Direction.values[data["direction_activity"] as int];
    Status status = Status.values[data['status'] as int];
    String predictedStateDes = data['impact'] as String;
    String ideaStateDes = data['decision'] as String;
    bool isLiked = false;
    if (data["id_likers"] != null) {
      var likers = data["id_likers"] as List<dynamic>;
      if (likers.contains(userId)) isLiked = true;
    }
    int uniq = data["uniqueness"] as int;
    int popularity = data["popularity"] as int;
    return RegistryItem(
        id: id,
        date: date,
        user: user,
        title: title,
        numberAccepted: numberAccepted,
        direction: direction,
        status: status,
        chatID: chatID,
        currentStateDes: currentStateDes,
        predictedStateDes: predictedStateDes,
        ideaStateDes: ideaStateDes,
        isLiked: isLiked,
        uniq: uniq,
        popularity: popularity);
  }

  factory RegistryItem.test(int status) {
    Random rand = Random(status);
    var date = DateTime(2020);
    var title =
        "В Курске можно открыть первый Межрегиональный центр управления сетями";
    var numberAccepted = rand.nextInt(1000);
    var uniqueness = rand.nextInt(100);

    var popularity = rand.nextInt(100);

    Status statusType = Status.values[status % 5];
    var id = rand.nextInt(100);
    var dir = Direction.values[status % 5 + 1];
    return RegistryItem(
      id: id,
      date: date,
      user: Profile.test(),
      title: title,
      numberAccepted: numberAccepted,
      direction: dir,
      status: statusType,
      chatID: 1,
      currentStateDes:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare ullamcorper augue id elit etiam dignissim suspendisse neque. Amet, vitae gravida faucibus imperdiet vel in fermentum sit. Nullam venenatis, venenatis justo, ultrices sed faucibus et duis ullamcorper. Sed tortor odio enim non etiam molestie sit at. Orci, egestas magna magnis eleifend elit. Dictum turpis mattis aenean tempus adipiscing tincidunt augue a. Tellus massaNibh id auccasator pharetra sit morbi est quis.",
      predictedStateDes:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare ullamcorper augue id elit etiam dignissim suspendisse neque. Amet, vitae gravida faucibus imperdiet vel in fermentum sit. Nullam venenatis, venenatis justo, ultrices sed faucibus et duis ullamcorper. Sed tortor odio enim non etiam molestie sit at. Orci, egestas magna magnis eleifend elit. Dictum turpis mattis aenean tempus adipiscing tincidunt augue a. Tellus massaNibh id auccasator pharetra sit morbi est quis.",
      ideaStateDes:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare ullamcorper augue id elit etiam dignissim suspendisse neque. Amet, vitae gravida faucibus imperdiet vel in fermentum sit. Nullam venenatis, venenatis justo, ultrices sed faucibus et duis ullamcorper. Sed tortor odio enim non etiam molestie sit at. Orci, egestas magna magnis eleifend elit. Dictum turpis mattis aenean tempus adipiscing tincidunt augue a. Tellus massaNibh id auccasator pharetra sit morbi est quis.",
      isLiked: false,
      popularity: popularity,
      uniq: uniqueness,
    );
  }
  String get dateString {
    String day =
        date.day < 10 ? "0" + date.day.toString() : date.day.toString();
    String month =
        date.month < 10 ? "0" + date.month.toString() : date.month.toString();
    return (day + "." + month + "." + date.year.toString());
  }

  RegistryItem({
    @required this.id,
    @required this.date,
    @required this.user,
    @required this.title,
    @required this.numberAccepted,
    @required this.direction,
    @required this.status,
    @required this.chatID,
    @required this.currentStateDes,
    @required this.predictedStateDes,
    @required this.ideaStateDes,
    @required this.isLiked,
    @required this.uniq,
    @required this.popularity,
  });
}

enum CurrentOrder {
  date,
  uniq,
  popularity,
  status,
}

enum Direction {
  all,
  techProcess,
  digitManagement,
  extraServices,
  cyberSecurity,
  other,
}

extension asStrDir on Direction {
  String get asString {
    switch (this) {
      case Direction.all:
        return "Всё";
      case Direction.techProcess:
        return "Управление технологическим процессом";
      case Direction.digitManagement:
        return "Цифровое управление компанией";
      case Direction.extraServices:
        return "Дополнительные сервисы";
      case Direction.cyberSecurity:
        return "Комплексная система информацйионной безопасности";
      case Direction.other:
        return "Не относится к цифровой трансформации";
      default:
        throw UnimplementedError();
    }
  }
}

enum Region {
  region1,
  region2,
  region3,
}

extension asStrReg on Region {
  String get asString {
    switch (this) {
      case Region.region1:
        return "region1";
      case Region.region2:
        return "region2";
      case Region.region3:
        return "region3";
      default:
        throw UnimplementedError();
    }
  }
}

enum Status {
  denied,
  moderation,
  revision,
  accepted,
  implantation,
}

extension asStrStat on Status {
  String get asString {
    switch (this) {
      case Status.denied:
        return "Отклонено";
      case Status.moderation:
        return "На экспертизе";
      case Status.revision:
        return "В доработке";
      case Status.accepted:
        return "Признано";
      case Status.implantation:
        return "Внедрено";
      default:
        throw UnimplementedError();
    }
  }

  Color get asColor {
    switch (this) {
      case Status.denied:
        return Colors.red;
      case Status.moderation:
        return Colors.orange;
      case Status.revision:
        return Color(0xFFF1D43D);
      case Status.accepted:
        return Color(0xFF70B64F);
      case Status.implantation:
        return Color(0xFF4E8336);
      default:
        throw UnimplementedError();
    }
  }
}
