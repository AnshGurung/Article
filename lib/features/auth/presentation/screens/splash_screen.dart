import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/theme/colours.dart';
import '../../controllers/slpash_controller.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //splashController.authorise();
      Future.delayed(
        const Duration(seconds: 5),
        () => Get.find<SplashContoller>().authorise(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = true;
    String imagePath = "assets/images/";
    String lightLogo = "BYTE-light.png";
    String darkLogo = "BYTE-dark.png";

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
