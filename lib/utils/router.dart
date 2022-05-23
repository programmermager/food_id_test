import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/splash/splash_screen.dart';

class Router {
  static final route = [
    GetPage(
      name: '/splashScreen',
      page: () => const SplashScreen(),
    ),
  ];
}