import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class DocumentItem extends StatelessWidget {
  final String title;

  DocumentItem(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50.height,
      margin: EdgeInsets.only(
        top: 5.height,
      ),
      padding: EdgeInsets.only(
        left: 15.width,
        top: 10.height,
        bottom: 10.height,
      ),
      color: Colors.white,
      child: GestureDetector(
        onTap: (){

        },
        child: Text(
          title,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 16.height,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
