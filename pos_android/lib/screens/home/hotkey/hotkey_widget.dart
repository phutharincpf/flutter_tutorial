import 'package:flutter/material.dart';
import 'package:pos_android/screens/home/hotkey/hotkey_card.dart';
import 'package:pos_android/screens/home/hotkey/hotkey_category.dart';

class HotkeyLayout extends StatelessWidget {
  const HotkeyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HotkeyCategory(),
        Expanded(child: HotkeyCard())
      ],
    );
  }
}
