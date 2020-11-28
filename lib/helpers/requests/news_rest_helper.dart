part of requests;

// Future<List<NewsData>> getNews() async {
  
//   http.Response response;
//   try {
//     response = await http
//           .get('https://api.test.walkscreen.ru/v1/news/', headers: {
//             HttpHeaders.contentTypeHeader: 'application/json',
//             HttpHeaders.acceptHeader: '*',
//             HttpHeaders.authorizationHeader: token,
//           })
//           .timeout(Duration(seconds: 10));
//   } on Exception {
//     throw GettingDataFailure();
//   }

//   if (response?.statusCode == 200) {
//     return  jsonDecode(response.body)['items'] as List<dynamic>;
//   } else {
//     if (response?.statusCode == 401) {
//       throw ExpiredToken();
//     } else {
//       throw GettingDataFailure();
//     }
//   }
// }
  
  