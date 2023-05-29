import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:article_hub/core/presentation/utils/spacing.dart';
//import 'package:article_hub/features/home/presentation/widgets/tag_holder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleViewScreen extends StatefulWidget {
  const ArticleViewScreen({super.key});

  @override
  State<ArticleViewScreen> createState() => _ArticleViewScreenState();
}

String imgUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmu3k0J5WN0tWV_DamcnoMd4lMsYZoln6fEQ&usqp=CAU';

class _ArticleViewScreenState extends State<ArticleViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const ClampingScrollPhysics(),
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
                              radius: 63 / 2,
                              backgroundImage: imageProvider,
                            ),
                          ),
                          Spacing.sizedBoxWSmall,
                          Text('Paige Turner'),
                        ],
                      ),
                      const Icon(Icons.more_vert_rounded)
                    ],
                  ),
                  Spacing.sizedBoxHXtra,
                  Text(
                    'The Science of Happiness: Discovering the Keys to a Fulfilling Life',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Spacing.sizedBoxHLarge,
                  
                  Spacing.sizedBoxHLarge,
                  Text(
                    'Microsoft Corporation, founded by Bill Gates and Paul Allen in 1975, has a rich and influential history in the world of technology. Initially starting as a software development company, Microsoft gained recognition with the release of MS-DOS, the operating system for IBM PCs. ',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Spacing.sizedBoxHLarge,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text('15/10/5426'),
                  ),
                  Spacing.sizedBoxHXtra,
                  Center(
                    child: Text(
                      'Suddenly, a presence manifested, a malevolent force that consumed the cellar with darkness. Whispers grew louder, becoming agonized screams that echoed within their minds. The survivors found themselves trapped, their fate sealed within the clutches of the vengeful spirit.Days turned into nights, and the line between reality and nightmare blurred. Madness gripped their souls, each moment a torturous descent into horror. Their anguished cries echoed through the forest, unheard by the outside world.The tale of the ill-fated friends would become nothing more than a haunting legend, a cautionary tale passed down through generations. The cabin, forever cursed, would remain a grim reminder of the terrors that lie hidden in the depths of the unknown.And so, the spirits of the lost souls, eternally trapped in the cabin\'s sinister embrace, continued to torment any unfortunate soul who dared to venture into the cursed forest, ensuring that their horrifying tale would never be forgotten.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Spacing.sizedBoxHMax,
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: primaryColor1,
              ),
              child: Text(
                'This is the comment section, so don\'t forget to turn off your brain before reading all the comments, thank you!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
