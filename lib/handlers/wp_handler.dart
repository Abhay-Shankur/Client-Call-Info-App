import 'package:call_info/handlers/api_handler.dart';
import 'package:call_info/handlers/shared_preferences_helper.dart';
import 'package:call_info/providers/wp/wp_shared.dart';
import 'package:call_info/util/custom_widgets.dart';
import 'package:flutter/cupertino.dart';


class WhatsappHandler {

  static Future<bool> sendWP({required String phone}) async {
    try {
      await SharedPreferencesHelper.reload();
      WPMessageTemplate? messageTemplate = await WPMessageTemplate.getFromShared();
      bool allowed = await SharedPreferencesHelper.getBool("allowWP") ?? false;

      if(allowed) {
        if(messageTemplate == null) {
          showNotification('Call Infos', 'Whatsapp Template is Empty.');
          return false;
        }

        String authKey = await SharedPreferencesHelper.getString("AUTH_KEY");
        String instanceId = await SharedPreferencesHelper.getString("instance_id") ;
        var authority = 'takesolution.co.in';
        var path = '/sendMessage.php';
        var requestBody = {
          'AUTH_KEY': authKey,
          'instance_id': instanceId,
          'img': messageTemplate.image,
          'message': messageTemplate.text,
          'phone': phone,
        };

        var url = Uri.https(authority, path, requestBody);
        debugPrint("API: $url");

        return 200 == await ApiHandler.getRequest(url);
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Error while Sending Whatsapp: $e");
      return false;
    }
  }

}
