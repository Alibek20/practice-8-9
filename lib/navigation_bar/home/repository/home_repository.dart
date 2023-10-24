import 'dart:convert';

import 'package:http/http.dart';

import '../model/home_model.dart';

class HttpRepository {
  String httpUrl =
      'https://jsonplaceholder.typicode.com/posts';

  Future<List<HttpModel>> getNews() async {
    Response response = await get(
      Uri.parse(httpUrl),
    );
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => HttpModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}