import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepo {
  static Future get(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future save(String key, item) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, item);
  }

  static Future remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
