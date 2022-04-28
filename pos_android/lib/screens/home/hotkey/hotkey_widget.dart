import 'package:flutter/material.dart';
import 'package:pos_android/screens/home/hotkey/hotkey_cetagory.dart';

class HotkeyLayout extends StatelessWidget {
  const HotkeyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const HotkeyCategory(),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
