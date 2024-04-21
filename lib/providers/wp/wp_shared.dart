import 'dart:convert';

import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:flutter/foundation.dart';

class WPMessageTemplate {
  final String text;
  final String image;

  WPMessageTemplate({
    required this.text,
    required this.image
  });

  // Function to convert SMSMessageTemplate object to JSON string
  String toJson() {
    return jsonEncode(
        {
          "text": this.text,
          "image": this.image
        }
    );
  }

  // Static function to create SMSMessageTemplate object from JSON string
  static WPMessageTemplate fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return WPMessageTemplate(text: jsonMap['text'], image: jsonMap['image']);
  }

  void saveToShared() {
    String value = this.toJson();
    SharedPreferencesHelper.setString('wpMsg', value);
    debugPrint('Saving to Shared Preference');
  }

  static Future<WPMessageTemplate?> getFromShared() async {
    String value = await SharedPreferencesHelper.getString('wpMsg');
    return value.isNotEmpty ? WPMessageTemplate.fromJson(value) : null;
  }
}
