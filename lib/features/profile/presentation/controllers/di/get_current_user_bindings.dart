import 'package:article_hub/features/profile/data/repository/get_current_user_repo_impl.dart';
import 'package:article_hub/features/profile/data/source/remote/get_current_user_remote_data_source.dart';
import 'package:article_hub/features/profile/domain/get_current_user_repo.dart';
import 'package:article_hub/features/profile/presentation/controllers/get_current_user_controller.dart';
import 'package:get/get.dart';

class GetCurrentUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GetCurrentUserRemoteDataSource>(
      GetCurrentUserRemoteDataSourceImpl(),
    );
    Get.put<GetCurrentUserRepo>(
      GetCurrentUserRepoImpl(
        getCurrentUserRemoteDataSource:
            Get.find<GetCurrentUserRemoteDataSource>(),
      ),
    );
    Get.put(GetCurrentUserController());
  }
}
