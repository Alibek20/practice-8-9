import 'dart:convert';
import 'package:http/http.dart';
import '../model/auth_model.dart';

class AuthRepository {
  Future<LoginModel> logIn(String email, String password) async {
    String loginUrl = 'https://reqres.in/api/login';

    Response response =
        await post(Uri.parse(loginUrl), body: {'email': email, 'password':password});
        print(response);
    if (jsonDecode(response.body.toString()) is Map) {
      if (response.statusCode == 200) {
        return LoginModel.fromJson(jsonDecode(response.body.toString()));
        
      }
      throw response.body.toString();
    }
    throw response.body.toString();
  }
}