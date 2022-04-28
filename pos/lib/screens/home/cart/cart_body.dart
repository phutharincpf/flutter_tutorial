import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.circular(Styles.radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black38.withOpacity(.05),
            spreadRadius: 0,
            blurRadius: 2, // changes position of shadow
          )
        ],
      ),
      child: const Text('CartBody'),
    );
  }
}
