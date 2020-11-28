import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosseti/bloc/bloc_key.dart';
import 'package:rosseti/repos/models/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authenticated_event.dart';
part 'authenticated_state.dart';

class AuthenticatedBloc extends Bloc<AuthenticatedEvent, AuthenticatedState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticatedBloc(this.authenticationRepository) : super(AuthenticationInitialState('', ''));
  String _login = '';
  String _password = '';

  @override
  Stream<AuthenticatedState> mapEventToState(
    AuthenticatedEvent event,
  ) async* {

    if (event is LoginChangeEvent) {
      _login = event.value;
    } else if (event is PasswordChangeEvent) {
      _password = event.value;
    } else if (event is SingInEvent) {
      yield* mapSingInEventToState();
    } else if (event is SingOutEvent) {
      yield* mapSingOutEventToState();
    }
  }

  Stream<AuthenticatedState> mapSingInEventToState() async* {
    if(_login.trim().isEmpty){
      yield AuthenticationErrorState("Email не введён!");
      return;
    }
    if(_password.trim().isEmpty){
      yield AuthenticationErrorState("Пароль не введён!");
      return;
    }
    yield AuthenticationLoadingState();
    try {
      await authenticationRepository.singIn(_login,_password);
      yield SingInState();
    } catch (e) {
      yield  AuthenticationErrorState("Ошибка авторизации");
    }
  }

  Stream<AuthenticatedState> mapSingOutEventToState() async* {
    yield AuthenticationLoadingState();
    try {
      await authenticationRepository.singOut();
      yield SingOutState();
    } catch (e) {
      yield  AuthenticationErrorState("Ошибка авторизации");
    }
  }
}
//Используем один н
