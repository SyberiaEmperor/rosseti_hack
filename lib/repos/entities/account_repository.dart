// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class AccountRepository{
//    final storage = new FlutterSecureStorage();
//    int iatToken = 0;

//    Future<void> deleteLogin() async {
//     /// delete from keystore/keychain
//     await storage.delete(key: 'Login');
//     return;
//   }

//    Future<void> persistLogin(String Login) async {
//     /// write to keystore/keychain
//     await storage.write(key: 'Login', value: Login);
//     var tk = await storage.read(key: 'Login');
//     // print(tk);
//     return;
//   }

//    Future<bool> hasLogin() async {
//     /// read from keystore/keychain
//     var token = await storage.read(key: 'Login');
//     return token != null;
//   }

//    Future<String> getLogin() async {
//     var token = await storage.read(key: 'Login');
//     return token;
//   }

//    Future<void> deletePassword() async {
//     /// delete from keystore/keychain
//     await storage.delete(key: 'password');
//     return;
//   }

//    Future<void> persistPassword(String password) async {
//     /// write to keystore/keychain
//     await storage.write(key: 'password', value: password);
//     var tk = await storage.read(key: 'password');
//     // print(tk);
//     return;
//   }

//    Future<bool> hasPassword() async {
//     /// read from keystore/keychain
//     var token = await storage.read(key: 'password');
//     return token != null;
//   }

//    Future<String> getPassword() async {
//     var token = await storage.read(key: 'password');
//     return token;
//   }
// }