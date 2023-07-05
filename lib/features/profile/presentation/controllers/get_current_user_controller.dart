import 'package:article_hub/core/data/source/remote/api_result.dart';
import 'package:article_hub/features/profile/domain/get_current_user_repo.dart';
import 'package:get/get.dart';

class GetCurrentUserController extends GetxController{
  ApiResponse apiResponse=ApiResponse();
  getCurrentUserDetail()async{
    apiResponse = await Get.find<GetCurrentUserRepo>().getCurrentUser();
  }
}