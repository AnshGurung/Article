//import 'package:article_hub/features/home/domain/repository/article_repo.dart';
import 'package:get/get.dart';
import '../../data/model/article_model.dart';
import '../../data/repository/article_repo_imple.dart';

class AritcleController extends GetxController {
  ArticleRepoImple articleRepo = ArticleRepoImple();
  @override
  onInit() async {
    super.onInit();
    await getArticles();
  }

  List<Article> _articleList = [];
  get articleInfo => _articleList;
  set setArticleInfo(List<Article> data) {
    _articleList = data;
    update();
  }

  Future<void> getArticles() async {
    print("_-------------  ----------- getArticle Called");
    var response = await articleRepo.getArticles();
    if (response.hasData) {
      setArticleInfo = response.data as List<Article>;
    } else {
      print("error");
    }
  }
}
