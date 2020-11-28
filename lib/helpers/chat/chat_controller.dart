import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:rosseti/helpers/chat/web_soket_repack.dart';
import 'package:rosseti/models/message.dart';
import '../requests/requests.dart' as requests;

class ChatController {
  ActionCable _cable;
  final int id;
  bool historyLoad = false; // индикатор загрузки истории
  bool lostConnection = false;
  final String _room = "RoomChannel";
  final String wsUrl = "ws://178.154.255.209:3333/cable";
  int pageIndex = 1;
  bool reSub = false;

  final void Function(Map<dynamic, dynamic> message) onMessage;
  final void Function() onSubscribed;
  final void Function(String message) showConnectionStatus;

  Stream<DataConnectionStatus> stream = DataConnectionChecker().onStatusChange;
  StreamSubscription<DataConnectionStatus> listener;

  States state = States.disconnected;

  bool canLoadMessages = true;

  ChatController(this.id,
      {@required this.onMessage,
      @required this.onSubscribed,
      @required this.showConnectionStatus}) {
    subscribe();
  }

  void subscribe() {
    _cable =
        ActionCable.connect("$wsUrl?token=${requests.token}", onConnected: () {
      state = States.connected;
      _cable.subscribe(
        _room,
        channelParams: {
          "chat_id": id,
        },
        onSubscribed: () {
          state = States.connected;
          if (!reSub) {
            onSubscribed();
          }
        },
        onMessage: onMessage,
      );
    }, onConnectionLost: () {
      state = States.connected;
      lostConnection = true;
    }, onCannotConnect: () {
      state = States.cantconnect;
      lostConnection = true;
    });
    listener = stream.listen(((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print("INTERNET");
          if (lostConnection) {
            _resubscribe();
          }
          break;
        case DataConnectionStatus.disconnected:
          print("NO INTERNET");
          lostConnection = true;
          break;
      }
    }));
  }

  void sendMessage({String text, Uint8List img}) {
    assert((text != null || img != null) &&
        (text == null || img == null)); // boolean XOR
    if (state != States.connected) {
      showConnectionStatus("Нет подключения к сети");
      return;
    }
    if (text != null) {
      _sendText(text);
    }
    if (img != null) {
      _sendImage(img);
    }
  }

  void _sendText(String text) {
    {
      _cable.performAction(_room, action: "receive", channelParams: {
        "chat_id": id,
      }, actionParams: {
        "message": text,
        "type_message": TypeMessage.text.index,
      });
    }
  }

  Future<List<Message>> loadMessages() async {
    List<Message> result = await requests.getHistory(id: id, page: pageIndex++);
    canLoadMessages = (result.isNotEmpty);
    return result;
  }

  void _sendImage(Uint8List img) {
    _cable.performAction(_room, action: "receive", channelParams: {
      "chat_id": id,
    }, actionParams: {
      "picture": "data:image/jpeg;base64," + base64Encode(img),
      "type_message": TypeMessage.picture.index,
    });
  }

  void _resubscribe() {
    reSub = true;
    _cable.disconnect();
    subscribe();
  }

  void dispose() {
    _unsubscribe();
    listener.cancel();
    _cable.disconnect();
  }

  void _unsubscribe() {
    _cable.unsubscribe(
      _room,
      channelParams: {
        "chat_id": id,
      },
    );
  }
}

// Состояния подключения к чату
enum States {
  connected,
  disconnected,
  cantconnect,
}
