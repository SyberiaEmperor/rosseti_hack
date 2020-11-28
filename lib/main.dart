import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/pages/auth_page/auth_page.dart';
import 'package:rosseti/UI/pages/profile_page/profile_page.dart';

import 'package:rosseti/bloc/make_statemants_bloc/make_statements_bloc.dart';
import 'package:rosseti/repos/entities/authentication_server_repository.dart';
import 'package:rosseti/repos/entities/profile_repository.dart';
import 'package:rosseti/repos/entities/profile_temp_repository.dart';

import 'bloc/authenticated_bloc/authenticated_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: close_sinks
  static final makeStatementsBloc = MakeStatementsBloc();
  @override
  Widget build(BuildContext context) {

   
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => ProfileTempRepository()),
        RepositoryProvider(
            create: (_) => ProfileRepository(AuthenticationServerRepository()))
      ],
      child: MultiBlocProvider(
        providers: [

          BlocProvider<AuthenticatedBloc>(
            create: (_) => AuthenticatedBloc(
              AuthenticationServerRepository(),
            ),
          ),
          BlocProvider<MakeStatementsBloc>(create: (_) => makeStatementsBloc),

        ],
        child: MaterialApp(
          builder: (context, child) {
            ResponsiveSize.init(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            );
            return child;
          },
          title: 'Россети',
          theme: ThemeData(),
          home: AuthPage(),
        ),
      ));
    
  }
}
