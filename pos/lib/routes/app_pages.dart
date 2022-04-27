import 'package:get/get.dart';
import 'package:pos/bindings/auth_binding.dart';
import 'package:pos/screens/auth/login_screen.dart';
import 'package:pos/screens/home/home_screen.dart';
import 'package:pos/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final route = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashScreen(),
    ),
    // auth
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),

    // page
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
  ];
}
