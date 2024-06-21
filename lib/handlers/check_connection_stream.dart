import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CheckConnectionStream extends GetxController {
  bool isModalEnable = false;
  final loadingCheckConnectivity = false.obs;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();

      loadingCheckConnectivity.value = false;
    } on PlatformException {
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;

    if (result == ConnectivityResult.none) {
      if (isModalEnable != true) {
        isModalEnable = true;
        showDialogIfNotConnect();
      }
    } else {
      if (isModalEnable) {
        Get.back();
      }
      isModalEnable = false;
    }
  }

  showDialogIfNotConnect() {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "check your network".tr,
        onWillPop: () async {
          return false;
        },
        middleText: "Your device is not currently connected to the Internet".tr,
        titleStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        middleTextStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        radius: 30,
        actions: [
          Obx(() => loadingCheckConnectivity.value
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    loadingCheckConnectivity.value = true;
                    EasyDebounce.debounce(
                        'check connectivity',

                        const Duration(milliseconds: 1000), () async {
                      await initConnectivity();
                    });
                  },
                  child: Text(
                    'try again'.tr,
                    style: const TextStyle(color: Colors.white),
                  ),
              )
          )
        ]);
  }

  @override
  void onInit() {
    super.onInit();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}