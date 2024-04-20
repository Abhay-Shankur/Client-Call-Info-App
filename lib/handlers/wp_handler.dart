import 'package:call_info/handlers/api_handler.dart';
import 'package:call_info/handlers/firebase_firestore.dart';
import 'package:flutter/cupertino.dart';

Future<Map<String, dynamic>> sendWP({
  required String message,
  required String phone,
}) async {

  try {
    var firestore = FirestoreOperations();
    Map<String, dynamic> res = await firestore.readFirestoreData("USERS", "dummy");
    // res = res['Message'] as Map<String, dynamic>;
    firestore.closeConnection();

    var authority = 'takesolution.co.in';
    var path = '/sendMessage.php';
    var requestBody = {
      'AUTH_KEY': res['AUTH_KEY'].toString(),
      'instance_id': res['instance_id'].toString(),
      'message': message,
      'phone': phone,
    };

    var url = Uri.https(authority, path, requestBody);
    debugPrint("API: $url");
    return await ApiHandler.getRequest(url);
  } catch (e) {
    debugPrint("Error while Sending Whatsapp: $e");
    return {"Error" : "Error while Sending Whatsapp: $e"};
  }
}

