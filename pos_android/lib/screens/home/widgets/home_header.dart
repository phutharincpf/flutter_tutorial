import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/pos_icons.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/master_controller.dart';
import 'package:pos_android/screens/home/widgets/home_header_status.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 50;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: Styles.padding / 2),
      color: Styles.appbarColor,
      child: SafeArea(
        child: Row(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: Styles.padding, right: Styles.padding),
                    decoration:  const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        PosIcons.menuPath,
                        fit: BoxFit.cover,
                        height: 28,
                        width: 28,
                        color: Styles.appbarTextColor,
                      ),
                    ),
                  ),
                ),

                Container(
                  height: appBarHeight - 20,
                  width: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Styles.appbarTextColor,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: Styles.padding / 2),
                ),
                const SizedBox(width: Styles.padding / 2),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                const SizedBox(width: Styles.padding / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ร้านนี้ขายดีดี : ภุชงค์ สวนแจ้ง',
                      style: Styles.title,
                    ),
                    const HomeHeaderStatus(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
