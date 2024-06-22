
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final Set<String> _keys = {}; // Set to store keys

  static String deviceTokenKey = 'deviceToken';

  static Future<void> reload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
  }

  // Save authentication token to SharedPreferences
  static Future<void> saveDeviceToken(String authToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(deviceTokenKey, authToken);
    _keys.add(deviceTokenKey);
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
    _keys.remove(deviceTokenKey);
  }

  static Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    _keys.add(key);
  }

  static Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    _keys.remove(key);
    debugPrint("$key removed from SharedPreference");
  }

  static Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    _keys.add(key);
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> setList(String key, List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
    _keys.add(key);
  }

  static Future<List<String>> getList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> removeAll() async {
    reload();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // _keys.forEach((element) async {
    //   await remove(element);
    // });
    for(var element in _keys) {
      await remove(element);
    }
  }
}
