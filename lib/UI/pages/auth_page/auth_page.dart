import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/pages/auth_page/widgets/auth_text_field.dart';
import 'package:rosseti/UI/pages/navigation_page.dart';

import 'package:rosseti/bloc/authenticated_bloc/authenticated_bloc.dart';

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

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 530,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Авторизация",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 202,
                        child: Text(
                          "Введите свои персональные данные для авторизации",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      AuthTextField(),
                      SizedBox(
                        height: 14,
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
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .fontFamily,
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
                child: BlocConsumer<AuthenticatedBloc, AuthenticatedState>(
                  listener: (context, state) {
                    if (state is AuthenticationErrorState) {
                      //showWarningDialog('Внимание!',state.errorText , context);
                    } else if (state is SingInState) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => NavigationPage()));
                    }
                  },
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
        ),
      ),
    );
  }
}
