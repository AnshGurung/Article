import 'package:article_hub/core/di/core_binding.dart';
import 'package:article_hub/core/presentation/routes/app_routes.dart';
import 'package:article_hub/features/auth/di/auth_binding.dart';
import 'package:article_hub/features/auth/di/login_binding.dart';
import 'package:article_hub/features/auth/presentation/screens/login_screen.dart';
import 'package:article_hub/features/auth/presentation/screens/splash_screen.dart';
import 'package:article_hub/features/home/di/article_binding.dart';
import 'package:article_hub/features/home/presentation/controller/di/add_new_article_bindings.dart';
import 'package:article_hub/features/home/presentation/controller/di/like_unlike_bindings.dart';
import 'package:article_hub/features/home/presentation/screens/add_article_screen.dart';
import 'package:article_hub/features/home/presentation/screens/article_view_screen.dart';
import 'package:article_hub/features/home/presentation/screens/home_screen.dart';
import 'package:article_hub/features/home/presentation/screens/offline_screen.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Path.splashScreen,
      page: SplashScreen.new,
      bindings: [
        CoreBinding(),
        AuthBinding(),
        LoginBinding(),
        ArticleBinding(),
        LikeUnlikeBindings(),
        AddNewArticleBindings(),
      ],
    ),
    GetPage(
      name: Path.register,
      page: LoginScreen.new,
      bindings: [],
    ),
    GetPage(
      name: Path.home,
      page: () => const HomeScreen(),
      bindings: [
        ArticleBinding(),
        LikeUnlikeBindings(),
      ],
    ),
    GetPage(
      name: Path.articleView,
      page: () => ArticleViewScreen(
        articleModel: Get.arguments,
      ),
      bindings: [],
    ),
    GetPage(
      name: Path.addArticleScreen,
      page: AddArticleScreen.new,
      bindings: [
        
      ],
    ),
    GetPage(
      name: Path.offlineScreen,
      page: OfflineScreen.new,
      bindings: [],
    ),
  ];
}
