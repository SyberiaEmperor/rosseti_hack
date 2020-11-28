import 'package:flutter/material.dart';

/// Класс сообщения
class Message {
  final DateTime time; // время отправки
  final int senderId; // отправитель {"User", "Superuser", "System"}
  final TypeMessage type; // тип сообщения {0:Сообщение, 1:Картинка,}
  final String content; // содержимое сообщения

  Message._({
    @required this.time,
    @required this.senderId,
    @required this.type,
    @required this.content,
  });
  factory Message.fromJson(Map<String, dynamic> data) {
    DateTime time = DateTime.now();
    if (data['created_at'] != null)
      time = DateTime.parse(
          data['created_at'].toString().replaceAll("+03:00", ""));
    int senderId = data['sender_id'];
    TypeMessage type = TypeMessage.values[data['type_message']];
    String content;
    if (type == TypeMessage.picture) {
      //content = "http://${Requests.IP}" + data['picture']['url'];
    } else {
      content = data['content'] ?? data['message'];
    }
    return Message._(
        content: content, senderId: senderId, time: time, type: type);
  }

  factory Message.test(int id) {
    DateTime time = DateTime.now();
    TypeMessage type = TypeMessage.text;
    String content =
        "Тестовое сообщение, сообщение с тестом, тестируем тесты для длинного сообщения, вау, круто, а теперь переход\nОПА!\n\nДВА ПОДРЯД";
    return Message._(content: content, senderId: id, type: type, time: time);
  }

  void printMessage() {
    print('time is $time');
    print('sender is $senderId');
    print('type is $type');
  }
}

enum TypeMessage { text, picture }
