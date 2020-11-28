import 'package:flutter/material.dart';
import 'package:rosseti/repos/entities/repos.dart';
import '../../../classes/responsive_size.dart';

class SuggestionTextField extends StatefulWidget {
  final String title;
  final String text;
  SuggestionTextField(
    this.title,
    this.text,
  );

  @override
  _SuggestionTextFieldState createState() => _SuggestionTextFieldState();
}

class _SuggestionTextFieldState extends State<SuggestionTextField> {
  TextEditingController _controller = TextEditingController();
  String _text;

  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          contentPadding: EdgeInsets.only(
            top: 15.height,
          ),
          content: Container(
            padding: EdgeInsets.only(
              left: 6.height,
              top: 6.height,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20.width,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            width: 320.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 10.width,
                  ),
                  width: 300.width,
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      color: Color(0xFFA3AEB2),
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: 17.height,
                    ),
                    minLines: 1,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: "Введите сообщение...",
                      hintStyle: TextStyle(
                        fontSize: 15.height,
                        color: Color(0xFFA3AEB2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Отмена'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(
                  _controller.text.toString(),
                );
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _text = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        createAlertDialog(context).then(
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
            StatementRepos.getInstance().setIncidentDescription(_text);
            print(StatementRepos.getInstance().incidentDescription);
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
              child: Text(
                  _text == widget.text
                      ? _text
                      : StatementRepos.getInstance().incidentDescription,
                  style: TextStyle(
                    color: Color(0xFFA3AEB2),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
