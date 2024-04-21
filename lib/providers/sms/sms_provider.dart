// Define the SMSMessageTemplate class
import 'package:flutter/material.dart';

class SMSMessageTemplate {
  final String text;

  SMSMessageTemplate({required this.text});
}

class SMSMessageTemplateProvider extends ChangeNotifier {
  // Singleton instance
  static final SMSMessageTemplateProvider _instance = SMSMessageTemplateProvider._internal();

  // Private constructor for singleton
  SMSMessageTemplateProvider._internal();

  // Factory method to return the singleton instance
  factory SMSMessageTemplateProvider() {
    return _instance;
  }

  late SMSMessageTemplate _messageTemplate;

  // Getter for message template
  SMSMessageTemplate get messageTemplate => _messageTemplate;

  // Method to update message template text
  void updateMessageTemplate(String newText) {
    _messageTemplate = SMSMessageTemplate(text: newText);
    debugPrint('Saving Text: ${_messageTemplate.text}');
    notifyListeners();
  }
}