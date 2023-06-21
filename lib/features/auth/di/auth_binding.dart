import 'package:article_hub/features/auth/controllers/auth_controller.dart';
import 'package:article_hub/features/auth/controllers/slpash_controller.dart';
import 'package:article_hub/features/auth/domain/repository/auth_implementation.dart';
import 'package:article_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put<AuthRepository>(AuthImplementation())
      ..put<AuthController>(AuthController())
      ..put<SplashContoller>(SplashContoller());
  }
}
