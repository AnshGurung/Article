import 'package:article_hub/features/auth/controllers/network_controller.dart';
import 'package:article_hub/features/auth/presentation/widgets/touch_blocker.dart';
import 'package:article_hub/features/home/presentation/screens/home_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/presentation/utils/spacing.dart';
import '../controller/article_controller.dart';

// ignore: must_be_immutable
class OfflineScreen extends StatelessWidget {
  OfflineScreen({super.key});

  AritcleController articleController = Get.put(AritcleController());
  NetworkController networkController = Get.put(NetworkController());
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double defaultSize = 350;
    double smallSize = 250;
    double assetSize = deviceWidth < 400 ? smallSize : defaultSize;

    RxBool isLoading = false.obs;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(23),
          child: GetBuilder<AritcleController>(
            builder: (aritcleController) {
              return ListView(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Lottie.asset(
                              'assets/animation/offline_animation.json',
                              height: assetSize,
                              width: assetSize,
                            ),
                            Text(
                              'No Internet Connection',
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                            Spacing.sizedBoxHSmall,
                            const Text(
                              'Oops! It seems the network is currently unavailable. Please check your connection and try again.',
                              textAlign: TextAlign.center,
                            ),
                            Spacing.sizedBoxHLarge,
                            GestureDetector(
                              onTap: () async {
                                isLoading.value = true;
                                if (networkController.isOnline.value) {
                                  Get.offAll(const HomeScreen());
                                  isLoading.value = false;
                                }
                                isLoading.value = false;
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 15),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Text(
                                  'Try again',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        isLoading.value
                            ? const TouchBlocker()
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
