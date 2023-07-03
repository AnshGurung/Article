import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
import 'package:article_hub/features/home/presentation/controller/article_controller.dart';
import 'package:article_hub/features/home/presentation/effects/shimmer_effect_for_home.dart';
import 'package:article_hub/features/home/presentation/screens/article_view_screen.dart';
import 'package:article_hub/features/home/presentation/screens/offline_screen.dart';
import 'package:article_hub/features/home/presentation/widgets/article_card.dart';
import 'package:article_hub/features/home/presentation/widgets/greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../auth/controllers/network_controller.dart';
import 'add_article_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl =
      'https://cdn3.vectorstock.com/i/1000x1000/03/72/beautiful-woman-profile-with-flowers-in-elegant-vector-20210372.jpg';
  @override
  Widget build(BuildContext context) {
    ArticleController articleController = Get.find<ArticleController>();
    NetworkController networkController = Get.find<NetworkController>();
    bool isLoading = articleController.isLoading.value;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: GetBuilder<ArticleController>(
          builder: (context) {
            return RefreshIndicator(
              color: primaryColor1,
              onRefresh: () async {
                return await articleController.getArticles();
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23),
                  child: isLoading
                      ? const ShimmerEffectForHome()
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const GreetingWidget(),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed('/editProfileScreen');
                                    },
                                    child: CircleAvatar(
                                      radius: 63 / 2,
                                      backgroundImage: NetworkImage(imageUrl),
                                      backgroundColor: grey300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 34),
                              child: GetBuilder<ArticleController>(
                                init: ArticleController(),
                                builder: (articleController) {
                                  var articleList =
                                      articleController.articleInfo;

                                  return ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Spacing.sizedBoxHMax,
                                    shrinkWrap: true,
                                    itemCount: articleList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (networkController
                                              .isOnline.value) {
                                            Get.toNamed(
                                              '/articleView',
                                              arguments: articleList[index],
                                            );
                                          } else {
                                            if (Get.isSnackbarOpen) {
                                              Get.closeCurrentSnackbar();
                                            }
                                            Get.offAllNamed('/offlineScreen');
                                          }
                                        },
                                        child: ArticleCard(
                                          article: articleList[index],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Spacing.sizedBoxHMax,
                          ],
                        ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: isLoading
            ? const SizedBox()
            : Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff8563A2),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/addNewArticle');
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: primaryColor1,
                    child: Icon(
                      Icons.add,
                      color: backgroundLight,
                      size: 30,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
