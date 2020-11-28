import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class SuggestionRowTextField extends StatefulWidget {
  final String leftTitle;
  final String leftText;
  final String rightTitle;
  final String rightText;

  SuggestionRowTextField({
    @required this.leftText,
    @required this.rightTitle,
    @required this.leftTitle,
    @required this.rightText,
  });
  @override
  _SuggestionRowTextFieldState createState() => _SuggestionRowTextFieldState();
}

class _SuggestionRowTextFieldState extends State<SuggestionRowTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 20.width,
        ),
      padding: EdgeInsets.only(
        left: 10.height,
        top: 6.height,
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
      child: Row(
        children: [
          Container(
            width: 150.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.leftTitle,
                  style: TextStyle(
                    color: Color(0xFFA3AEB2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.height,
                  ),
                  child: Text(
                    widget.leftText,
                    style: TextStyle(
                      color: Color(0xFFA3AEB2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 160.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.rightTitle,
                  style: TextStyle(
                    color: Color(0xFFA3AEB2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 14.height,
                  ),
                  child: Text(
                    widget.rightText,
                    style: TextStyle(
                      color: Color(0xFFA3AEB2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
