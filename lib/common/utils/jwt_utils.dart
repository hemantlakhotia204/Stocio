import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:stocio_app/common/models/jwt_model.dart';
import 'package:stocio_app/common/store/shared_preference_repo.dart';
import 'package:stocio_app/main.dart';

class JwtUtils {
  static Future<JwtModel> decode() async {
    var at = await SharedPrefRepo.get("at");
    if (at == null) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil("/login", (route) => false);
    }
    Map<String, dynamic> decoded = JwtDecoder.decode(at);
    return JwtModel(at: at, id: decoded["id"], email: decoded["email"]);
  }
}
