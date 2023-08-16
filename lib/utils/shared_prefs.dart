import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String isFirstLogin = "isFirstLogin";
  static const String isLoggedIn = "isLoggedIn";
  static const String userId = "userId";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String isAppFirstTimeOpenLogin = "isAppFirstTimeOpenLogin";

  static Future setStringValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future setBoolValue(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future setIntValue(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  static Future<String> getStringValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key)
        ? Future<String>.value(prefs.getString(key))
        : Future.value("");
  }

  static Future getBoolValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.getBool(key) : false;
  }

  static Future getIntValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? prefs.getInt(key) : 0;
  }

  static Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
