
import 'package:flutter/material.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/suggestion_text_field.dart';
import '../../../classes/responsive_size.dart';


class StepOneTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 5.width),
          child: Text(
            "Введите наименование предложения:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
            ),
          ),
        ),
        SizedBox(
          height: 100.height,
        ),
        SuggestionTextField(
          "Краткое наименование",
          'Ввeдите сообщение...',
          1
        ),
      ],
    );
  }
}
