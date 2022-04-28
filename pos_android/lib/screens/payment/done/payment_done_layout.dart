import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/routes/app_pages.dart';
import 'package:pos_android/widgets/buttons/button_info.dart';
import 'package:pos_android/widgets/buttons/button_success.dart';

class PaymentDoneLayout extends StatelessWidget {
  const PaymentDoneLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            style: Styles.title.copyWith(fontSize: Styles.fontSizeLarge),
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
                    Text('รวมสินค้า', style: Styles.subTitle),
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
                    Text('ส่วนลดสินค้า', style: Styles.subTitle),
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
                    Text('จำนวนที่ต้องชำระ', style: Styles.subTitle),
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
                    Text('วิธีชำระเงิน', style: Styles.subTitle),
                    // Obx(() => Text(paymentController.currentMethod)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Styles.padding, vertical: Styles.padding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('เงินทอน', style: Styles.subTitle),
                    // Obx(() => Text(paymentController.currentMethod)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: ButtonInfo(
                'พิมพ์ใบเสร็จ',
                onClicked: () {
                  // Get.offAllNamed(Routes.paymentDone);
                },
                style:
                Styles.buttonPrimary.copyWith(fontSize: Styles.fontSizeLarge),
              )),
              const SizedBox(width:  Styles.padding / 2),
              Expanded(child: ButtonSuccess(
                'เสร็จสิ้น',
                onClicked: () {
                  Get.offAllNamed(Routes.home);
                },
                style:
                Styles.buttonPrimary.copyWith(fontSize: Styles.fontSizeLarge),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
