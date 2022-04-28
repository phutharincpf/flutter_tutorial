import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/screens/payment/done/payment_done_layout.dart';
import 'package:pos/screens/payment/widgets/payment_header.dart';

class PaymentDoneScreen extends StatelessWidget {
  const PaymentDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainColor,
      drawerEnableOpenDragGesture: false,
      body: Row(
        children: [
          Expanded(
            flex: 50,
            child: Container(
              child: Text('PaymentScreen'),
            ),
          ),
          const Expanded(
            flex: 50,
            child: PaymentDoneLayout(),
          )
        ],
      ),
    );
  }
}
