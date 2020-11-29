import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class SuggestionAttachment extends StatelessWidget {
  final String title;
  final String type;
  final Function action; 
  SuggestionAttachment({
    @required this.action,
    @required this.title,
    @required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: EdgeInsets.only(
          left: 6.height,
          top: 6.height,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20.width,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              spreadRadius: 2,
              color: Colors.black26,
            ),
          ],
        ),
        width: 320.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(
                color: Color(0xFFA3AEB2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.height,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
