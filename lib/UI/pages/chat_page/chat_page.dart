import 'package:flutter/material.dart';
import 'package:rosseti/UI/pages/chat_page/widgets/appbar_chat.dart';
import 'package:rosseti/UI/pages/chat_page/widgets/list_of_messages_and_navbar_chat.dart';

class Chat extends StatelessWidget {
  //final User user;
  final int id;

  const Chat(/*this.user,*/ this.id, {Key key}) : super(key: key);
  //TODO: Сделать что-нибудь с ним
  void showConnectionsStatus(BuildContext context, String content) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: "Hide",
          onPressed: () => Scaffold.of(context).removeCurrentSnackBar(),
        ),
        duration: Duration(seconds: 2),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(content),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              AppbarChat("Topic name name name name"),
              Expanded(
                child: ListOfMessagesAndNavbarChat(
                    id, 1, /* user,*/ showConnectionsStatus),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
