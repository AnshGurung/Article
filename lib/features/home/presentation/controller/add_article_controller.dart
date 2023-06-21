import 'package:article_hub/core/data/source/remote/api_result.dart';
import 'package:article_hub/features/home/data/model/request/post_article_model.dart';
import 'package:article_hub/features/home/data/repository/add_article_repo_impl.dart';
import 'package:article_hub/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddArticleController extends GetxController {
  late ArticleRequestInfo articles;
  late PostArticleRequest postArticle;
  List<String> tagList = [];

  TextEditingController articleTitleController = TextEditingController();
  TextEditingController articleDescriptionController = TextEditingController();
  TextEditingController articleBodyController = TextEditingController();
  TextEditingController articleTagListController = TextEditingController();

  AddArticleRepoImpl addArticleRepoImpl = AddArticleRepoImpl(
    addArticleRemoteDataSource: Get.find<AddArticleRemoteDataSource>(),
  );

  ApiResponse apiResponse = ApiResponse();

  publishArticle() async {
    tagList = articleTagListController.text.split(" ");

    articles = ArticleRequestInfo(
      title: articleTitleController.text,
      description: articleDescriptionController.text,
      body: articleBodyController.text,
      tagList: tagList,
    );

    postArticle = PostArticleRequest(article: articles);

    apiResponse = await addArticleRepoImpl.addArticle(postArticle);
  }
}
