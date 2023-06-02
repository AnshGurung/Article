import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
import 'package:article_hub/features/auth/presentation/widgets/text_box.dart';
import 'package:article_hub/features/home/presentation/widgets/tag_holder.dart';
//import 'package:article_hub/features/home/presentation/widgets/tag_holder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/model/article_model.dart';

// ignore: must_be_immutable
class AddArticleScreen extends StatelessWidget {
  const AddArticleScreen({
    super.key,
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
                    TextBox(hintText: 'Title'),
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
