part of requests;

Future<Profile> sendProfile(Profile profile) async {
  //есть соединение
  String userId = parseJWT(token)['userId'].toString();
  final body = profile.toJson();
  http.Response response;
  try {
    response = await http.put(url + "user/",
        body: jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: '*',
          HttpHeaders.authorizationHeader: token,
        }).timeout(Duration(seconds: 10));
  } on Exception {
    throw SendingDataFailure();
  }
  if (response?.statusCode != 200) {
    if (response?.statusCode == 401) {
      throw ExpiredToken();
    } else {
      throw SendingDataFailure();
    }
  } else{
    return Profile.fromJson(jsonDecode(response.body));
  }
}

Future<Profile> getProfile() async {
  http.Response response;
  try {
    response = await http.get(
      url + "user/",
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: '*',
        HttpHeaders.authorizationHeader: token
      },
    ).timeout(Duration(seconds: 10));
  } on Exception {
    throw GettingDataFailure();
  }
  if (response?.statusCode == 200) {
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    if (response?.statusCode == 401) {
      throw ExpiredToken();
    } else {
      throw GettingDataFailure();
    }
  }
}

Future<String> sendFile(Uint8List file, String type) async {
  dio.Response response;
  try {
    dio.FormData data;
    data = dio.FormData.fromMap({
      'file': dio.MultipartFile.fromBytes(file,filename:'photo.jpg'),
    });
    var d = dio.Dio();
    d.options.headers[HttpHeaders.authorizationHeader] = token;
    String userId = parseJWT(token)['userId'].toString();
    response = await d
        .post(url+'v1/user/$userId/cdn/upload/$type',
            data: data)
        .timeout(Duration(seconds: 15));
  } catch(e) {
    print('===========================================================================');
    print(e);
    print('===========================================================================');
    throw SendingDataFailure();
  }

  if (response?.statusCode == 201) {
    return (response.data as Map<String, dynamic>)['url'];
  } else {
    if (response?.statusCode == 401) {
      throw ExpiredToken();
    } else {
      throw SendingDataFailure();
    }
  }
}

Future<Uint8List> getFile(String filePath, String type) async {
  http.Response response;
  try {
  
   String userId = parseJWT(token)['userId'].toString(); //https://api.test.walkscreen.ru/v1/user/$userId/cdn/protected/${photos[0]}
   String fileName=type=='protected'?'v1/user/$userId/cdn/protected/'+filePath:filePath;
   response= await http
          .get(url
           +
           fileName,
              headers: {HttpHeaders.authorizationHeader: token})
          .timeout(Duration(seconds: 15));
  } on Exception {
    throw GettingDataFailure();
  }

  if (response?.statusCode == 200) {
    return type== 'protected'?base64Decode(json.decode(response.body)['content']):response.bodyBytes;
  } else {
    if (response?.statusCode == 401) {
      throw ExpiredToken();
    } else {
      throw GettingDataFailure();
    }
  }
}

