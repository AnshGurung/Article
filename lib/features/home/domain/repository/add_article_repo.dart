import 'package:article_hub/core/data/source/remote/api_result.dart';
import 'package:article_hub/features/home/data/model/request/post_article_model.dart';

abstract class AddArticleRepo {
  Future<ApiResponse> addArticle(PostArticleRequest postArticle);
}
