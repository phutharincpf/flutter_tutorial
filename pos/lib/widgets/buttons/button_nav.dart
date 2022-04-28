import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/widgets/button_widget.dart';

class ButtonPrimaryOutline extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final TextStyle? style;

  const ButtonPrimaryOutline(this.text, {Key? key, required this.onClicked, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      text: text,
      onClicked: onClicked,
      colorPrimary: Colors.white,
      borderColor: Styles.colorPrimary,
      style: style ?? Styles.text.copyWith(color: Styles.colorPrimary),
      paddingVertical: 11,
    );
  }
}
