import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/widgets/buttons/button_nav.dart';

class PaymentMenu extends StatelessWidget {
  const PaymentMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> menus = [];

    menus.add({'name': 'เงินสด'});
    menus.add({'name': 'True Money Wallet'});
    menus.add({'name': 'QR Prompt Pay'});

    return Container(
      height: 70,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
            horizontal: Styles.padding, vertical: Styles.padding / 2),
        itemCount: menus.length,
        itemBuilder: (BuildContext context, int index) {
          return ButtonPrimaryOutline(menus[index]['name'], onClicked: () {});
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: Styles.padding / 2),
      ),
    );
  }
}
//
