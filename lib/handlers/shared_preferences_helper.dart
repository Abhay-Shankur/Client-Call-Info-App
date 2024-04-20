import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static String deviceTokenKey = 'deviceToken';

  // Save authentication token to SharedPreferences
  static Future<void> saveDeviceToken(String authToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(deviceTokenKey, authToken);
  }

  // Get authentication token from SharedPreferences
  static Future<String?> getDeviceToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(deviceTokenKey);
  }

  // Remove authentication token from SharedPreferences
  static Future<void> removeDeviceToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(deviceTokenKey);
  }

  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
