import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _validateAuthenticationAndRedirect(context);



    return Scaffold(
      backgroundColor: Styles.mainColor,
      body: Center(
        child: Text('กำลังโหลด...', style: Styles.title),
      ),
    );
  }

  void _validateAuthenticationAndRedirect(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3), () {});


    if( !context.isTablet ){
      Get.offAllNamed(Routes.errorDevice);
    }
    else {
      Get.offAllNamed(Routes.login);
    }
  }
}
