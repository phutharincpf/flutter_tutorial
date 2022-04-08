import 'package:posandroid101/constants/styles.dart';
import 'package:posandroid101/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posandroid101/widgets/appbar_widget.dart';

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
