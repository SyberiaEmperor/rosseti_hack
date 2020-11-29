part of requests;

Future<void> sendApplication(Application application) async {
  print("start sent files");

  Map<String, dynamic> app = {"application": application.toJson()};
  var formData = FormData.fromMap(app);
  if (application.filePath != null&&application.filePath.trim() !='') {
    formData.files.add(
      MapEntry(
        "file",
        MultipartFile.fromFileSync(application.filePath,
            filename: application.filePath),
      ),
    );
  }
  final dio = Dio();
  dio.options.headers[HttpHeaders.authorizationHeader] = token;
  try {
    final response = await dio.post(url + 'applications', data: formData);

    if (response != null) {
      if (response.statusCode == 200) {
        print("Файлы отправлены успешно");
      } else {
        throw SendingDataFailure();
      }
    }
  } on Exception catch (e) {
    print(e.toString());
  }
}

Future<Map<String, dynamic>> getUniqueness(String problem, String title) async {
  http.Response response;
  try {
    response = await http.get(
      url + "applications/check_uniq/?problem={$problem}&title={$title}",
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
    return jsonDecode(response.body);
  } else {
    if (response?.statusCode == 401) {
      throw ExpiredToken();
    } else {
      throw GettingDataFailure();
    }
  }
}
