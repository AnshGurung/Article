import 'dart:async';

import 'package:article_hub/core/utils/constant.dart';
import 'package:article_hub/core/utils/sp_utils.dart';
import 'package:get/get.dart';

import '../../home/presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';

class SplashContoller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      authorise();
    });
  }

  SpUtils spUtils = SpUtils();
  Future<void> authorise() async {
    var token = await spUtils.getString(Constant.token);
    if (token != null) {
      Get.offAll(const HomeScreen());
    } else {
      Get.offAll(const LoginScreen());
    }
  }
}
