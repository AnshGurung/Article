import 'package:article_hub/features/auth/controllers/login_controller.dart';
import 'package:article_hub/features/auth/controllers/signup_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put(SignUpController(), permanent: true);
  }
}
