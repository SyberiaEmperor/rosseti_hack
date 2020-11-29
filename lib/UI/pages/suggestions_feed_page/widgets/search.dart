import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart';
import 'package:rosseti/bloc/news_bloc/news_event.dart' as events;

class Search extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 35.width,
      ),
      margin: EdgeInsets.only(
        bottom: 5.height,
      ),
      color: Colors.white,
      alignment: Alignment.center,
      child: TextField(
        controller: searchController,
        onSubmitted: (value) {
          BlocProvider.of<NewsBloc>(context).add(events.Search(value));
        },
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Color(0xFFBEBEBE),
          ),
          border: InputBorder.none,
          hintText: "Поиск",
          hintStyle: TextStyle(
            color: Color(0xFFBEBEBE),
          ),
        ),
      ),
    );
  }
}
