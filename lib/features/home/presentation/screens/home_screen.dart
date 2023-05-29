import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
import 'package:article_hub/features/auth/controllers/login_controller.dart';
import 'package:article_hub/features/auth/presentation/screens/login_screen.dart';
import 'package:article_hub/features/home/domain/repository/article_repo.dart';
import 'package:article_hub/features/home/presentation/controller/article_controller.dart';
import 'package:article_hub/features/home/presentation/screens/article_view_screen.dart';
import 'package:article_hub/features/home/presentation/widgets/article_card.dart';
import 'package:article_hub/features/home/presentation/widgets/greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController loginController = Get.put(LoginController());

  String imageUrl =
      'https://cdn3.vectorstock.com/i/1000x1000/03/72/beautiful-woman-profile-with-flowers-in-elegant-vector-20210372.jpg';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // final SharedPreferences prefs = await _prefs;
                          // prefs.clear();
                          // Get.offAll(const LoginScreen());
                          loginController.logOut();
                        },
                        child: GreetingWidget(),
                      ),
                      CircleAvatar(
                        radius: 63 / 2,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: GetBuilder<AritcleController>(
                    init: AritcleController(),
                    builder: (articleController) {
                      var articleList = articleController.articleInfo;

                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            Spacing.sizedBoxHMax,
                        shrinkWrap: true,
                        itemCount: articleList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(ArticleViewScreen());
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
                // GestureDetector(
                //   onTap: () async {
                //     await articleController.getArticles();
                //   },
                //   child: CircleAvatar(
                //     backgroundColor: primaryColor1,
                //     radius: 50,
                //     child: const Icon(
                //       Icons.bubble_chart,
                //       size: 60,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
