import 'package:pos/constants/styles.dart';
import 'package:pos/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _validateAuthenticationAndRedirect();

    return Scaffold(
      backgroundColor: Styles.mainColor,
      body: const Center(
        child: Text('กำลังโหลด...'),
      ),
    );
  }

  void _validateAuthenticationAndRedirect() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.offAllNamed(Routes.login);
  }
}
