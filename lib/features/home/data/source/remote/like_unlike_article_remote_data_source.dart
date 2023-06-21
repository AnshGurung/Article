import 'package:article_hub/core/utils/sp_utils.dart';

abstract class LikeUnlikeArticleRemoteDataSource {
  likeArticle(String slug);

  unlikeArticle(String slug);
}

class LikeUnlikeArticleRemoteDataSourceImpl
    implements LikeUnlikeArticleRemoteDataSource {
  SpUtils spUtils = SpUtils();
  @override
  likeArticle(String slug) {}

  @override
  unlikeArticle(String slug) {}
}
