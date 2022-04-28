import 'package:flutter/material.dart';
import 'package:pos_android/screens/payment/keypad/widgets/payment_keypad_body.dart';
import 'package:pos_android/screens/payment/keypad/widgets/payment_keypad_footer.dart';

class PaymentKeypad extends StatelessWidget {
  const PaymentKeypad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(child: PaymentKeypadBody()),
        PaymentKeypadFooter(),
      ],
    );
  }
}
