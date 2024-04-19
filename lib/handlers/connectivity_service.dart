import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  static late ConnectivityResult? _connectionStatus;
  static final Connectivity _connectivity = Connectivity();

  // Function to show popup for no internet connection
  static Future<bool> isConnected() async {
    _connectionStatus = await _connectivity.checkConnectivity();
    return _connectionStatus != ConnectivityResult.none;
  }

  // Function to check internet connection and show popup if disconnected
  static Future<void> checkInternetConnection(BuildContext context) async {
    _connectionStatus = await _connectivity.checkConnectivity();
    if (_connectionStatus == ConnectivityResult.none) {
      if (context.mounted) {
        _showNoInternetPopup(context);
        // checkInternetConnection(context);
      }
    }
  }

  // Function to show popup for no internet connection
  static void _showNoInternetPopup(BuildContext localContext) {
    showDialog(
      context: localContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text('Please check your internet connection and try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}
