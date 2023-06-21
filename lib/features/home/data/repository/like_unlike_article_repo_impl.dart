import 'dart:convert';

import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:article_hub/features/home/data/source/remote/like_unlike_article_remote_data_source.dart';
import 'package:article_hub/features/home/domain/repository/like_unlike_article_repo.dart';
import 'package:get/get.dart';

class LikeUnlikeArticleRepoImpl implements LikeUnlikeArticleRepo {
  LikeUnlikeArticleRemoteDataSource likeUnlikeArticleRemoteDataSource;

  LikeUnlikeArticleRepoImpl({required this.likeUnlikeArticleRemoteDataSource});

  final NetworkController networkController = Get.put(NetworkController());

  @override
  likeArticle(String slug) async {
    if (networkController.isOnline.value) {
      try {
        final response =
            await likeUnlikeArticleRemoteDataSource.likeArticle(slug);
        var data = jsonDecode(response.toString());
      } on Exception catch (e) {
        print("If you are getting this error message, you are a NOOOOOB");
      }
    } else {
      print("Nope, still no internet");
    }
  }

  @override
  unlikeArticle(String slug) async {
    if (networkController.isOnline.value) {
      try {
        final response =
            await likeUnlikeArticleRemoteDataSource.unlikeArticle(slug);
        var data = jsonDecode(response.toString());
      } on Exception catch (e) {
        print(e);
      }
    } else {
      print("NO Internet!?!?");
    }
  }
}
