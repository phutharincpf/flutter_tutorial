import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/widgets/button_widget.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final TextStyle? style;

  const ButtonPrimary(this.text,
      {Key? key, required this.onClicked, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: text,
      onClicked: onClicked,
      colorPrimary: Styles.colorPrimary,
      style: style ?? Styles.buttonPrimary,
    );
  }
}
