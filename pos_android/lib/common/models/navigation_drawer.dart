import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/ui_controller.dart';
import 'package:pos_android/payloads/menu_payload.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UIController uiController = Get.find();

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildDrawerHeader(),
            Expanded(
              child: Obx(() => ListView.builder(
                // padding: const EdgeInsets.all(8),
                itemCount: uiController.navigationList.length,
                itemBuilder: (BuildContext context, int index) {
                  MenuPayload menu = uiController.navigationList[index];

                  if (menu.isDivider == true) {
                    return Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black12,
                    );
                  } else {
                    return _buildDrawerItem(
                      // icon: Icons.photo,
                      imagePath: menu.svgPath,
                      text: menu.nameLocal,
                      onTap: () {
                        Get.back();

                      },
                      tileColor: Get.currentRoute == menu.pathname
                          ? Styles.drawerTextColorActive
                          : null,
                      textIconColor: Get.currentRoute == menu.pathname
                          ? Styles.drawerIconColorActive
                          : Styles.drawerIconColor,

                      bgColor: Get.currentRoute == menu.pathname
                          ? Styles.drawerActiveColor
                          : Styles.drawerColor,
                    );
                  }
                },
              )),
            ),
          ],
        ),
      ),
    );
  }

  _buildDrawerHeader() {
    return Container(height: 50, color: Styles.appbarColor);
  }

  _buildDrawerItem ({
    required String text,
    IconData? icon,
    required Color textIconColor,
    required Color? tileColor,
    required Color? bgColor,
    required VoidCallback onTap,
    String? imagePath,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      onPressed: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        color: bgColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            imagePath == null
                ? const SizedBox()
                : Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  imagePath,
                  height: 24,
                  width: 24,
                  color: textIconColor,
                ),
              ),
            ),
            Text(
              text,
              style: Styles.drawer,
            )
          ],
        ),
      ),
    );
  }
}
