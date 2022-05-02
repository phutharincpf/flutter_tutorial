import 'package:flutter/material.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/utils/snackbar.dart';
import 'package:pos_android/widgets/buttons/button_nav.dart';

class HotkeyCategory extends StatelessWidget {
  const HotkeyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> menus = [];

    menus.add({'name': 'ทั้วไป'});
    menus.add({'name': 'All Cafe'});
    menus.add({'name': 'น้ำ'});
    menus.add({'name': 'ไอศกรีม'});
    menus.add({'name': 'ขนมและลูกอม'});

    return Container(
      height: 70,
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
            horizontal: Styles.padding, vertical: Styles.padding / 2),
        itemCount: menus.length,
        itemBuilder: (BuildContext context, int index) {
          return ButtonPrimaryOutline(menus[index]['name'], onClicked: () {

            SnackBarUtil.show(title: 'สำเร็จ!', text: 'รายการสินค้าถูกอัพเดทแล้ว');
          });
        },
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(width: Styles.padding / 2),
      ),
    );
  }
}
