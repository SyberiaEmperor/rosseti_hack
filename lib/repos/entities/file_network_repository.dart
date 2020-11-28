// import 'dart:typed_data';
// import 'package:flutter/cupertino.dart';
// import 'package:rosseti/helpers/requests/requests.dart' as requests;
// import 'package:rosseti/models/profile.dart';
// import 'package:rosseti/repos/entities/authentication_server_repository.dart';
// import 'package:rosseti/repos/models/repository.dart';

// class FileNetworkRepository extends FileRepository {
//   final AuthenticationServerRepository accountRepository;
//   Map<String, String> _currentFileNames = {};
//   Map<String, Uint8List> _currentFiles = {};
//   Map<String, String> _type = {};
//   Map<String, bool> _sendImmediately = {};

//   FileNetworkRepository(
//     this.accountRepository,
//   );
//   @override
//   Future<String> persistFile(String key, Uint8List file) async {
//     if (!_currentFileNames.containsKey(key)) {
//       throw KeyIsAbsent();
//     }
//     try {
//       _currentFileNames[key] = await requests.sendFile(file, _type[key]);
//       _currentFiles[key] = file;
//       if (_sendImmediately[key]) {
//         await requests
//             .sendProfile(Profile.withImages({key: _currentFileNames[key]}));
//       }
//       return _currentFileNames[key];
//     } on requests.ExpiredToken {
//       await requests.updateToken(
//           accountRepository.login, accountRepository.password);
//       return await persistFile(key, file);
//     } on Exception {
//       throw PersistFailure();
//     }
//   }

//   @override
//   Future<Uint8List> getFile(String key) async {
//     if (!_currentFileNames.containsKey(key)) {
//       throw KeyIsAbsent();
//     }
//     try {
//       _currentFiles[key] =
//           await requests.getFile(_currentFileNames[key], _type[key]);
//       return _currentFiles[key];
//     } on requests.ExpiredToken {
//       await requests.updateToken(
//           accountRepository.login, accountRepository.password);
//       return await getFile(key);
//     } on Exception {
//       throw PersistFailure();
//     }
//   }

//   @override
//   Uint8List currentFile(String key) {
//     return _currentFiles[key];
//   }

//   @override
//   String currentUrl(String key) {
//     return _currentFileNames[key];
//   }

//   @override
//   Future<void> deleteFile(String key) async {
//     try {
//       // _currentFileUrls[key] = await requests.sendFile(null, "public");
//       _currentFiles.remove(key);
//     } on requests.ExpiredToken {
//       await requests.updateToken(
//           accountRepository.login, accountRepository.password);
//       await deleteFile(key);
//     } on Exception {
//       throw DelitingFailure();
//     }
//   }

//   @override
//   void addStartedFilename(String key, String filename, String type,
//       {bool sendImmediately = false}) {
//     _sendImmediately[key] = sendImmediately;
//     _type[key] = type;
//     _currentFileNames[key] = filename;
//   }

//   @override
//   void clear() {
//     _currentFileNames = {};
//     _currentFiles = {};
//     _type = {};
//     _sendImmediately = {};
//   }
// }
