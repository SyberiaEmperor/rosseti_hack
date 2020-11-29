import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/suggestion_row_text_field.dart';
import 'package:rosseti/repos/entities/application_temp_repository.dart';

class StepEightDeadline extends StatefulWidget {
  @override
  _StepEightDeadlineState createState() => _StepEightDeadlineState();
}

class _StepEightDeadlineState extends State<StepEightDeadline> {
   List<SuggestionRowTextField> _items = [];
    var repos = ApplicationTempRepository();
  
   Widget buildListOfFiles() {
    return Container(
      width: 400.width,
      constraints: BoxConstraints(
        maxHeight: 220.height,
        minHeight: 0.height,
      ),
      child: ListView.separated(
        // shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _items[index];
        },
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 12.height,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    if (repos.stages.isEmpty)
      _items.add(SuggestionRowTextField(
          leftText: "Введите текст...",
          leftTitle: "Название этапа",
          rightText: "Введите длительность...",
          rightTitle: "Срок, дней",
          step: 8,
        ));
    else {
      repos.stages.forEach((element) {
        _items.add(SuggestionRowTextField(
          leftText: element.number,
          leftTitle: "Название этапа",
          rightText: element.term.toString(),
          rightTitle: "Срок, дней",
          step: 7,
        ));
      });
    }
    super.initState();
  }

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
        buildListOfFiles(),
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
              _items.add( SuggestionRowTextField(
          leftText: "Введите текст...",
          leftTitle: "Название этапа",
          rightText: "Введите длительность...",
          rightTitle: "Срок, дней",
          step: 8,
        ));
            setState(() {});
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
