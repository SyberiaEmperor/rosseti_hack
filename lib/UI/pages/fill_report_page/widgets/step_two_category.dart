import 'package:flutter/material.dart';

import '../../../classes/responsive_size.dart';

class StepTwoCategory extends StatefulWidget {
  @override
  _StepTwoCategoryState createState() => _StepTwoCategoryState();
}

class _StepTwoCategoryState extends State<StepTwoCategory> {
  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  bool fourthValue = false;
  bool fifthValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.width,
          ),
          child: Text(
            "Выберите категорию предложения: ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
              color: Theme.of(context).textTheme.bodyText1.color,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
            ),
          ),
        ),
        SizedBox(
          height: 50.height,
        ),
        CheckboxListTile(
          activeColor: Color(0xFFC4C4C4),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Управление технологическим процессом. Цифровая сеть",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.height,
            ),
          ),
          value: firstValue,
          onChanged: (value){
            setState(() {
              firstValue = value;
            });
          },
        ),
        CheckboxListTile(
          activeColor: Color(0xFFC4C4C4),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Цифровое управление компанией",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.height,
            ),
          ),
          value: secondValue,
          onChanged: (value){
            setState(() {
              secondValue = value;
            });
          },
        ),
        CheckboxListTile(
          activeColor: Color(0xFFC4C4C4),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Дополнительные сервисы",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.height,
            ),
          ),
          value: thirdValue,
          onChanged: (value){
            setState(() {
              thirdValue = value;
            });
          },
        ),
        CheckboxListTile(
          activeColor: Color(0xFFC4C4C4),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Комплексная система информационной безопасности",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.height,
            ),
          ),
          value: fourthValue,
          onChanged: (value){
            setState(() {
              fourthValue = value;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Color(0xFFC4C4C4),
          title: Text(
            "Не относится к цифровой трансформации",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.height,
            ),
          ),
          value: fifthValue,
          onChanged: (value){
            setState(() {
              fifthValue = value;
            });
          },
        ),
      ],
    );
  }
}
