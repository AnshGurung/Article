import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
import 'package:article_hub/features/home/presentation/widgets/tag_holder.dart';
//import 'package:article_hub/features/home/presentation/widgets/tag_holder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/model/article_model.dart';

// ignore: must_be_immutable
class ArticleViewScreen extends StatelessWidget {
  final Article articleModel;
  const ArticleViewScreen({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: primaryColor1,
                          child: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            size: 30,
                            color: backgroundLight,
                          ),
                        ),
                      ),
                    ),
                    Spacing.sizedBoxHXtra,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: imgUrl,
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundColor: grey300,
                                radius: 63 / 2,
                                backgroundImage:
                                    articleModel.author.profileImgUrl == null
                                        ? imageProvider
                                        : NetworkImage(
                                            articleModel.author
                                                .profileImgUrl!, // <--- AUTHOR PROFILE IMAGE HERE
                                          ),
                              ),
                            ),
                            Spacing.sizedBoxWSmall,
                            Text(articleModel
                                .author.username!), // <--- AUTHOR USERNAME HERE
                          ],
                        ),
                        const Icon(Icons.more_vert_rounded)
                      ],
                    ),
                    Spacing.sizedBoxHXtra,
                    Text(
                      articleModel.title, // <--- ARTICLE TITLE HERE
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Spacing.sizedBoxHLarge,
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: articleModel.tags.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            Spacing.sizedBoxWMedium,
                        itemBuilder: (context, index) {
                          return TagHolder(tag: articleModel.tags[index]); // <--- ARTICLE TAGS
                        },
                      ),
                    ),
                    Spacing.sizedBoxHLarge,
                    Text(
                      articleModel.description, // <--- ARTICLE DESCRIPTION HERE
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Spacing.sizedBoxHLarge,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(articleModel
                            .createdAt), // <--- ARTICLE CREATED AT HERE
                      ),
                    ),
                    Spacing.sizedBoxHXtra,
                    Center(
                      child: Text(
                        articleModel.body,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Spacing.sizedBoxHMax,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
