import 'package:flutter/cupertino.dart';

@immutable
class Profile {
  final int id;
  final String name;
  final String surname;
  final String secondName;
  final String phone;
  final String email;
  final String education;
  final String unit;
  final DateTime startWorking;
  final String post;
  final DateTime birthday;
  final double rating;
  final bool verify;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int messagesCount;
  final int approvedSuggestions;

  Profile(
      {this.id,
      this.name,
      this.surname,
      this.secondName,
      this.phone,
      this.email,
      this.education,
      this.unit,
      this.startWorking,
      this.birthday,
      this.rating,
      this.verify,
      this.createdAt,
      this.updatedAt,
      this.post,
      this.messagesCount,
      this.approvedSuggestions});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json["id"],
        name: json["name"] ?? "",
        surname: json["surname"] ?? "",
        rating: json["rating"],
        unit: json["unit"] ?? "",
        email: json["email"],
        verify: json["verify"],
        createdAt:json["created_at"]==null? null: DateTime.parse(json["created_at"]),
        updatedAt:json["updated_at"]==null? null:DateTime.parse( json["updated_at"]),
        startWorking:json["start_working"]==null? null: DateTime.parse(json["start_working"]),
        birthday:json["birthday"]==null? null:DateTime.parse( json["birthday"]),
        education: json["education"] ?? "",
        post: json["post"] ?? "",
        messagesCount: json["count_messages"],
        approvedSuggestions: json["count_approved"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "surname": surname,
      "rating": rating,
      "unit": unit,
      "email": email,
      "verify": verify,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "start_working": startWorking,
      "birthday": birthday,
      "education": education,
      "post": post,
      "count_messages": messagesCount,
      "count_approved": approvedSuggestions,
    };
  }
}
