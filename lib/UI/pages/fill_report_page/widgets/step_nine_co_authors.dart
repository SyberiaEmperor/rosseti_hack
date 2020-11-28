import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_report_page/widgets/suggestion_row_text_field.dart';

class StepNineCoAuthors extends StatelessWidget {
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
            "Добавьте соавторов, если это необходимо",
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
          leftTitle: "Ф.И.О",
          rightText: "Введите процент...",
          rightTitle: "% вознаграждения",
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
              "Добавить автора",
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
