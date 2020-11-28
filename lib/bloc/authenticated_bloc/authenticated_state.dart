part of 'authenticated_bloc.dart';



abstract class AuthenticatedState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticatedState {
  final String defaultLogin;
  final String defaultPassword;

  AuthenticationInitialState(this.defaultLogin, this.defaultPassword);
}

class SingInState extends AuthenticatedState {}

class AuthenticationLoadingState extends AuthenticatedState{}

class AuthenticationErrorState extends AuthenticatedState{
  @override
  List<Object> get props => [BlocKey()];
  final String errorText;
  AuthenticationErrorState(this.errorText);
}

class SingOutState extends AuthenticatedState {}
