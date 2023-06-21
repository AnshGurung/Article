import 'package:article_hub/features/home/data/model/request/post_article_model.dart';

abstract class AddArticleRepo{
  addArticle(PostArticleRequest postArticle);
}