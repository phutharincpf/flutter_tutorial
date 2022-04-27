import 'package:flutter/material.dart';

class HotkeyWidget extends StatelessWidget {
  const HotkeyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Hotkey'),
      ),
    );
  }
}
