library requests;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rosseti/models/message.dart';
import 'package:rosseti/models/profile.dart';
import 'package:rosseti/models/registry_item.dart';
part 'profile_rest_helper.dart';
part 'authenticated_rest_helper.dart';
part 'news_rest_helper.dart';

class SendingDataFailure implements Exception {}

class LoginFailure implements Exception {}

class RegisterFailure implements Exception {}

class LogoutFilure implements Exception {}

class GettingOtpFailure implements Exception {}

class GettingDataFailure implements Exception {}

class ExpiredToken implements Exception {}

class IncorrectUserRole implements Exception {}

String token = "";

const int OKRESPONSE = 200;
const int NODATARESPONSE = 204;

const String url = 'http://178.154.255.209:3333/';

Map<String, dynamic> parseJWT(String token) {
  final parts = token.split('.');
  String normalizedSource = base64Url.normalize(parts[1]);
  return json.decode(utf8.decode(base64Url.decode(normalizedSource)));
}

Future<void> updateToken(String login, String password) async {
  http.Response response = await http.post(
    url + "v1/user/login",
    body: json.encode({
      "phone": login,
      "password": password,
    }),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: '*'
    },
  );
  if (response.statusCode != 201) {
    throw GettingDataFailure();
  } else {
    token = jsonDecode(response.body)['token'];
  }
}

Future<List<Message>> getHistory({@required int id, @required int page}) async {
  List<Message> result = List<Message>();
  http.Response response = await http.get(
    url + "/messages/$id/?page=$page",
    headers: {
      HttpHeaders.authorizationHeader: token,
    },
  ).timeout(Duration(milliseconds: 10000));

  if (response.statusCode == NODATARESPONSE) return result;
  if (response.statusCode == OKRESPONSE) {
    List<dynamic> messageHistory = jsonDecode(response.body);
    messageHistory.forEach((message) {
      result.add(new Message.fromJson(message));
    });
    return result;
  } else {
    print("Error!");
    print(response.body ?? "");
    print(response.statusCode);
    throw GettingDataFailure();
  }
}

Future<List<RegistryItem>> getStatements() async {
  return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      .map((e) => RegistryItem.test(e))
      .toList();
}
