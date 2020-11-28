part of 'repository.dart';

abstract class AuthenticationRepository{
  int get userId;
  String get login;
  String get password;
  Future<void> singIn(String login,String password);
  Future<void> singOut();
}