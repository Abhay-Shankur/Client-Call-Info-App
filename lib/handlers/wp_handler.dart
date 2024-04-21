import 'package:call_info/handlers/api_handler.dart';
import 'package:call_info/firebaseHandlers/firebase_firestore.dart';
import 'package:call_info/providers/wp/wp_shared.dart';
import 'package:flutter/cupertino.dart';

Future<Map<String, dynamic>> sendWP({
  required String phone,
}) async {

  try {
    WPMessageTemplate? _messageTemplate = await WPMessageTemplate.getFromShared();

    if(_messageTemplate != null) {
      var firestore = FirestoreOperations();
      Map<String, dynamic> res = await firestore.readFirestoreData("USERS", "abhay");
      // res = res['Message'] as Map<String, dynamic>;
      firestore.closeConnection();

      var authority = 'takesolution.co.in';
      var path = '/sendMessage.php';
      var requestBody = {
        'AUTH_KEY': res['AUTH_KEY'].toString(),
        'instance_id': res['instance_id'].toString(),
        'img': _messageTemplate.image,
        'message': _messageTemplate.text,
        'phone': phone,
      };

      var url = Uri.https(authority, path, requestBody);
      debugPrint("API: $url");
      return await ApiHandler.getRequest(url);
    } else {
      debugPrint('Empty body');
      return {"Error" : "Empty Body"};
    }
  } catch (e) {
    debugPrint("Error while Sending Whatsapp: $e");
    return {"Error" : "Error while Sending Whatsapp: $e"};
  }
}

