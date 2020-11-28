import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_report_page/widgets/suggestion_text_field.dart';

class StepFivePrediction extends StatelessWidget {
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
            "Опишите ожидаемый положительный эффект:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
            ),
          ),
        ),
        SizedBox(
          height: 41.height,
        ),
        SuggestionTextField(
          "Описание",
          'Ввeдите сообщение...',
        ),
        SizedBox(
          height: 41.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.width,
          ),
          child: Text(
            "Подсказка: Укажите информацию об ожидаемом техническом, организационном, управленческом или ином положительном эффекте от использования",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.height,
              color: Color(0xFFA3AEB2),
            ),
          ),
        ),
      ],
    );
  }
}
