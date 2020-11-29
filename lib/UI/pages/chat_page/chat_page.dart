import 'package:flutter/material.dart';
import 'package:rosseti/UI/pages/chat_page/widgets/appbar_chat.dart';
import 'package:rosseti/UI/pages/chat_page/widgets/list_of_messages_and_navbar_chat.dart';
import 'package:rosseti/models/profile.dart';

class Chat extends StatelessWidget {
  final Profile profile;
  final int id;
  final String topicName;

  const Chat(this.profile, this.id, this.topicName, {Key key})
      : super(key: key);
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
              AppbarChat(topicName),
              Expanded(
                child: ListOfMessagesAndNavbarChat(
                    id, profile, showConnectionsStatus),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
