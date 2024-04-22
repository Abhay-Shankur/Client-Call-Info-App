import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiHandler {

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      // Successful response, parse and return the data
      return jsonDecode(response.body);
    } else {
      // Error response, return an error map
      debugPrint('API Error: ${response.statusCode} - ${response.reasonPhrase}');
      return {'error': 'API request failed with status code ${response.statusCode}'};
    }
    // return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> postRequest(String endPoint, Map<String, dynamic> requestBody) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      // Now, proceed with the main request
      final response = await http.post(
        Uri.parse(endPoint),
        headers: headers,
        body: jsonEncode(requestBody),
      );

      return _handleResponse(response);
    } catch (e) {
      debugPrint('Error during API call: $e');
      return {'error': 'An error occurred during the POST API call.'};
    }
  }

  static Future<int> getRequest(Uri url) async {
    try {
      final response = await http.get(url);
      Map<String, dynamic> res = await _handleResponse(response);
      debugPrint('${res.toString()}');
      return response.statusCode;
    } catch (e) {
      debugPrint('Error during API call: $e');
      return 3812;
      // return {'error': 'An error occurred during the GET API call.'};
    }
  }
}