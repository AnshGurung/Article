import 'package:article_hub/core/presentation/theme/api_endpoints.dart';
import 'package:article_hub/features/home/data/model/request/post_article_model.dart';
import 'package:http/http.dart' as http;

abstract class AddArticleRemoteDataSource {
  Future<dynamic> addNewArticle(PostArticleRequest postArticle);
}

class AddArticleRemoteDataSourceImpl implements AddArticleRemoteDataSource {
  @override
  Future addNewArticle(PostArticleRequest postArticle) async {
    var repo = await http.post(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.articleEndPoints.articles),
      body: postArticle.toJson(),
    );
    print(repo.body);
  }
}
