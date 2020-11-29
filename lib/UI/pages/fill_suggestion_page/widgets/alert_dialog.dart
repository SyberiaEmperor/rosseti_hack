import 'package:flutter/material.dart';
import '../../../classes/responsive_size.dart';

Future<String> createAlertDialog(
    TextEditingController controller, BuildContext context, String title,
    {bool flag = false}) {
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
                title,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 10.width,
                ),
                width: 300.width,
                child: TextField(
                  keyboardType:
                      flag ? TextInputType.number : TextInputType.text,
                  controller: controller,
                  style: TextStyle(
                    color: Colors.black87,
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
                controller.text.toString(),
              );
            },
            child: Text('Сохранить'),
          ),
        ],
      );
    },
  );
}
