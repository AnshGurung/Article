import 'package:article_hub/core/di/di.dart';
import 'package:article_hub/core/presentation/theme/app_theme.dart';
import 'package:article_hub/features/auth/presentation/screens/login_screen.dart';
import 'package:article_hub/features/home/presentation/dashboard/dashboard.dart';
import 'package:article_hub/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'core/presentation/routes/app_pages.dart';
import 'core/presentation/routes/app_routes.dart';
import 'features/auth/presentation/screens/splash_screen.dart';
import 'features/home/presentation/screens/add_article_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
  // DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.initial,
      getPages: AppPages.routes,
      // initialRoute: LoginScreen(),
      //Routes.initial,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
    );
  }
}
