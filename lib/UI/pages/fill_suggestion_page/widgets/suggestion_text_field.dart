import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/repos/entities/application_temp_repository.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';
import '../../../classes/responsive_size.dart';
import 'alert_dialog.dart';

// ignore: must_be_immutable
class SuggestionTextField extends StatefulWidget {
  final String title;
  final String text;
  final int step;
  SuggestionTextField(this.title, this.text, this.step);

  @override
  _SuggestionTextFieldState createState() => _SuggestionTextFieldState();
}

class _SuggestionTextFieldState extends State<SuggestionTextField> {
  TextEditingController controller = TextEditingController();
  String _text;
  

  @override
  void initState() {
    final repos = ApplicationTempRepository();
    switch (widget.step) {
      case 1:
        _text = repos.title;
        break;
      case 3:
        _text = repos.problem;
        break;
      case 4:
        _text = repos.decision;
        break;
      case 5:
        _text = repos.impact;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ProfileRepository profileRep =
        RepositoryProvider.of<ProfileRepository>(context);
    return GestureDetector(
      onTap: () {
        createAlertDialog(controller, context, widget.title).then(
          (value) {
            if (value != null && value.trim().length == 0) {
              setState(() {
                _text = widget.text;
              });
            }
            if (value != null && value.trim().length != 0) {
              setState(() {
                _text = value;
              });
            }
            var repos = MyApp.makeStatementsBloc.repos;
            switch (widget.step) {
              case 1:
                repos.title = value;
                repos.mainAuthor = profileRep.currentData.surname + ' ' + profileRep.currentData.name + ' ' + profileRep.currentData.secondName;
                break;
              case 3:
                repos.mainAuthor = profileRep.currentData.surname + ' ' + profileRep.currentData.name + ' ' + profileRep.currentData.secondName;
                repos.problem = value;
                break;
              case 4:
                repos.mainAuthor = profileRep.currentData.surname + ' ' + profileRep.currentData.name + ' ' + profileRep.currentData.secondName;
                repos.decision = value;
                break;
              case 5:
                repos.mainAuthor = profileRep.currentData.surname + ' ' + profileRep.currentData.name + ' ' + profileRep.currentData.secondName;
                repos.impact = value;
                break;
            }
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 6.height,
          top: 6.height,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 20.width,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Color(0xFFA3AEB2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(_text,
                  style: TextStyle(
                    color: _text == widget.text
                        ? Color(0xFFA3AEB2)
                        : Colors.black87,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
