import 'package:flutter/material.dart';
import 'package:rosseti/main.dart';

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
  var repos = MyApp.makeStatementsBloc.repos;

  @override
  void initState() {
    if (repos.category == 'Управление технологическим процессом. Цифровая сеть')
      firstValue = true;
    if (repos.category == 'Цифровое управление компанией')
      secondValue = true;
    if (repos.category == 'Дополнительные сервисы')
      thirdValue = true;
    if (repos.category == 'Комплексная система информационной безопасности')
      fourthValue = true;
    if (repos.category == 'Не относится к цифровой трансформации')
      fifthValue = true;
    super.initState();
  }

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
        Container(
          height: 45.height,
          child: CheckboxListTile(
              activeColor: Color(0xFFC4C4C4),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                "Управление технологическим процессом. Цифровая сеть",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.height,
                ),
              ),
              value: firstValue,
              onChanged: (value) {
                if (value) {
                  repos.category =
                      "Управление технологическим процессом. Цифровая сеть";
                  if (secondValue) {
                    secondValue = false;
                  }
                  if (thirdValue) {
                    thirdValue = false;
                  }
                  if (fourthValue) {
                    fourthValue = false;
                  }
                  if (fifthValue) {
                    fifthValue = false;
                  }
                }
                setState(() {
                  firstValue = value;
                });
              }),
        ),
        Container(
          height: 45.height,
          child: CheckboxListTile(
            activeColor: Color(0xFFC4C4C4),
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "Цифровое управление компанией",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.height,
              ),
            ),
            value: secondValue,
            onChanged: (value) {
              if (value) {
                if (firstValue) {
                  firstValue = false;
                }
                if (thirdValue) {
                  thirdValue = false;
                }
                if (fourthValue) {
                  fourthValue = false;
                }
                if (fifthValue) {
                  fifthValue = false;
                }
                repos.category = "Цифровое управление компанией";
              }
              setState(() {
                secondValue = value;
              });
            },
          ),
        ),
        Container(
          height: 45.height,
          child: CheckboxListTile(
            activeColor: Color(0xFFC4C4C4),
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "Дополнительные сервисы",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.height,
              ),
            ),
            value: thirdValue,
            onChanged: (value) {
              if (value) {
                if (firstValue) {
                  firstValue = false;
                }
                if (secondValue) {
                  secondValue = false;
                }
                if (fourthValue) {
                  fourthValue = false;
                }
                if (fifthValue) {
                  fifthValue = false;
                }
                repos.category = "Дополнительные сервисы";
              }
              setState(() {
                thirdValue = value;
              });
            },
          ),
        ),
        Container(
          height: 45.height,
          child: CheckboxListTile(
            activeColor: Color(0xFFC4C4C4),
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "Комплексная система информационной безопасности",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.height,
              ),
            ),
            value: fourthValue,
            onChanged: (value) {
              if (value) {
                if (firstValue) {
                  firstValue = false;
                }
                if (thirdValue) {
                  thirdValue = false;
                }
                if (secondValue) {
                  secondValue = false;
                }
                if (fifthValue) {
                  fifthValue = false;
                }
                repos.category =
                    "Комплексная система информационной безопасности";
              }
              setState(() {
                fourthValue = value;
              });
            },
          ),
        ),
        Container(
          height: 45.height,
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Color(0xFFC4C4C4),
            title: Text(
              "Не относится к цифровой трансформации",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13.height,
              ),
            ),
            value: fifthValue,
            onChanged: (value) {
              if (value) {
                if (firstValue) {
                  firstValue = false;
                }
                if (thirdValue) {
                  thirdValue = false;
                }
                if (fourthValue) {
                  fourthValue = false;
                }
                if (secondValue) {
                  secondValue = false;
                }
                repos.category = "Не относится к цифровой трансформации";
              }
              setState(() {
                fifthValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
