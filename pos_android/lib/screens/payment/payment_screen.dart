import 'package:flutter/material.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/screens/payment/keypad/payment_keypad.dart';
import 'package:pos_android/screens/payment/widgets/payment_header.dart';
import 'package:pos_android/screens/payment/widgets/payment_menu.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainColor,
      drawerEnableOpenDragGesture: false,
      body: Column(
        children: [
          const PaymentHeader(),
          const PaymentMenu(),
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 50,
                child: Container(
                  child: Text('PaymentScreen'),
                ),
              ),
              const Expanded(
                flex: 50,
                child: PaymentKeypad(),
              )
            ],
          )),
        ],
      ),
    );
  }
}
