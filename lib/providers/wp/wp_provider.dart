import 'package:flutter/material.dart';

class WPMessageTemplate {
  final String text;
  final String image;

  WPMessageTemplate({
    required this.text,
    required this.image
  });

}
class WPMessageTemplateProvider extends ChangeNotifier {
  static final WPMessageTemplateProvider _instance = WPMessageTemplateProvider._internal();

  factory WPMessageTemplateProvider() {
    return _instance;
  }

  WPMessageTemplateProvider._internal();

  late WPMessageTemplate _messageTemplate;

  // Getter for message template
  WPMessageTemplate get messageTemplate => _messageTemplate;

  // Method to update message template text
  void updateMessageTemplate(String newText, String imageUrl) {
    _messageTemplate = WPMessageTemplate(text: newText, image: imageUrl);
    notifyListeners();
  }
}
