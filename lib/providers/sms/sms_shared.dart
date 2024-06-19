// Define the SMS message template class
import 'dart:convert';

import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:flutter/cupertino.dart';

class SMSMessageTemplate {
  final String text;

  SMSMessageTemplate({required this.text});

  // Function to convert SMSMessageTemplate object to JSON string
  String toJson() {
    return jsonEncode({"text": text});
  }

  // Static function to create SMSMessageTemplate object from JSON string
  static SMSMessageTemplate fromJson(String jsonString) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return SMSMessageTemplate(text: jsonMap['text']);
  }

  void saveToShared() {
    String value = toJson();
    SharedPreferencesHelper.setString('smsMsg', value);
    debugPrint('Saving to Shared Preference');
  }

  static Future<SMSMessageTemplate?> getFromShared() async {
    String value = await SharedPreferencesHelper.getString('smsMsg');
    return value.isNotEmpty ? SMSMessageTemplate.fromJson(value) : null;
  }
}