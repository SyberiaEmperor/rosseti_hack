import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistryItem {
  final String id;
  final String chatID;
  final String currentStateDes;
  final DateTime date;
  final String author; //TODO user
  final String title;
  final int numberAccepted;
  final Direction direction;
  final Region region;
  final Status status;
  final String predictedStateDes;
  final String ideaStateDes;
  final bool isLiked;
  final int uniq;
  final int popularity;

  factory RegistryItem.test(int status) {
    var name = "Киров И.А";
    var date = DateTime(2020);
    var title =
        "В Курске можно открыть первый Межрегиональный центр управления сетями";
    var numberAccepted = 3;
    var uniqueness = 85;
    var popularity = 50;
    Status statusType = Status.values[status % 4];
    var id = "75";
    var reg = Region.values[status % 3];
    var dir = Direction.values[status % 3 + 1];
    return RegistryItem(
      id,
      date,
      name,
      title,
      numberAccepted,
      dir,
      reg,
      statusType,
      "",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare ullamcorper augue id elit etiam dignissim suspendisse neque. Amet, vitae gravida faucibus imperdiet vel in fermentum sit. Nullam venenatis, venenatis justo, ultrices sed faucibus et duis ullamcorper. Sed tortor odio enim non etiam molestie sit at. Orci, egestas magna magnis eleifend elit. Dictum turpis mattis aenean tempus adipiscing tincidunt augue a. Tellus massaNibh id auccasator pharetra sit morbi est quis.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare ullamcorper augue id elit etiam dignissim suspendisse neque. Amet, vitae gravida faucibus imperdiet vel in fermentum sit. Nullam venenatis, venenatis justo, ultrices sed faucibus et duis ullamcorper. Sed tortor odio enim non etiam molestie sit at. Orci, egestas magna magnis eleifend elit. Dictum turpis mattis aenean tempus adipiscing tincidunt augue a. Tellus massaNibh id auccasator pharetra sit morbi est quis.",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare ullamcorper augue id elit etiam dignissim suspendisse neque. Amet, vitae gravida faucibus imperdiet vel in fermentum sit. Nullam venenatis, venenatis justo, ultrices sed faucibus et duis ullamcorper. Sed tortor odio enim non etiam molestie sit at. Orci, egestas magna magnis eleifend elit. Dictum turpis mattis aenean tempus adipiscing tincidunt augue a. Tellus massaNibh id auccasator pharetra sit morbi est quis.",
      false,
      popularity,
      uniqueness,
    );
  }
  String get dateString => (date.day.toString() +
      "." +
      date.month.toString() +
      "." +
      date.year.toString());

  RegistryItem(
    this.id,
    this.date,
    this.author,
    this.title,
    this.numberAccepted,
    this.direction,
    this.region,
    this.status,
    this.chatID,
    this.currentStateDes,
    this.predictedStateDes,
    this.ideaStateDes,
    this.isLiked,
    this.uniq,
    this.popularity,
  );
}

enum CurrentOrder {
  date,
  uniq,
  popularity,
  status,
}

enum Direction {
  all,
  direction1,
  direction2,
  direction3,
}

extension asStrDir on Direction {
  String get asString {
    switch (this) {
      case Direction.all:
        return "Всё";
      case Direction.direction1:
        return "direction1";
      case Direction.direction2:
        return "direction2";
      case Direction.direction3:
        return "direction3";
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
  moderation,
  expertise,
  accepted,
  implantation,
}

extension asStrStat on Status {
  String get asString {
    switch (this) {
      case Status.moderation:
        return "На модерации";
      case Status.expertise:
        return "На экспертизе";
      case Status.accepted:
        return "Принято";
      case Status.implantation:
        return "Идёт опытное применение";
      default:
        throw UnimplementedError();
    }
  }

  Color get asColor {
    switch (this) {
      case Status.moderation:
        return Colors.orange;
      case Status.expertise:
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
