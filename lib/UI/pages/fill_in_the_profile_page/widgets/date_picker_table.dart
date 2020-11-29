import 'package:flutter/material.dart';

import 'package:rosseti/UI/classes/responsive_size.dart';

class DatePickerTable extends StatefulWidget {
  final DateTime dateTime;
  final Function(DateTime) onChanged;
  final String text;

  const DatePickerTable(
      {Key key, this.dateTime, this.onChanged, this.text = ''})
      : super(key: key);
  @override
  _DatePickerTableState createState() => _DatePickerTableState();
}

class _DatePickerTableState extends State<DatePickerTable> {
  DateTime _dateTime;
  bool isNull;

  @override
  void initState() {
    isNull = widget.dateTime == null;
    _dateTime = widget.dateTime ?? DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.width,
            ),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.height,
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: 10.height,
          ),
          Text(
            isNull
                ? 'Дата не выбрана'
                : '${_dateTime.day}.${_dateTime.month}.${_dateTime.year} ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10.height,
          ),
          Container(
            height: 20.height,
            child: GestureDetector(
              child: Icon(Icons.calendar_today),
              onTap: () async {
                final value = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1930),
                  lastDate: DateTime.now(),
                );
                setState(() {
                  _dateTime = value ?? DateTime.now();
                  isNull = (value == null);
                  widget.onChanged(value);
                });
                // DatePicker.showDateTimePicker(
                //   context,
                //   locale: LocaleType.ru,
                //   currentTime: DateTime.now(),
                // ).then((value) {
                //   if (value != null) {
                //     setState(() {
                //       widget.onChanged(value);
                //     });
                //   }
                // });
              },
            ),
          ),
        ],
      ),
    );
  }
}
