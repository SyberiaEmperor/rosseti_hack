import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/suggestion_text_field.dart';

class StepThreeCurrentState extends StatelessWidget {
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
            "Опишите текущее положение с указанием существующих недостатков:",
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
          3
        ),
        SizedBox(
          height: 41.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.width,
          ),
          child: Text(
            "Подсказка: Характеристика проблемы, которую решает рационализаторское предложение, должна описывать недостатки действующей конструкции изделия, технологии производства, применяемой техники или состава материала",
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
