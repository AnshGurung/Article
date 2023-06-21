import 'package:article_hub/features/home/data/repository/like_unlike_article_repo_impl.dart';
import 'package:article_hub/features/home/data/source/remote/like_unlike_article_remote_data_source.dart';
import 'package:article_hub/features/home/domain/repository/like_unlike_article_repo.dart';
import 'package:article_hub/features/home/presentation/controller/like_unlike_controller.dart';
import 'package:get/get.dart';

class LikeUnlikeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LikeUnlikeArticleRemoteDataSource>(
      LikeUnlikeArticleRemoteDataSourceImpl(),
    );
    Get.put<LikeUnlikeArticleRepo>(
      LikeUnlikeArticleRepoImpl(
        likeUnlikeArticleRemoteDataSource:
            Get.find<LikeUnlikeArticleRemoteDataSource>(),
      ),
    );
    Get.put(LikeUnlikeController());
  }
}
