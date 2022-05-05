import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/payment_controller.dart';
import 'package:pos_android/payloads/payment_method_payload.dart';
import 'package:pos_android/widgets/button_widget.dart';
import 'package:pos_android/widgets/buttons/button_nav.dart';
import 'package:pos_android/widgets/buttons/button_primary.dart';

class PaymentMenu extends StatelessWidget {
  const PaymentMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.find();

    return Container(
      height: 70,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
            horizontal: Styles.padding, vertical: Styles.padding / 2),
        itemCount: paymentController.methods.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildButtonMethod(paymentController, paymentController.methods[index]);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: Styles.padding / 2),
      ),
    );
  }

  _buildButtonMethod(PaymentController _controller, PaymentMethodPayload method) {
    return Obx(() => ButtonWidget(
      text: method.displayName,
      onClicked: () {
        _controller.activeMethod(method.methodCode);
      },
      colorPrimary: _controller.methodCode == method.methodCode ? Styles.colorPrimary : Colors.white,
      borderColor: Styles.colorPrimary,
      style: Styles.button.copyWith(color: _controller.methodCode == method.methodCode ? Colors.white: Styles.colorPrimary),
    ));
  }
}
//
