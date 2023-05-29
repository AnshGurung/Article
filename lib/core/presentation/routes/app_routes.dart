import 'package:get/get.dart';

import '../../../features/auth/presentation/screens/login_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Route.signUp,
      page: () => const LoginScreen(),
    ),
  ];
}

class Route {
  static const signUp = "/signUp";
  static const login = "/login";
  static const home = "/home";
  static const splash = "/splash";
}
