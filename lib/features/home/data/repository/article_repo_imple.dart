import 'dart:convert';

import 'package:article_hub/core/presentation/theme/api_endpoints.dart';
import 'package:article_hub/features/home/data/model/article_model.dart';
import 'package:get/get.dart';

import '../../../../core/data/source/remote/api_result.dart';
import 'package:http/http.dart' as http;

import '../model/author_model.dart';

class ArticleRepoImple {
  List<Article> articles = [];
  Future<ApiResponse> getArticles() async {
    print("******************   object");

    var response = await http.get(
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.articleEndPoints.articles),
    );
    var jsonData = jsonDecode(response.body);

    for (var eachArticle in jsonData['articles']) {
      final article = Article(
        title: eachArticle['title'],
        slug: eachArticle['slug'],
        author: Author.fromJson(eachArticle['author']),
        createdAt: DateTime.parse(eachArticle['createdAt']),
        description: eachArticle['description'],
        body: eachArticle['body'],
      );
      articles.add(article);
    }
    print('################################3  ${articles.length}');

    return ApiResponse(data: articles);
  }
}
