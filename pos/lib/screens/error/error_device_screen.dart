import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';

class ErrorDeviceScreen extends StatelessWidget {
  const ErrorDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ขออภัย!!', style: Styles.title),
            Text('ระบบรองรับอุปกรณ์ที่เป็นแท็บเล็ตเท่านั้น', style: Styles.text),
          ],
        ),
      ),
    );
  }
}
