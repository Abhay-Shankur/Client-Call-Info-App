import 'package:call_info/handlers/api_handler.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/providers/wp/wp_shared.dart';
import 'package:flutter/cupertino.dart';

Future<bool> sendWP({
  required String phone,
}) async {

  try {
    WPMessageTemplate? _messageTemplate = await WPMessageTemplate.getFromShared();
    bool? allowed = await SharedPreferencesHelper.getBool("allowWP");
    if(_messageTemplate != null && allowed !=null && allowed) {
      String authKey = await SharedPreferencesHelper.getString("AUTH_KEY");
      String instanceId = await SharedPreferencesHelper.getString("instance_id") ;
      var authority = 'takesolution.co.in';
      var path = '/sendMessage.php';
      var requestBody = {
        'AUTH_KEY': authKey,
        'instance_id': instanceId,
        'img': _messageTemplate.image,
        'message': _messageTemplate.text,
        'phone': phone,
      };

      var url = Uri.https(authority, path, requestBody);
      debugPrint("API: $url");

      return 200 == await ApiHandler.getRequest(url);
    } else {
      debugPrint('Empty body');
      return false;
    }
  } catch (e) {
    debugPrint("Error while Sending Whatsapp: $e");
    return false;
  }
}

