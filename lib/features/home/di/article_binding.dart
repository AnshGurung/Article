import 'package:article_hub/features/home/data/repository/article_repo_imple.dart';
import 'package:article_hub/features/home/domain/repository/article_repo.dart';
import 'package:get/instance_manager.dart';

import '../presentation/controller/article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put<ArticleRepo>(
    //   ArticleRepoImple(),
    // );

    Get.put(AritcleController());
  }
}
