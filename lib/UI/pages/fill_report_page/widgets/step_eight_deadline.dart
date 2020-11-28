import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_report_page/widgets/suggestion_row_text_field.dart';

class StepEightDeadline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72.height,
          padding: EdgeInsets.symmetric(
            horizontal: 22.width,
          ),
          child: Text(
            "Опишите требуемые сроки на внедрение",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
            ),
          ),
        ),
        SizedBox(
          height: 41.height,
        ),
        SuggestionRowTextField(
          leftText: "Введите текст...",
          leftTitle: "Название этапа",
          rightText: "Введите длительность...",
          rightTitle: "Срок, дней",
        ),
        SizedBox(
          height: 21.height,
        ),
        RaisedButton.icon(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFFD3DADD),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            onPressed: () {
              //TODO добавить этап
            },
            icon: Icon(
              Icons.add,
              color: Color(0xFFD3DADD),
            ),
            label: Text(
              "Добавить этап",
              style: TextStyle(
                color: Color(0xFFD3DADD),
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontSize: 17.height,
              ),
            ),
          )
      ],
    );
  }
}
