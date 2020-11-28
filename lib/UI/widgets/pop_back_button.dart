import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

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
          border: Border.all(
            color: Color(0xFFD3DADD),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.keyboard_arrow_left),
      ),
    );
  }
}
