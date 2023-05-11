import 'package:dio/dio.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/service/http_dio.dart';

class LoginService {
  LoginService._internal();

  static final _singleton = LoginService._internal();
  static final _httpDio = HttpDio();

  factory LoginService() {
    return _singleton;
  }

  Future<SResponse> loginMember(String email, String password) async {
    final response = await _httpDio.dio.post(
      "/api/member/login",
      options: Options(contentType: 'application/json'),
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return SResponse.fromJson(response.data);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      final res = SResponse.fromJson(response.data);
      throw Exception(res.msg);
    }
  }
}
