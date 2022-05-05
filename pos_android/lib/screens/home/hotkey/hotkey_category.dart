import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/hotkey_controller.dart';
import 'package:pos_android/payloads/hotkey_payload.dart';
import 'package:pos_android/widgets/button_widget.dart';

class HotkeyCategory extends StatelessWidget {
  const HotkeyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HotKeyController hotKeyController = Get.find();

    return SizedBox(
      height: 70,
      child: Obx(() {
        if(hotKeyController.isLoad){
          List<String> list = ['','','',''];

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
                horizontal: Styles.padding, vertical: Styles.padding / 2),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 100,
                child: ButtonWidget(
                  text: '',
                  onClicked: () {},
                  colorPrimary: const Color.fromRGBO(228,228,228, 1),
                  borderColor: const Color.fromRGBO(228,228,228, 1),
                  style: Styles.button.copyWith(color: Colors.grey),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: Styles.padding / 2),
          );
        }
        else{
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
                horizontal: Styles.padding, vertical: Styles.padding / 2),
            itemCount: hotKeyController.hotKeyList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildButtonCat(hotKeyController, hotKeyController.hotKeyList[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: Styles.padding / 2),
          );
        }
      }),
    );
  }

  _buildButtonCat(HotKeyController _controller, HotKeyPayload hotKey) {
    return Obx(() => ButtonWidget(
      text: hotKey.name,
      onClicked: () {
        _controller.activeHotKey(hotKey.code);
      },
      colorPrimary: _controller.currentCode == hotKey.code ? Styles.colorPrimary : Colors.white,
      borderColor: Styles.colorPrimary,
      style: Styles.button.copyWith(color: _controller.currentCode == hotKey.code ? Colors.white: Styles.colorPrimary),
    ));
  }
}
