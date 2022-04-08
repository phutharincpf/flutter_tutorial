import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posandroid101/constants/styles.dart';
import 'package:posandroid101/controllers/payment_controller.dart';
import 'package:posandroid101/routes/app_pages.dart';
import 'package:posandroid101/widgets/appbar_widget.dart';
import 'package:posandroid101/widgets/button_widget.dart';

class SucceedScreen extends StatelessWidget {
  const SucceedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.find();
    paymentController.startCountdown();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AppbarWidget(
            automaticallyImplyLeading: false,
            title: 'Payment',
          ),
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
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(Styles.padding),
            color: Colors.grey.withOpacity(.1),
            padding: const EdgeInsets.symmetric(vertical: Styles.padding / 2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Styles.padding, vertical: Styles.padding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('รวมสินค้า', style: Styles.subtitle),
                      const Text('฿ 1,569.00'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Styles.padding, vertical: Styles.padding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ส่วนลดสินค้า', style: Styles.subtitle),
                      const Text('-฿ 0.00'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Styles.padding, vertical: Styles.padding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('จำนวนที่ต้องชำระ', style: Styles.subtitle),
                      Text('฿ 1,569.00', style: Styles.title.copyWith(color: Colors.red, fontSize: 26)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Styles.padding, vertical: Styles.padding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('วิธีชำระเงิน', style: Styles.subtitle),
                      Obx(() => Text(paymentController.currentMethod)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
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
            child: Obx(
              () => ButtonWidget(
                'กลับสู่หน้าหลัก(${paymentController.countdown})',
                onClicked: () {
                  paymentController.clearCountdown();
                  Get.offAllNamed(Routes.home);
                },
                buttonHeight: 50,
                style: const TextStyle(color: Colors.white),
                colorPrimary: Styles.colorPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
