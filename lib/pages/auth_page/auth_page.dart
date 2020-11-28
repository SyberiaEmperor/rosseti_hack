import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/pages/auth_page/widgets/auth_text_field.dart';

import 'package:rosseti/bloc/authenticated_bloc/authenticated_bloc.dart';
import 'package:rosseti/main.dart';
import 'package:rosseti/repos/entities/account_repository.dart';

import 'package:url_launcher/url_launcher.dart' as url;

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool didAuthenticate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final authBloc = BlocProvider.of<AuthenticatedBloc>(context);

    //вызов TouchID
    return Stack(
      children: <Widget>[
        Container(
          height: 530,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Авторизация",
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 202,
                    child: Text(
                      "Введите свои персональные данные для авторизации",
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //AuthTextField(),
                  SizedBox(
                    height: 14,
                  ),
                  GestureDetector(
                    child: Align(
                      child: Text(
                        "Забыли пароль?",
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.subhead.fontFamily,
                          fontSize: 14,
                          color: Theme.of(context).textTheme.subhead.color,
                        ),
                      ),
                    ),
                    //onTap: () => url.launch('https://walkscreen.afigol.ru/'),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 52,
                    width: 320,
                    child: RaisedButton(
                      onPressed: () {
                        authBloc.add(SingInEvent());
                      },
                      child: Text(
                        "Войти",
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.body1.fontFamily,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            width: MediaQuery.of(context).size.width,
            //хз почему так низко подучается
            top: MediaQuery.of(context).size.height * 0.2,
            child: BlocBuilder<AuthenticatedBloc, AuthenticatedState>(
              builder: (context, state) {
                if (state is AuthenticationLoadingState)
                  return Platform.isAndroid
                      ? Center(child: CircularProgressIndicator())
                      : Center(child: CupertinoActivityIndicator());
                else
                  return Container();
              },
            ))
      ],
    );
  }
}
