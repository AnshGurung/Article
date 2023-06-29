import 'dart:convert';

import 'package:article_hub/core/data/source/local/storage_constant.dart';
import 'package:article_hub/core/data/source/remote/api_result.dart';
import 'package:article_hub/core/presentation/theme/api_endpoints.dart';
import 'package:article_hub/core/utils/sp_utils.dart';
import 'package:article_hub/features/home/data/model/request/post_article_model.dart';
import 'package:http/http.dart' as http;

abstract class AddArticleRemoteDataSource {
  Future<ApiResponse> addNewArticle(PostArticleRequest postArticle);
}

class AddArticleRemoteDataSourceImpl implements AddArticleRemoteDataSource {
  @override
  Future<ApiResponse> addNewArticle(PostArticleRequest postArticle) async {
    try {
      var postdata = postArticle.toJson();
      SpUtils spUtils = SpUtils();
      var token = await spUtils.getString(StorageConstant.accessToken);
      var repo = await http.post(
          Uri.parse(
              ApiEndPoints.baseUrl + ApiEndPoints.articleEndPoints.articles),
          body: jsonEncode(postdata),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Token $token',
          });

      return ApiResponse(data: repo);
    } catch (error) {
      print(error.toString());
      return ApiResponse(error: error.toString());
    }
  }
}
