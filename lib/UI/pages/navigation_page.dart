import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandabar/model.dart';
import 'package:rosseti/UI/custom_navbar/main_view.dart';
import 'package:rosseti/UI/pages/profile_page/profile_page.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart';
import 'package:rosseti/bloc/news_bloc/news_event.dart';
import 'package:rosseti/bloc/news_bloc/news_state.dart';

import 'package:rosseti/UI/pages/suggestions_feed_page/suggestions_feed_page.dart';
import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';

import 'package:rosseti/repos/entities/authentication_server_repository.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';

import '../classes/responsive_size.dart';
import 'fill_suggestion_page/fill_suggestion_page.dart';
import 'suggestions_feed_page/suggestions_feed_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  AuthenticationServerRepository rep = AuthenticationServerRepository();
  int _currentIndex = 0;

  @override
  List<Widget> pages = [
    SuggestionsFeedPage(),
    ProfilePage(),
  ];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyPandaBar(
          fabColors: [
            Colors.black,
            Colors.blue,
          ],
          fabIcon: Icon(
            Icons.create,
            color: Colors.white,
          ),
          buttonColor: Colors.white,
          buttonSelectedColor: Theme.of(context).primaryColor,
          onFabButtonPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FillSuggestionPage(),
              ),
            );
          },
          onChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          buttonData: [
            PandaBarButtonData(
              id: 0,
              title: "Предложения",
              icon: Icons.list_alt,
            ),
            PandaBarButtonData(
              id: 1,
              title: "Профиль",
              icon: Icons.person,
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(
            top: 30.height,
          ),
          child: pages[_currentIndex],
        ),
      ),
    );
  }
}
