import 'package:posandroid101/bindings/shopping_binding.dart';
import 'package:posandroid101/screens/cart/cart_screen.dart';
import 'package:posandroid101/screens/home/home_screen.dart';
import 'package:posandroid101/screens/payment/payment_screen.dart';
import 'package:posandroid101/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:posandroid101/screens/succeed/succeed_screen.dart';

part 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static const initial = Routes.main;

  static final route = [
    GetPage(
      name: Routes.main,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => const CartScreen(),
      binding: ShoppingBinding(),
    ),
    GetPage(
      name: Routes.payment,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: Routes.succeed,
      page: () => const SucceedScreen(),
    ),
  ];
}
