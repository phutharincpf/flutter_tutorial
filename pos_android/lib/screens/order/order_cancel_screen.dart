import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/widgets/dialog_widget.dart';

class OrderCancelScreen extends StatelessWidget {
  const OrderCancelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('OrderCancelScreen', style: Styles.text),
      ),
    );
  }
}
//
// class AnimatedLogo extends AnimatedWidget {
//   const AnimatedLogo({Key? key, required Animation<double> animation})
//       : super(key: key, listenable: animation);
//
//   @override
//   Widget build(BuildContext context) {
//     final animation = listenable as Animation<double>;
//
//     return Center(
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 10),
//         height: animation.value,
//         width: animation.value,
//         child: const FlutterLogo(),
//       ),
//     );
//   }
// }
