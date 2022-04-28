import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/screens/home/cart/cart_body.dart';
import 'package:pos/screens/home/cart/cart_footer.dart';
import 'package:pos/screens/home/cart/cart_header.dart';

class CartLayout extends StatelessWidget {
  const CartLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CartHeader(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(Styles.padding / 2),
                    child: CartBody(),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: Styles.padding / 2, right: Styles.padding / 2, bottom: Styles.padding / 2),
            child: CartFooter(),
          ),
        ],
      ),
    );
  }
}
