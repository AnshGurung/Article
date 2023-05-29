import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  RxBool isOnline = true.obs;
  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    isOnline.value = false;
    if (connectivityResult == ConnectivityResult.none) {
      print('---------Oops! No Internet Connection!---------');
      Get.rawSnackbar(
          messageText: const Text(
            'No Internet Connection!',
            style: TextStyle(color: Colors.white),
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red,
          icon: const Icon(
            Icons.wifi_off_rounded,
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(left: 20));
    } else {
      isOnline.value = true;
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
