import 'dart:convert';

import 'package:call_info/handlers/shared_preferences_helper.dart';

class RepeatNumberProvider {
  static Map<String,dynamic>? mapList;


  static String mapToString(Map<String, dynamic> map) {
    return jsonEncode(map);
  }

  static Map<String, dynamic> stringToMap(String str) {
    return jsonDecode(str);
  }

  Map<String, dynamic>? getList() {
    return mapList;
  }

  // Insert or update a value in the Map
  static Future<void> insertOrUpdate(String key, dynamic value) async {
    mapList ??= {};
    mapList![key] = value;
    await SharedPreferencesHelper.reload();
    String val = mapToString(mapList!);
    await SharedPreferencesHelper.setString("repeatList", val);
  }


}