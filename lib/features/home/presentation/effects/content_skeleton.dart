import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/utils/spacing.dart';

// ignore: must_be_immutable
class TextSkeleton extends StatelessWidget {
  TextSkeleton({
    super.key,
    required this.shimmerWidth,
  });

  double shimmerWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 20,
      color: grey300,
    );
  }
}

class ContainerSkeleton extends StatelessWidget {
  const ContainerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      //height: 250,
      decoration: BoxDecoration(
        color: grey300,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //AUTHOR'S PROFILE PIC SILHOUETTE
              CircleAvatar(
                backgroundColor: backgroundLight,
                radius: 55 / 2,
              ),
              Spacing.sizedBoxWSmall,

              //AUTHOR'S NAME SILHOUETTE
              Container(
                height: 15,
                width: 100,
                color: backgroundLight,
              ),
            ],
          ),

          //ARTICLE TITLE SILHOUETTE
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              children: [
                Container(
                  height: 20,
                  color: backgroundLight,
                ),
                Spacing.sizedBoxHSmall,
                Container(
                  height: 20,
                  color: backgroundLight,
                ),
              ],
            ),
          ),

          //UPLOADED DATE SILHOUETTE
          Container(
            height: 15,
            width: 100,
            color: backgroundLight,
          ),
        ],
      ),
    );
  }
}
