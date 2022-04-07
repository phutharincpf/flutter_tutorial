import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posandroid101/constants/styles.dart';
import 'package:posandroid101/routes/app_pages.dart';
import 'package:posandroid101/widgets/appbar_widget.dart';
import 'package:posandroid101/widgets/button_widget.dart';

class SucceedScreen extends StatelessWidget {
  const SucceedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // const int ticks = 10;
    // int stream = Stream<int>.periodic(const Duration(seconds: 1), (x) => ticks - x % (ticks + 1) ).listen((value) => value);

    int countdown = 10;
    bool isClose = false;

    void _countdownBackToHome() async {
      await Future.delayed(const Duration(seconds: 1), () {});

      if (countdown <= 0) {
        isClose = true;
        Get.offAllNamed(Routes.home);
      } else if (!isClose) {
        countdown--;
        _countdownBackToHome();
      }
    }

    //
    // _getCountdown(int countdown) {
    //   return countdown --;
    // }
    //
    _countdownBackToHome();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AppbarWidget(automaticallyImplyLeading: false),
          const SizedBox(height: 30),
          const Center(
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'ชำระเงินเสร็จสมบูรณ์',
              style: Styles.title.copyWith(fontSize: 26),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: Styles.padding,
              right: Styles.padding,
              bottom: Styles.padding,
              top: Styles.padding / 2,
            ),
            child: ButtonWidget(
              'กลับสู่หน้าหลัก($countdown)',
              onClicked: () {
                isClose = true;
                Get.offAllNamed(Routes.home);
              },
              buttonHeight: 50,
              style: const TextStyle(color: Colors.white),
              colorPrimary: Styles.colorPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
