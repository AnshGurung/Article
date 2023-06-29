import 'dart:convert';
import 'package:article_hub/core/data/source/remote/api_result.dart';
import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:article_hub/features/home/data/model/request/post_article_model.dart';
import 'package:article_hub/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:get/get.dart';
import '../../domain/repository/add_article_repo.dart';

class AddArticleRepoImpl implements AddArticleRepo {
  AddArticleRemoteDataSource addArticleRemoteDataSource;
  AddArticleRepoImpl({required this.addArticleRemoteDataSource});

  NetworkController networkController = Get.put(NetworkController());

  @override
  Future<ApiResponse> addArticle(PostArticleRequest postArticle) async {
    if (networkController.isOnline.value) {
      try {
        final result =
            await addArticleRemoteDataSource.addNewArticle(postArticle);
        var response = result.data;

        if (response.statusCode == 200 || response.statusCode == 201) {
          return ApiResponse(data: 'Successfully published');
        } else {
          var data = jsonDecode(response.body)['message'];

          return ApiResponse(error: data);
        }
      } //
      catch (error) {
        return ApiResponse(error: error);
      }
    } //
    else {
      return ApiResponse(error: "No Internet Connection");
    }
  }
}
