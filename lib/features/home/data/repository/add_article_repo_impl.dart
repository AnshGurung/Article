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
  addArticle(PostArticleRequest postArticle) async {
    if (networkController.isOnline.value) {
      try {
        final response =
            await addArticleRemoteDataSource.addNewArticle(postArticle);
        var data = jsonDecode(response.toString());
        return ApiResponse(data: data);
      } catch (error) {
        print("lul: $error");
      }
    }
  }
}
