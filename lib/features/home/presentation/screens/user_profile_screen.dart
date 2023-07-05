import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;
    String randomness =
        'In the land of purple moonbeans, the fluffy walruses danced the tango with bubblegum bumblebees while singing operatic lullabies to coconut-shaped clouds. ';
    String textt = 'hi.';
    String imageUrl =
        'https://image.lexica.art/full_jpg/7515495b-982d-44d2-9931-5a8bbbf27532';
    List articles = [
      'noooo',
      'oops',
      'cam',
      'jam',
      'dam',
      'fam',
      'sam',
      'ram',
      'pam',
      'ham',
    ];
    final PageController pageController = PageController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
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
                      Text(
                        'Your profile',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: CircleAvatar(
                          backgroundColor: primaryColor1,
                          child: Icon(
                            Icons.edit,
                            size: 25,
                            color: backgroundLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                        radius: 45,
                      ),
                      placeholder: (context, url) => CircleAvatar(
                        backgroundColor: grey300,
                        radius: 45,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Abraham Lincoln',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    textt,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: currentPageIndex == 0
                                ? primaryColor1
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: currentPageIndex == 0
                                  ? Colors.transparent
                                  : primaryColor1,
                            ),
                          ),
                          child: Text(
                            'My articles',
                            style: currentPageIndex == 0
                                ? TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: backgroundLight,
                                  )
                                : TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: primaryColor1,
                                  ),
                          ),
                        ),
                      ),
                      Spacing.sizedBoxWSmall,
                      GestureDetector(
                        onTap: () {
                          pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            color: currentPageIndex == 1
                                ? primaryColor1
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: currentPageIndex == 1
                                  ? Colors.transparent
                                  : primaryColor1,
                            ),
                          ),
                          child: Text(
                            'Favorites',
                            style: currentPageIndex == 1
                                ? TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: backgroundLight,
                                  )
                                : TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: primaryColor1,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.90,
                  child: PageView(
                    onPageChanged: (index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    controller: pageController,
                    children: [
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            Spacing.sizedBoxHMax,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Text(articles[index]),
                          );
                        },
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          color: backgroundDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
