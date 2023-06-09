import 'package:article_hub/features/home/data/model/article_model.dart';
import 'package:article_hub/features/home/presentation/controller/article_controller.dart';
import 'package:article_hub/features/home/presentation/controller/like_unlike_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/presentation/theme/colours.dart';
import '../../../../core/presentation/utils/spacing.dart';

// ignore: must_be_immutable
class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final likeUnlikeController = Get.put(LikeUnlikeController());
    likeUnlikeController.isFavorited = article.isFavorited;

    return Container(
      padding: const EdgeInsets.all(20),
      //height: 250,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff958D82).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(-5, 5),
            spreadRadius: 0.25,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  article.author.profileImgUrl == null
                      ? const CircleAvatar(
                          backgroundColor: Colors.red,
                        )
                      : CachedNetworkImage(
                          imageUrl: article.author.profileImgUrl!,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                            radius: 55 / 2,
                          ),
                          placeholder: (context, url) => CircleAvatar(
                            radius: 55 / 2,
                            backgroundColor: grey300,
                          ),
                        ),
                  Spacing.sizedBoxWSmall,
                  SizedBox(
                    width: 200,
                    child: Text(
                      article.author.username!,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.more_vert),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.displayMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('dd/MM/yyyy').format(article.createdAt)),
              // Obx(
              //   () => IconButton(
              //     onPressed: () {
              //       article.isFavorited
              //           ? LikeUnlikeController().unlikeArticle(article.slug)
              //           : LikeUnlikeController().likeArticle(article.slug);
              //     },
              //     icon: article.isFavorited
              //         ? const Icon(Icons.favorite)
              //         : const Icon(Icons.favorite_border_outlined),
              //   ),
              // ),
              GetBuilder<ArticleController>(builder: (context) {
                return IconButton(
                  onPressed: () {
                    article.isFavorited
                        ? likeUnlikeController.unlikeArticle(article.slug)
                        : likeUnlikeController.likeArticle(article.slug);
                  },
                  icon: article.isFavorited
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border_outlined),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
