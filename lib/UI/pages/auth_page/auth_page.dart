import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/auth_page/widgets/auth_text_field.dart';
import 'package:rosseti/UI/pages/navigation_page.dart';

import 'package:rosseti/bloc/authenticated_bloc/authenticated_bloc.dart';
import 'package:rosseti/bloc/profile_bloc/profile_bloc.dart';
import 'package:rosseti/helpers/dialogs.dart';

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
              height: 530.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.width, right: 20.width, bottom: 20.height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.height,
                      ),
                      Text(
                        "Авторизация",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        height: 8.height,
                      ),
                      Container(
                        width: 202.height,
                        child: Text(
                          "Введите свои персональные данные для авторизации",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: 25.height,
                      ),
                      AuthTextField(),
                      SizedBox(
                        height: 46.height,
                      ),
                      Container(
                        height: 52.height,
                        width: 320.width,
                        child: RaisedButton(
                          onPressed: () {
                            authBloc.add(SingInEvent());
                          },
                          child: Text(
                            "Войти",
                            style: TextStyle(
                              fontFamily: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .fontFamily,
                              color: Colors.white,
                              fontSize: 16.height,
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      SizedBox(
                        height: 16.height,
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
                child: BlocListener<ProfileBloc, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileRecivedSuccesfullyState) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => NavigationPage()));
                    }
                  },
                  child: BlocConsumer<AuthenticatedBloc, AuthenticatedState>(
                    listener: (context, state) {
                      if (state is AuthenticationErrorState) {
                        showWarningDialog(
                            'Внимание!', state.errorText, context);
                      } else if (state is SingInState) {}
                    },
                    builder: (context, state) {
                      if (state is AuthenticationLoadingState)
                        return Platform.isAndroid
                            ? Center(child: CircularProgressIndicator())
                            : Center(child: CupertinoActivityIndicator());
                      else
                        return Container();
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
