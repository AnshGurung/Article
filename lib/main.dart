import 'package:article_hub/core/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'core/presentation/routes/app_pages.dart';
import 'core/presentation/routes/app_routes.dart';

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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
    );
  }
}
