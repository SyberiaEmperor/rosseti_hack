import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class StepSixUniqueness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var text =
        "Отлично! Таких предложений ещё нет в реестре. Можно продолжить заполнение, осталось совсем немного";
    var color = Color(0xFFA9D702);
    var uniqueness = 95; //TODO все отображать в зависимости от уникальности
    return Column(
      children: [
        Container(
          height: 50.height,
          padding: EdgeInsets.symmetric(
            horizontal: 30.width,
          ),
          child: Text(
            "Уникальность вашего предложения:",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
            ),
          ),
        ),
        Text(
          "$uniqueness%",
          style: TextStyle(
            color: color,
            fontSize: 64.height,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 43.height,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.width,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
              color: Color(0xFFA3AEB2),
            ),
          ),
        ),
      ],
    );
  }
}
