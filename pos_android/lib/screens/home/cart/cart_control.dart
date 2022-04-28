import 'package:flutter/material.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/widgets/buttons/button_nav.dart';

class CartControl extends StatelessWidget {
  const CartControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> menus = [];

    menus.add({'name': 'ค้นหา'});
    menus.add({'name': 'พักบิล (0)'});
    menus.add({'name': 'เรียกบิล'});

    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Styles.padding / 2, vertical: Styles.padding / 2),
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
