import 'package:article_hub/features/auth/domain/repository/auth_implementation.dart';
import 'package:article_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:get/instance_manager.dart';
import '../presentation/controller/article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..put<AuthRepository>(AuthImplementation())
      ..put(ArticleController());
  }
}
