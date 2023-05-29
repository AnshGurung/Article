import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:get/get.dart';

class DependencyInjection{

  static void init(){
    Get.put<NetworkController>(NetworkController(),permanent: true);
  }
}