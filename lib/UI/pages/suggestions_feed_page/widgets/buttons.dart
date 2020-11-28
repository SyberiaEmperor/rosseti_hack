import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart';
import 'package:rosseti/helpers/sortcases.dart';
import 'package:rosseti/models/registry_item.dart';
import 'package:rosseti/bloc/news_bloc/news_event.dart';

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  Direction currentItem;
  SortVar currentItem1;

  List<DropdownMenuItem<Direction>> dropDownItemsDir;
  List<DropdownMenuItem<SortVar>> dropDownItemsSort;

  @override
  void initState() {
    dropDownItemsDir = Direction.values
        .map((e) => DropdownMenuItem(value: e, child: Text(e.asString)))
        .toList();
    dropDownItemsSort = SortVar.values
        .map((e) => DropdownMenuItem(value: e, child: Text(e.asString)))
        .toList();
    currentItem = Direction.all;
    currentItem1 = SortVar.popularity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              //TODO категории
            },
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.category,
                    color: Color(0xFFBEBEBE),
                  ),
                  SizedBox(
                    width: 5.width,
                  ),
                  DropdownButton(
                    icon: Icon(
                      Icons.expand_more_rounded,
                      color: Color(0xFFBEBEBE),
                    ),
                    underline: Container(),
                    value: currentItem,
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 14.height,
                    ),
                    onChanged: (item) {
                      newsBloc.add(SelectDirection(item));
                      setState(
                        () {
                          currentItem = item;
                        },
                      );
                    },
                    items: dropDownItemsDir,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //TODO сортировка
            },
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Color(0xFFBEBEBE),
                  ),
                  SizedBox(
                    width: 5.width,
                  ),
                  DropdownButton(
                    icon: Icon(
                      Icons.expand_more_rounded,
                      color: Color(0xFFBEBEBE),
                    ),
                    underline: Container(),
                    value: currentItem1,
                    style: TextStyle(
                      color: Color(0xFFBEBEBE),
                      fontSize: 14.height,
                    ),
                    onChanged: (item) {
                      newsBloc.add(SelectSort(1, item));
                      setState(
                        () {
                          currentItem1 = item;
                        },
                      );
                    },
                    items: dropDownItemsSort,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
