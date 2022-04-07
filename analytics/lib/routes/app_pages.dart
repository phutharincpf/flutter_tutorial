import 'package:analytics/screens/home/home_screen.dart';
import 'package:analytics/screens/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static const initial = Routes.main;

  static final route = [
    GetPage(
      name: Routes.main,
      page: () => const SplashScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
