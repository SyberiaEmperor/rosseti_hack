import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class AppbarChat extends StatelessWidget {
  final String topicName;
  const AppbarChat(this.topicName, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ResponsiveSize.width(7),
        right: ResponsiveSize.width(27),
        bottom: ResponsiveSize.height(15),
        top: ResponsiveSize.height(15),
      ),
      child: Row(
        children: [
          PopBackButton(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0.width),
              child: Text(
                "Обсуждение: $topicName",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                  color: Theme.of(context).textTheme.bodyText1.color,
                  fontSize: ResponsiveSize.height(21),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 40.height,
        width: 40.height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xFFD3DADD),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Icon(
          Icons.keyboard_arrow_left,
          size: 24.height,
        ),
      ),
    );
  }
}
