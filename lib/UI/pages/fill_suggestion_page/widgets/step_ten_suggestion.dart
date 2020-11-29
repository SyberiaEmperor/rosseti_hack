import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/repos/entities/application_temp_repository.dart';

class StepTenSuggestion extends StatefulWidget {
  @override
  _StepTenSuggestionState createState() => _StepTenSuggestionState();
}

class _StepTenSuggestionState extends State<StepTenSuggestion> {
  bool yesValue;
  bool noValue;
  var repos = ApplicationTempRepository();
  @override
  void initState() {
    yesValue = repos.economy;
    noValue = !yesValue;
    super.initState();
  }

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
            "Данное рационализаторское предложение создает экономию?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.height,
            ),
          ),
        ),
        SizedBox(
          height: 41.height,
        ),
        CheckboxListTile(
          activeColor: Color(0xFFC4C4C4),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            "Создает экономию",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.height,
            ),
          ),
          value: yesValue,
          onChanged: (value) {
            setState(() {
              MyApp.makeStatementsBloc.repos.economy = value;
              yesValue = value;
              noValue = !noValue;
            });
          },
        ),
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Color(0xFFC4C4C4),
          title: Text(
            "Не создает экономию",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.height,
            ),
          ),
          value: noValue,
          onChanged: (value) {
            setState(() {
              noValue = value;
              yesValue = !yesValue;
            });
          },
        ),
      ],
    );
  }
}
