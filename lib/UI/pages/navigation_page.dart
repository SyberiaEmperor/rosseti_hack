import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pandabar/main.view.dart';
import 'package:pandabar/model.dart';
import 'package:rosseti/UI/pages/chat_page/chat_page.dart';
import 'package:rosseti/UI/pages/news_feed_page/news_feed_page.dart';
import 'package:rosseti/bloc/news_bloc/news_bloc.dart';
import 'package:rosseti/bloc/news_bloc/news_event.dart';
import 'package:rosseti/bloc/news_bloc/news_state.dart';
import 'package:rosseti/UI/pages/chat_page/chat_page.dart';
import 'package:rosseti/UI/pages/documents_page/documents_page.dart';
import 'package:rosseti/UI/pages/fill_report_page/fill_suggestion_page.dart';

import 'package:rosseti/UI/pages/profile_page/profile_page.dart';
import 'package:rosseti/UI/pages/suggestions_feed_page/suggestions_feed_page.dart';
import 'package:rosseti/bloc/authenticated_bloc/authenticated_bloc.dart';

import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';
import 'package:rosseti/repos/entities/authentication_server_repository.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';
import '../classes/responsive_size.dart';
import 'chat_page/chat_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  AuthenticationServerRepository rep = AuthenticationServerRepository();
  int _currentIndex = 0;
  List<Widget> pages = [
    BlocProvider(
      create: (context) => NewsBloc(LoadingState(""))..add(Update()),
      child: NewsFeedPage(),
    ),
    SuggestionsFeedPage(),
    DocumentsPage(),
    SuggestionsFeedPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => ProfileBloc(
          RepositoryProvider.of<ProfileRepository>(context),
          RepositoryProvider.of<ProfileTempRepository>(context),
          BlocProvider.of<AuthenticatedBloc>(context)),
      child: SafeArea(
        child: Scaffold(
          body: pages[_currentIndex],
          bottomNavigationBar: PandaBar(
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
                  icon: Icons.first_page,
                ),
                PandaBarButtonData(
                  id: 1,
                  title: "Документы",
                  icon: Icons.search,
                ),
                PandaBarButtonData(
                  id: 2,
                  title: "Title 3",
                  icon: Icons.desktop_windows,
                ),
                PandaBarButtonData(
                  id: 3,
                  title: "Профиль",
                  icon: Icons.dangerous,
                ),
              ]),
        ),
      ),
    );
  }
}
