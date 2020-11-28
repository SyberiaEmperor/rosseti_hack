import 'dart:async';
import 'package:rosseti/repos/models/repository.dart';
import 'package:rosseti/helpers/requests/requests.dart' as r;

class AuthenticationServerRepository extends AuthenticationRepository {
  static AuthenticationServerRepository _accountRepository;

  factory AuthenticationServerRepository() {
    if (_accountRepository == null) {
      _accountRepository = AuthenticationServerRepository._();
    }
    return _accountRepository;
  }
  AuthenticationServerRepository._();

  String _login = '';
  String _password = '';

  @override
  String get login => _login;

  @override
  Future<void> singIn(String login, String password) async {
    try{
     await r.singIn(login,password);
     _login=login;
     _password=password;
    } on Exception{
      throw SingInFailure();
    }
  }

  @override
  Future<void> singOut() async {
    _login = '';
    _password = '';
  }

  @override
  int get userId => throw UnimplementedError();

  @override
  String get password => _password;
}
