import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/models/message.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

// ignore: must_be_immutable
class ChatMessage extends StatelessWidget {
  final Message message;
  final bool date;
  final DateTime timeOfMessage;
  final int userID;
  final int chatID;
  ChatMessage(
      {@required this.message,
      this.date = false,
      @required this.chatID,
      @required this.userID})
      : this.timeOfMessage = message.time;

  @override
  Widget build(BuildContext context) {
    var minutes = message.time.minute;
    var displayedMinutes = minutes >= 0 && minutes <= 9
        ? "0" + minutes.toString()
        : minutes.toString();
    var hours = message.time.hour;
    var displayedHours =
        hours >= 0 && hours <= 9 ? "0" + hours.toString() : hours.toString();
    var time = displayedHours + ":" + displayedMinutes;

    Widget _getTime({bool flag = false}) {
      return Text(
        time,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: ResponsiveSize.height(10),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w500,
          color:
              flag ? Colors.white : Theme.of(context).textTheme.bodyText2.color,
        ),
      );
    }

    Widget buildTextOrderMessage() {
      return Container(
        padding: EdgeInsets.only(
          right: ResponsiveSize.width(6),
          left: ResponsiveSize.width(9),
          top: ResponsiveSize.height(4),
          bottom: ResponsiveSize.height(5),
        ),
        constraints: BoxConstraints(
          maxWidth: ResponsiveSize.width(275),
        ),
        decoration: BoxDecoration(
          color: message.type == TypeMessage.text
              ? Theme.of(context).cardColor
              : Colors.blue,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(
                  3, 141, 251, message.senderId == userID ? 0.5 : 0.25),
              offset: Offset(0.0, 2.0),
              blurRadius: 3,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.senderId != userID)
              Padding(
                padding: EdgeInsets.only(bottom: 6.0.width, top: 3.0.width),
                child: Text(
                  message.senderName,
                  style: TextStyle(color: Color(0xFFBEBEBE), fontSize: 14),
                ),
              ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveSize.width(219),
                  ),
                  child: Linkify(
                    onOpen: (link) => Launcher.launch(link.url),
                    text: message.content,
                    options: LinkifyOptions(humanize: false),
                    style: TextStyle(
                      fontSize: ResponsiveSize.height(18),
                      color: Theme.of(context).textTheme.bodyText1.color,
                    ),
                  ),
                ),
                SizedBox(
                  width: ResponsiveSize.width(5),
                ),
                message.type == TypeMessage.text
                    ? _getTime()
                    : _getTime(flag: true),
              ],
            ),
          ],
        ),
      );
    }

    Widget getPictureMessage() {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Hero(
                  tag: message.content + message.time.toString(),
                  child: Card(
                    child: Image.network(
                      message.content,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Hero(
              tag: (message.content ?? " ") + message.time.toString(),
              child: Container(
                height: ResponsiveSize.height(210),
                width: ResponsiveSize.width(265),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ResizeImage(
                      NetworkImage(message.content),
                      width: ResponsiveSize.width(400).round(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: ResponsiveSize.height(2),
              ),
              margin: EdgeInsets.only(
                right: ResponsiveSize.width(10),
                bottom: ResponsiveSize.height(10),
              ),
              width: ResponsiveSize.width(40),
              height: ResponsiveSize.height(20),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(5),
              ),
              child: _getTime(flag: true),
            ),
          ],
        ),
      );
    }

    Widget getTypedMessage({@required TypeMessage type}) {
      if (type == TypeMessage.text) {
        return buildTextOrderMessage();
      } else {
        return getPictureMessage();
      }
    }

    String _getMonth() {
      switch (message.time.month) {
        case 1:
          return 'Января';
          break;
        case 2:
          return 'Февраля';
          break;
        case 3:
          return 'Марта';
          break;
        case 4:
          return 'Апреля';
          break;
        case 5:
          return 'Мая';
          break;
        case 6:
          return 'Июня';
          break;
        case 7:
          return 'Июля';
          break;
        case 8:
          return 'Августа';
          break;
        case 9:
          return 'Сентября';
          break;
        case 10:
          return 'Октября';
          break;
        case 11:
          return 'Ноября';
          break;
        default:
          return 'Декабря';
      }
    }

    Widget messageWidget() => GestureDetector(
          onTap: () async {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: message.senderId != userID
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: ResponsiveSize.height(10),
                  right:
                      message.senderId == userID ? ResponsiveSize.width(15) : 0,
                  left:
                      message.senderId != userID ? ResponsiveSize.width(5) : 0,
                ),
                child: getTypedMessage(type: message.type),
              ),
            ],
          ),
        );

    if (!date) {
      return messageWidget();
    } else {
      return Column(
        children: [
          Text(
            message.time.day.toString() + " " + _getMonth(),
            style: TextStyle(
              fontSize: ResponsiveSize.height(12),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyText2.color,
            ),
          ),
          messageWidget(),
        ],
      );
    }
  }
}
