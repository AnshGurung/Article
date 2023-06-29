import 'package:article_hub/features/home/data/repository/add_article_repo_impl.dart';
import 'package:article_hub/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:article_hub/features/home/presentation/controller/add_article_controller.dart';
import 'package:get/get.dart';

class AddNewArticleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AddArticleRemoteDataSource>(
      AddArticleRemoteDataSourceImpl(),
    );
    Get.put(
      AddArticleRepoImpl(
          addArticleRemoteDataSource: Get.find<AddArticleRemoteDataSource>()),
    );
    Get.put(AddArticleController());
  }
}
