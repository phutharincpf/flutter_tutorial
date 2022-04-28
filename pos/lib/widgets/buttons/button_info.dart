import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/widgets/button_widget.dart';

class ButtonInfo extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final TextStyle? style;

  const ButtonInfo(this.text,
      {Key? key, required this.onClicked, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: text,
      onClicked: onClicked,
      colorPrimary: Styles.colorInfo,
      style: style ?? Styles.button.copyWith(color: Colors.white),
    );
  }
}
