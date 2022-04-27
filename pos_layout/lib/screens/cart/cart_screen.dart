import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_layout/routes/app_pages.dart';
import 'package:pos_layout/screens/cart/widgets/cart_body_widget.dart';
import 'package:pos_layout/widgets/appbar_widget.dart';
import 'package:pos_layout/widgets/button_widget.dart';
import 'package:pos_layout/constants/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: ,
      //   elevation: 0,
      //   title: const Text('POS Android 101'),
      //   centerTitle: true,
      //   leading: ,
      // ),
      body: Column(
        children: [
          AppbarWidget(
            leadingText: 'ยกเลิกรายการ',
            title: 'Cart',
            leadingClicked: () {
              FirebaseAnalytics.instance.logEvent(name: 'cancel', parameters: {'orderNo': '0014'});

              Get.back();
            },
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: Styles.padding,
          //     right: Styles.padding,
          //     top: Styles.padding / 2,
          //     bottom: (Styles.padding / 2) - 5,
          //   ),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         '',
          //         style: Styles.title,
          //       ),
          //       ButtonWidget(
          //         'ระบุรหัสสินค้า',
          //         onClicked: () {},
          //         buttonHeight: 40,
          //         style: const TextStyle(color: Colors.red),
          //         colorPrimary: Colors.white,
          //         borderColor: Colors.red,
          //       ),
          //     ],
          //   ),
          // ),
          const Expanded(
            child: CartBodyWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: Styles.padding,
              right: Styles.padding,
              bottom: Styles.padding,
              top: Styles.padding / 2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '฿',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '971.00',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('รวมทั้งสิ้น: 10 หน่วย')
                  ],
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 180.0,
                  ),
                  child: ButtonWidget(
                    'ชำระเงิน',
                    onClicked: () {
                      FirebaseAnalytics.instance.logEvent(
                          name: 'payment', parameters: {'price': '970'});

                      Get.toNamed(Routes.payment);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
