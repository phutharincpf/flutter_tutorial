import 'package:flutter/material.dart';
import 'package:posandroid101/constants/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      this.text, {
        Key? key,
        required this.onClicked,
        this.colorPrimary,
        this.style,
        this.borderColor,
        this.buttonHeight,
      }) : super(key: key);

  final String text;
  final VoidCallback onClicked;
  final Color? colorPrimary;
  final Color? borderColor;
  final TextStyle? style;
  final double? buttonHeight;

  @override
  Widget build(BuildContext context) {
    Color _getColorPrimary() {
      return colorPrimary ?? Styles.colorPrimary;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: _getColorPrimary(),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: borderColor ?? _getColorPrimary(),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
        height: buttonHeight ?? 60,
        child: Center(
          child: Text(
            text,
            style: style ?? const TextStyle(color: Colors.white),
          ),
        ),
      ),
      onPressed: onClicked,
    );
  }
}