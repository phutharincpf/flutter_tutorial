import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/hotkey_controller.dart';
import 'package:pos_android/routes/app_pages.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _bindingData(context);

    return Scaffold(
      backgroundColor: Styles.mainColor,
      body: Center(
        child: Text('LandingPage...', style: Styles.title),
      ),
    );
  }

  void _bindingData(BuildContext context) async {
      await Future.delayed(const Duration(seconds: 3), () {});

      HotKeyController hotKeyController = Get.find();
      hotKeyController.init();

      Get.offAllNamed(Routes.home);
  }
}
