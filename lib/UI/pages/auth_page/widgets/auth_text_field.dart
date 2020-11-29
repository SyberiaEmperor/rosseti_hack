import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/bloc/authenticated_bloc/authenticated_bloc.dart';
import 'package:rosseti/helpers/validators.dart';
import 'package:rosseti/widgets/input_field.dart';

class AuthTextField extends StatefulWidget {
  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  _AuthTextFieldState();
  final passwordController = TextEditingController();
  final loginContoller = TextEditingController();

  FocusNode focusPasswordNode = FocusNode();
  FocusNode focusEmailNode = FocusNode();
  @override
  void dispose() {
    focusPasswordNode.dispose();
    focusEmailNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final authBloc = BlocProvider.of<AuthenticatedBloc>(context);
    return BlocBuilder<AuthenticatedBloc, AuthenticatedState>(
      buildWhen: (p, c) => c is AuthenticationInitialState,
      builder: (context, state) {
        if (state is AuthenticationInitialState) {
          return Column(
            children: <Widget>[
              InputField(
                initialValue: state.defaultLogin,
                validator: validateEmail,
                onChanged: (v) => authBloc.add(LoginChangeEvent(v.trim())),
                name: 'E-mail',
                nextFocusNode: focusPasswordNode,
                focusNode: focusEmailNode,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 12.height,
              ),
              InputField(
                textCapitalization: TextCapitalization.none,
                obscureText: true,
                initialValue: state.defaultPassword,
                onChanged: (v) {
                  authBloc.add(PasswordChangeEvent(v.trim()));
                },
                name: 'Пароль',
                focusNode: focusPasswordNode,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.go,
              ),
            ],
          );
        } else
          return Container();
      },
    );
  }
}
