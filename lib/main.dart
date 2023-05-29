import 'package:article_hub/core/di/di.dart';
import 'package:article_hub/core/presentation/theme/app_theme.dart';
import 'package:article_hub/features/auth/presentation/screens/login_screen.dart';
import 'package:article_hub/features/home/presentation/dashboard/dashboard.dart';
import 'package:article_hub/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'features/auth/presentation/screens/splash_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
    );
  }
}
