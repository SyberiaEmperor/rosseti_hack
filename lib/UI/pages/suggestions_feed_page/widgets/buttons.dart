import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart';
import 'package:rosseti/helpers/sortcases.dart';
import 'package:rosseti/models/registry_item.dart';
import 'package:rosseti/bloc/news_bloc/news_event.dart';
import 'dart:math' as math;

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> with SingleTickerProviderStateMixin {
  Direction direction;
  SortVar sortVar;

  List<DropdownMenuItem<Direction>> dropDownItemsDir;
  List<DropdownMenuItem<SortVar>> dropDownItemsSort;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      upperBound: 0.5,
    );
    dropDownItemsDir = Direction.values
        .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.asString.length < 15
                  ? e.asString
                  : "${e.asString.substring(0, 14)}...",
              overflow: TextOverflow.fade,
            )))
        .toList();
    dropDownItemsSort = SortVar.values
        .map((e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.asString.length < 30
                  ? e.asString
                  : "${e.asString.substring(0, 27)}...",
              overflow: TextOverflow.fade,
            )))
        .toList();
    direction = Direction.all;
    sortVar = SortVar.popularity;
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool descending = true;

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
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
                  value: direction,
                  style: TextStyle(
                    color: Color(0xFFBEBEBE),
                    fontSize: 14.height,
                  ),
                  onChanged: (item) {
                    newsBloc.add(SelectDirection(item));
                    setState(
                      () {
                        direction = item;
                      },
                    );
                  },
                  items: dropDownItemsDir,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    newsBloc.add(SelectSort(newsBloc.vertic * -1, sortVar));
                    _animationController.isCompleted
                        ? _animationController.reverse()
                        : _animationController.forward();
                  },
                  child: RotationTransition(
                    turns: _animationController,
                    child: Transform.rotate(
                      angle: descending ? 0 : math.pi,
                      child: Icon(
                        Icons.filter_list,
                        color: Color(0xFFBEBEBE),
                      ),
                    ),
                  ),
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
                  value: sortVar,
                  style: TextStyle(
                    color: Color(0xFFBEBEBE),
                    fontSize: 14.height,
                  ),
                  onChanged: (item) {
                    newsBloc.add(SelectSort(-1, item));
                    setState(
                      () {
                        sortVar = item;
                      },
                    );
                  },
                  items: dropDownItemsSort,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
