import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 35.width,
      ),
      margin: EdgeInsets.only(
        bottom: 5.height,
      ),
      color: Colors.white,
      alignment: Alignment.center,
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Color(0xFFBEBEBE),
          ),
          border: InputBorder.none,
          hintText: "Поиск",
          hintStyle: TextStyle(
            color: Color(0xFFBEBEBE),
          ),
        ),
      ),
    );
  }
}
