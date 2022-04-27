import 'package:pos_layout/constants/styles.dart';
import 'package:pos_layout/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_layout/widgets/appbar_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _validateAuthenticationAndRedirect();

    return Scaffold(
      backgroundColor: Styles.mainColor,
      body: Column(
        children: const [
          AppbarWidget(
            automaticallyImplyLeading: false,
            title: 'POS 101',
          ),
          Expanded(
            child: Center(
              child: Text('กำลังโหลด...'),
            ),
          ),
        ],
      ),
    );
  }

  void _validateAuthenticationAndRedirect() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.offAllNamed(Routes.home);
  }
}
