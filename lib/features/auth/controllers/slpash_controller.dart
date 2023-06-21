import 'dart:async';

import 'package:article_hub/core/data/source/local/storage_constant.dart';
import 'package:article_hub/core/presentation/routes/app_pages.dart';
import 'package:article_hub/core/presentation/routes/app_routes.dart';
import 'package:article_hub/core/utils/sp_utils.dart';
import 'package:get/get.dart';

import '../../home/presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';

class SplashContoller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Timer(const Duration(seconds: 8), () {
    //   authorise();
    // });
  }

  SpUtils spUtils = SpUtils();
  Future<void> authorise() async {
    var token = await spUtils.getString(StorageConstant.accessToken);
    if (token != null) {
      Get.toNamed(Routes.home);
    } else {
      Get.toNamed(Routes.login);
    }
  }
}
