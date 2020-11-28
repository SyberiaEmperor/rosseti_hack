import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class StepTenSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72.height,
          padding: EdgeInsets.symmetric(
            horizontal: 15.width,
          ),
          child: Text(
            "Данное рационализаторское предложение:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
            ),
          ),
        ),
      ],
    );
  }
}
