part of 'authenticated_bloc.dart';

abstract class AuthenticatedEvent extends Equatable {
  const AuthenticatedEvent();
  @override
  List<Object> get props => [];
}

class LoginChangeEvent extends AuthenticatedEvent {
  final String value;

  LoginChangeEvent(this.value);
}

class PasswordChangeEvent extends AuthenticatedEvent {
  final String value;

  PasswordChangeEvent(this.value);
}

class SingInEvent extends AuthenticatedEvent {}

class SingOutEvent extends AuthenticatedEvent {}
