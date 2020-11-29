import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/fill_suggestion_page/widgets/alert_dialog.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/models/author.dart';
import 'package:rosseti/models/expense.dart';
import 'package:rosseti/models/stage.dart';

// ignore: must_be_immutable
class SuggestionRowTextField extends StatefulWidget {
  final String leftTitle;
  String leftText;
  final String rightTitle;
  String rightText;
  final int step;

  SuggestionRowTextField({
    @required this.leftText,
    @required this.rightTitle,
    @required this.leftTitle,
    @required this.rightText,
    @required this.step,
  });
  @override
  _SuggestionRowTextFieldState createState() => _SuggestionRowTextFieldState();
}

class _SuggestionRowTextFieldState extends State<SuggestionRowTextField> {
   var repos = MyApp.makeStatementsBloc.repos;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    return GestureDetector(
        onTap: () async {
          await createAlertDialog(controller1, context, widget.leftTitle).then(
            (value) {
              if (value != null) {
                widget.leftText = value;
              }

              /* StatementRepos.getInstance().setIncidentDescription(_text);
            print(StatementRepos.getInstance().incidentDescription);*/
            },
          );
          createAlertDialog(controller2, context, widget.rightTitle, flag: true).then(
              (value) {
            if (value != null) {
              widget.rightText = value;
              switch (widget.step) {
                case 7:
                  repos.expenses.add(
                      Expense(widget.leftText, int.parse(widget.rightText)));
                  break;
                case 8:
                  repos.stages
                      .add(Stage(widget.leftText, int.parse(widget.rightText)));
                  break;
                case 9:
                 repos.otherAuthors.add(
                      Author(widget.leftText, double.parse(widget.rightText)));
                  break;
              }
              setState(() {});
            }
          }
              /* StatementRepos.getInstance().setIncidentDescription(_text);
            print(StatementRepos.getInstance().incidentDescription);*/
              );
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.width,
          ),
          padding: EdgeInsets.only(
            left: 10.height,
            top: 6.height,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 10,
                spreadRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
          width: 320.width,
          child: Row(
            children: [
              Container(
                width: 150.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.leftTitle,
                      style: TextStyle(
                        color: Color(0xFFA3AEB2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.height,
                      ),
                      child: Text(
                        widget.leftText,
                        style: TextStyle(
                          color: Color(0xFFA3AEB2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 160.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.rightTitle,
                      style: TextStyle(
                        color: Color(0xFFA3AEB2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.height,
                      ),
                      child: Text(
                        widget.rightText,
                        style: TextStyle(
                          color: Color(0xFFA3AEB2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
