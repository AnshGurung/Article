import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:get/instance_manager.dart';


class CoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController());
  }
}
