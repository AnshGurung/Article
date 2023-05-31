import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/features/home/presentation/effects/content_skeleton.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/utils/spacing.dart';

class ShimmerEffectForHome extends StatelessWidget {
  const ShimmerEffectForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextSkeleton(
                shimmerWidth: 0.4,
              ),
              CircleAvatar(
                radius: 63 / 2,
                backgroundColor: shimmerColor,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 34),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                Spacing.sizedBoxHMax,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ContainerSkeleton();
            },
          ),
        ),
        Spacing.sizedBoxHMax,
      ],
    );
  }
}
