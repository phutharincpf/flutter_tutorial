import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/routes/app_pages.dart';
import 'package:pos_android/widgets/buttons/button_success.dart';

class PaymentKeypadFooter extends StatelessWidget {
  const PaymentKeypadFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ButtonSuccess(
        'ชำระเงิน',
        onClicked: () {
          Get.offAllNamed(Routes.paymentDone);
        },
        style:
        Styles.buttonPrimary.copyWith(fontSize: Styles.fontSizeLarge),
      ),
    );
  }
}
