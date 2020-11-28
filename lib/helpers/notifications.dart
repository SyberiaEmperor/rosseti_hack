// import 'dart:async';
// import 'dart:io';
// import 'dart:convert';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rosseti/helpers/dialogs.dart';
// import 'package:rosseti/helpers/globals.dart';
// import 'package:rosseti/repos/entities/authentication_server_repository.dart';
// import 'package:http/http.dart' as http;
// import 'requests/requests.dart' as requests;

// // для http запросов
// void handleTimeOutException(BuildContext context) {
//   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     Dialogs.showWarningDialog('Ошибка получения данных',
//         'Время на загрузку истекло. Повторите попытку.');
//   });
// }

// void handleLostConnection(BuildContext context) {
//   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     Dialogs.showWarningDialog(
//       'Ошибка получения данных',
//       'Соединение с сервером потеряно. Проверьте Интернет-соединение и обновите данные.',
//     );
//   });
// }

// class FCMNotifications {
//   final FirebaseMessaging fcm = FirebaseMessaging();
//   FlutterLocalNotificationsPlugin fln = new FlutterLocalNotificationsPlugin();

//   // ignore: missing_return
//   Future<void> onSelectNotification(String payload) {
//     print("__LOCALNOTIFICATION__");
//     print("payload is $payload");
//   }

//   // настраиваем локалььные уведомления
//   void configLocalNotification() {
//     var initializationSettingsAndroid = new AndroidInitializationSettings(
//         '@mipmap/launcher_icon'); 
//     var initializationSettingsIOS = new IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(
//         initializationSettingsAndroid, initializationSettingsIOS);
//     fln.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//   }

//   // закрепляем пуш-токен за текущим юзером на сервере
//   Future setPushtoken(String pushToken) async {
//     var token = requests.token;
//     String userId = requests.parseJWT(token)['userId'].toString();
//     var response = await http
//         .post(
//             "https://api.test.walkscreen.ru/v1/user/" +
//                 userId +
//                 '/push/subscribe',
//             body: json.encode({
//               "token": pushToken,
//             }),
//             headers: {
//               HttpHeaders.contentTypeHeader: 'application/json',
//               HttpHeaders.acceptHeader: '*',
//               HttpHeaders.authorizationHeader: token
//             })
//         .timeout(Duration(seconds: 10))
//         .catchError((_) => (myGlobals.globalKey.currentContext),
//             test: (e) => e is TimeoutException)
//         .catchError((_) {
//           handleLostConnection(myGlobals.globalKey.currentContext);
//         });
//     if (response != null) {
//       if (response.statusCode != 201) {
//         //ошибка
//         var body = json.decode(response.body);
//         Dialogs.showWarningDialog("Ошибка", body['message'].toString());
//       } else {
//         //нет ошибки
//       }
//     } else //нет соединения
//     {
//       Dialogs.showWarningDialog(
//           'Ошибка получения данных', 'Отсутствует подключение к Интернету');
//     }
//   }

//   // проверяем, получали ли ранее пуш-токен
//   Future<void> sendPushtoServer() async {
//     // var pushToken = await AuthenticationServerRepository()
//     //     .getPuchToken(); // проверяем, есть ли токен в хранилище
//     // if (pushToken == null) {
//     //   //не получали
//     //   String token =
//     //       await fcm.getToken(); //обращаемся к firebase за новым токеном
//     //   AuthenticationServerRepository().persistPushToken(token);
//     //   await setPushtoken(token);
//     // } else {
//     //   await setPushtoken(pushToken);
//     // }
//   }

//   //временное решение
//   Future<void> manageNotifs(String ntf, bool flag) async {
//     // if (ntf == 'n1' && flag == false) {
//     //   await AuthenticationServerRepository().deletePushToken();
//     //   fcm.deleteInstanceID();
//     // }
//     // if (ntf == 'n1' && flag == true) {
//     //   await initialise();
//     // }
//   }

//   Future initialise() async {
//     print('Initializing...');
//     configLocalNotification();
//     var n1 = prefs.getBool('n1') == null ?? true; //временное решение
//     if (Platform.isAndroid && n1) {
//       sendPushtoServer();
//     } else if (Platform.isIOS) {
//       var isAllow = await fcm.requestNotificationPermissions(
//           IosNotificationSettings()); //запрашиваем разрешение на уведомления (при первом запуске и только для ios)
//       if (isAllow) {
//         sendPushtoServer();
//       } else {
//         // если на ios при первом запуске юзер отказался от уведомлений
//         prefs.setBool('n1', false);
//         prefs.setBool('n2', false);
//         prefs.setBool('n3', false);
//       }
//     }
//     fcm.configure(
//       //onBackgroundMessage: (Map<String, dynamic> message) =>myBackgroundMessageHandler(message),
//       onMessage: (Map<String, dynamic> message) async {
//         print("onMessage: $message");
//         var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//           Platform.isAndroid ? 'com.dfa.walkscreen' : 'com.duytq.walkscreen',
//           'walkscreen',
//           'Notification',
//           playSound: true,
//           enableVibration: true,
//           importance: Importance.Max,
//           priority: Priority.High,
//         );
//         var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//         var platformChannelSpecifics = new NotificationDetails(
//             androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//         var title = ' ';
//         var body = ' ';
//         if (Platform.isIOS) {
//           title = message['aps']['alert']['title'];
//           body = message['aps']['alert']['body'];
//         } else {
//           title = message["notification"]["title"];
//           body = message["notification"]["body"];
//         }
//         fln.show(0, title, body, platformChannelSpecifics, payload: "payload");
//       },
//       onLaunch: (Map<String, dynamic> message) async {
//         // дефолтный канал
//         print("onLaunch: $message");
//       },
//       onResume: (Map<String, dynamic> message) async {
//         print("onResume: $message");
//       },
//     );
//   }
// }
