part of requests;

singIn(String login, String password) async {
  http.Response response;
  try {
    response = await http.post(
      url + "user_token/",
      body: json.encode({
        "auth": {
          "email": login,
          "password": password,
        }
      }),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: '*'
      },
    ).timeout(Duration(seconds: 10));
  } on Exception {
    throw LoginFailure();
  }
  if (response?.statusCode == 201) {
    token = jsonDecode(response.body)["jwt"];
  } else {
    if (response?.statusCode == 401) {
      throw ExpiredToken();
    } else {
      throw LoginFailure();
    }
  }
}

Future<void> register(String number, String password, String code) async {
  http.Response response;
  try {
    response = await http.post(url + "v1/user/register",
        body: json.encode({
          "phone": number,
          "otp": code,
          "password": password,
        }),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*'
        }).timeout(Duration(seconds: 10));
  } on Exception {
    throw RegisterFailure();
  }
  if (response?.statusCode == 201) {
    token = response.body;
    if (parseJWT(token)['role'] != "promouter") throw IncorrectUserRole();
  } else {
    if (response?.statusCode == 401) {
      throw ExpiredToken();
    } else {
      throw RegisterFailure();
    }
  }
}

//получение кода верификации по смс
Future<void> getOTP(String number, bool isFirst) async {
  http.Response response;
  try {
    response = await http.post(
      url + "v1/user/otp",
      body: jsonEncode({"phone": number, "existingUsers": false}),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: '*'
      },
    ).timeout(Duration(seconds: 10));
  } on Exception {
    throw GettingOtpFailure();
  }
  if (response?.statusCode != 201) {
    throw GettingOtpFailure();
  }
}

Future<void> singOut() async {
  http.Response response;
  try {
    response = await http.post(url + "v1/user/logout", headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: '*',
      HttpHeaders.authorizationHeader: token,
    }).timeout(Duration(seconds: 10));
  } on Exception {
    throw LogoutFilure();
  }
  if (response?.statusCode != 201) {
    throw LogoutFilure();
  }
}

//подгрузка аватар
