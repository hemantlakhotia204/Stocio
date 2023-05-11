import 'package:dio/dio.dart';
import 'package:stocio_app/auth/models/register_model.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/service/http_dio.dart';

class RegisterService {
  RegisterService._internal();

  static final _singleton = RegisterService._internal();
  static final _httpDio = HttpDio();

  factory RegisterService() {
    return _singleton;
  }

  Future<SResponse> fetchInstitutes() async {
    final response = await _httpDio.dio.get("/api/institute");

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

  Future<SResponse> registerMember(RegisterModel member) async {
    final response = await _httpDio.dio.post(
      "/api/member",
      options: Options(
        contentType: 'application/json',
      ),
      data: member,
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
