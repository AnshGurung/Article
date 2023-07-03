import 'dart:convert';

import 'package:article_hub/core/data/source/local/storage_constant.dart';
import 'package:article_hub/core/presentation/theme/api_endpoints.dart';
import 'package:article_hub/core/utils/sp_utils.dart';
import 'package:article_hub/features/home/data/model/article_model.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/remote/api_result.dart';
import 'package:http/http.dart' as http;

import '../model/author_model.dart';

class ArticleRepoImple {
  Future<ApiResponse> getArticles() async {
    List<Article> articles = [];

    SpUtils spUtils = SpUtils();
    var token = await spUtils.getString(StorageConstant.accessToken);
    var response = await http.get(
        Uri.parse(
            ApiEndPoints.baseUrl + ApiEndPoints.articleEndPoints.articles),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        });
    var jsonData = jsonDecode(response.body);

    for (var eachArticle in jsonData['articles']) {
      final article = Article(
        title: eachArticle['title'],
        slug: eachArticle['slug'],
        author: Author.fromJson(eachArticle['author']),
        createdAt: DateTime.parse(eachArticle['createdAt']),
        description: eachArticle['description'],
        body: eachArticle['body'],
        tags: eachArticle['tagList'],
        isFavorited: eachArticle['favorited'],
      );
      articles.add(article);
    }

    return ApiResponse(data: articles);
  }
}
