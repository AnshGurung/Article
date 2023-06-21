import 'package:article_hub/features/home/data/repository/like_unlike_article_repo_impl.dart';
import 'package:article_hub/features/home/data/source/remote/like_unlike_article_remote_data_source.dart';
import 'package:get/get.dart';

class LikeUnlikeController extends GetxController {
  LikeUnlikeArticleRepoImpl likeUnlikeArticleRepoImpl =
      LikeUnlikeArticleRepoImpl(
          likeUnlikeArticleRemoteDataSource:
              Get.find<LikeUnlikeArticleRemoteDataSource>());

  likeArticle(String slug) async {
    await likeUnlikeArticleRepoImpl.likeArticle(slug);
    update();
  }

  unlikeArticle(String slug) async {
    await likeUnlikeArticleRepoImpl.unlikeArticle(slug);
    update();
  }
}
