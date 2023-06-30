import 'package:article_hub/core/data/source/remote/api_result.dart';
import 'package:article_hub/core/utils/flutter_toast.dart';
import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:article_hub/features/home/data/model/request/post_article_model.dart';
import 'package:article_hub/features/home/data/repository/add_article_repo_impl.dart';
import 'package:article_hub/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:article_hub/features/home/presentation/controller/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddArticleController extends GetxController {
  late ArticleRequestInfo articles;
  late PostArticleRequest postArticle;
  List<String> tagList = [];
  NetworkController networkController = Get.put(NetworkController());
  ArticleController articleController = Get.put(ArticleController());

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

    var articles = ArticleRequestInfo(
      title: articleTitleController.text,
      description: articleDescriptionController.text,
      body: articleBodyController.text,
      tagList: tagList,
    );

    var response = await addArticleRepoImpl
        .addArticle(PostArticleRequest(article: articles));
    if (response.hasData) {
      showToast(response.data.toString());
      articleController.getArticles();
      Get.back();
    } else {
      showFailureToast(response.error.toString());
    }
  }
}
