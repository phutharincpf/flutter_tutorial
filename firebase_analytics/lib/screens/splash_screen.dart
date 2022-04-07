import 'package:firebase_analytics/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _validateAuthenticationAndRedirect();

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('กำลังโหลด...'),
      ),
    );
  }

  void _validateAuthenticationAndRedirect() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.offNamed(Routes.home);
  }
}
