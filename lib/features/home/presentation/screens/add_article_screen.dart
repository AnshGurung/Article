import 'package:article_hub/core/controller/core_controller.dart';
import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
import 'package:article_hub/features/auth/presentation/widgets/text_box.dart';
import 'package:article_hub/features/home/data/source/remote/add_new_article_remote_data_source.dart';
import 'package:article_hub/features/home/presentation/controller/add_article_controller.dart';
import 'package:article_hub/features/home/presentation/widgets/tag_holder.dart';
//import 'package:article_hub/features/home/presentation/widgets/tag_holder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddArticleScreen extends StatelessWidget {  
  AddArticleScreen({
    super.key,
  });

  final AddArticleController addArticleController =
      Get.put(AddArticleController());
  //final AddArticleRemoteDataSource addArticleRemoteDataSource=Get.put(AddArticleRemoteDataSource());
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
                    TextBox(
                      hintText: 'Title',
                      textController:
                          addArticleController.articleTitleController,
                    ),
                    Spacing.sizedBoxHLarge,
                    TextBox(
                      hintText: 'Description',
                      textController:
                          addArticleController.articleDescriptionController,
                    ),
                    Spacing.sizedBoxHLarge,
                    TextBox(
                      hintText: 'Body',
                      textController:
                          addArticleController.articleBodyController,
                    ),
                    Spacing.sizedBoxHLarge,
                    Row(
                      children: [
                        Expanded(
                          child: TextBox(
                            hintText: 'Tags',
                            textController:
                                addArticleController.articleTagListController,
                          ),
                        ),
                        Spacing.sizedBoxWMedium,
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 15, vertical: 19),
                        //     decoration: BoxDecoration(
                        //       color: primaryColor1,
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Text(
                        //       '+ Add Tag',
                        //       style: TextStyle(
                        //         color: backgroundLight,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    // tags.isNotEmpty
                    //     ? Column(
                    //         children: [
                    //           Spacing.sizedBoxHLarge,
                    //           SizedBox(
                    //             height: 40,
                    //             child: ListView.separated(
                    //               scrollDirection: Axis.horizontal,
                    //               separatorBuilder:
                    //                   (BuildContext context, index) =>
                    //                       Spacing.sizedBoxWSmall,
                    //               itemCount: tags.length,
                    //               itemBuilder: (context, index) {
                    //                 return TagHolder(tag: tags[index]);
                    //               },
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     : const SizedBox(),
                    Spacing.sizedBoxHLarge,
                    GestureDetector(
                      onTap: () {
                        addArticleController.publishArticle();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                          color: primaryColor1,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff4E1B7B).withOpacity(0.6),
                              blurRadius: 12,
                              offset: const Offset(2, 5),
                              spreadRadius: 0.25,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Publish Article',
                            style: TextStyle(
                              color: backgroundLight,
                            ),
                          ),
                        ),
                      ),
                    ),
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
