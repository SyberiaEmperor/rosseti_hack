import '../UI/classes/responsive_size.dart';
import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget {
  final String text;
  CustomAppbar(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80.height,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).textTheme.bodyText1.color,
          fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
          fontSize: 18.height
        ),
      ),
    );
  }
}