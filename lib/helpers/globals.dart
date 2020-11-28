import 'package:flutter/cupertino.dart';

// используется для онбординга и настроек уведомлений

// пуш-уведомления
//var notifications = new FCMNotifications();

// глобальный контекст
MyGlobals myGlobals = new MyGlobals();

class MyGlobals {
  GlobalKey _scaffoldKey;
  MyGlobals() {
    _scaffoldKey = GlobalKey();
  }
  GlobalKey get globalKey => _scaffoldKey;
}
