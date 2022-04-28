import 'package:get/get.dart';
import 'package:pos_android/bindings/auth_binding.dart';
import 'package:pos_android/screens/auth/login_screen.dart';
import 'package:pos_android/screens/error/error_device_screen.dart';
import 'package:pos_android/screens/home/home_screen.dart';
import 'package:pos_android/screens/payment/payment_done_screen.dart';
import 'package:pos_android/screens/payment/payment_screen.dart';
import 'package:pos_android/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.initial;

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
    GetPage(
      name: Routes.payment,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: Routes.paymentDone,
      page: () => const PaymentDoneScreen(),
    ),


    GetPage(
      name: Routes.errorDevice,
      page: () => const ErrorDeviceScreen(),
    ),
  ];
}
