import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/routes/app_pages.dart';
import 'package:pos/widgets/buttons/button_cancel.dart';
import 'package:pos/widgets/buttons/button_success.dart';
import 'package:pos/widgets/modal_widget.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonCancel(
            'ยกเลิกการขาย',
            onClicked: () {

              Get.dialog(const ModalWidget(
                icon: 'warning',
                title: 'ขออภัย!!',
                text: 'ไม่พบรายการสินค้า',
                doneText: 'ตกลง',
                isCancel: false,
              ));

            },
            style: Styles.buttonCancel.copyWith(fontSize: Styles.fontSizeLarge),
          ),
        ),
        const SizedBox(width: Styles.padding / 2),
        Expanded(
          child: ButtonSuccess(
            'ชำระเงิน',
            onClicked: () {

              Get.toNamed(Routes.payment);
            },
            style:
                Styles.buttonPrimary.copyWith(fontSize: Styles.fontSizeLarge),
          ),
        ),
      ],
    );
  }
}
