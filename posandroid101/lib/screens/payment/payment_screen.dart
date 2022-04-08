import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posandroid101/constants/styles.dart';
import 'package:posandroid101/routes/app_pages.dart';
import 'package:posandroid101/widgets/appbar_widget.dart';
import 'package:posandroid101/widgets/button_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> methods = ['True Money Wallet', 'Prompt Pay'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AppbarWidget(
            leadingText: 'กลับ',
            title: 'Payment',
          ),
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '฿',
                  style: Styles.text.copyWith(fontSize: 24),
                ),
                const SizedBox(width: 5),
                Text('1,569.00', style: Styles.title.copyWith(fontSize: 40)),
              ],
            ),
          ),
          Center(
            child: Text('ยอดเงินที่ต้องชำระ', style: Styles.subtitle),
          ),
          const SizedBox(height: 25),
          Center(
            child: Text('โปรดเลือกช่องทางการชำระเงิน',
                style: Styles.title.copyWith(fontSize: 16)),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: Styles.padding),
              itemCount: methods.length,
              itemBuilder: (BuildContext context, int index) {
                return ButtonWidget(
                  methods[index],
                  colorPrimary: Colors.black.withOpacity(0.1),
                  borderColor: Colors.transparent,
                  onClicked: () {
                    FirebaseAnalytics.instance.logEvent(
                      name: 'payment_method',
                      parameters: {'type': methods[index]},
                    );

                    Get.offAllNamed(Routes.succeed);
                  },
                  style: Styles.title,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 8),
            ),
          )
        ],
      ),
    );
  }
}
