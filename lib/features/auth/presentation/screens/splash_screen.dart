import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/slpash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashContoller());
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen is under devlopment!'),
      ),
    );
  }
}
