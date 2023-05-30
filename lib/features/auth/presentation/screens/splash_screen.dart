import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/theme/colours.dart';
import '../../controllers/slpash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = true;
    String imagePath = "assets/images/";
    String lightLogo = "BYTE-light.png";
    String darkLogo = "BYTE-dark.png";
    Get.put(SplashContoller());
    return Scaffold(
      backgroundColor: isLightTheme ? backgroundLight : backgroundDark,
      body: Center(
        child: Image.asset(
          imagePath + (isLightTheme ? lightLogo : darkLogo),
          height: 150,
        ),
      ),
    );
  }
}
