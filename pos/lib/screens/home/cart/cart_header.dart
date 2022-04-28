import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/screens/home/cart/cart_control.dart';
import 'package:pos/screens/home/widgets/keyin_widget.dart';
import 'package:pos/widgets/form_field_widget.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      // padding: const EdgeInsets.only(top: 8),

      child: Row(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: Styles.padding / 2, top: 2),
              child: KeyInWidget(),
            ),
          ),
          Container(
            width: 200,
            child: const CartControl(),
          )
        ],
      ),
    );

    //
  }
}
