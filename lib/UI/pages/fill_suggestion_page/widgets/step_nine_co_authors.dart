import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/suggestion_row_text_field.dart';
import 'package:rosseti/models/author.dart';
import 'package:rosseti/repos/entities/application_temp_repository.dart';

class StepNineCoAuthors extends StatefulWidget {
  @override
  _StepNineCoAuthorsState createState() => _StepNineCoAuthorsState();
}

class _StepNineCoAuthorsState extends State<StepNineCoAuthors> {
  var repos = ApplicationTempRepository();
  List<Author> otherAuthors = [];
  List<SuggestionRowTextField> _items = [];

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
    repos.otherAuthors = [];
    if (repos.otherAuthors.isEmpty)
      _items.add(SuggestionRowTextField(
      leftText: "Введите текст...",
      leftTitle: "Ф.И.О",
      rightText: "Введите процент...",
      rightTitle: "% вознаграждения",
      step: 9,
    ));
    else {
      repos.otherAuthors.forEach((element) {
        _items.add(SuggestionRowTextField(
          leftText: "element.full_name",
          leftTitle: "Ф.И.О",
          rightText: element.rewardPercent.toString(),
          rightTitle: "% вознаграждения",
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
            "Добавьте соавторов, если это необходимо",
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
            _items.add(SuggestionRowTextField(
              leftText: "Введите текст...",
              leftTitle: "Ф.И.О",
              rightText: "Введите процент...",
              rightTitle: "% вознаграждения",
              step: 9
            ));
            setState(() {});
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
