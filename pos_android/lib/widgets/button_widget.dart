import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_android/constants/styles.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final String text;
  final VoidCallback onClicked;
  final Color? colorPrimary;
  final Color? borderColor;
  final TextStyle? style;
  final double? buttonHeight;
  final String? iconPath;
  final double? borderWidth;
  final double? borderRadius;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final Color? color;

  const ButtonWidget({
    Key? key,
    this.title,
    required this.text,
    required this.onClicked,
    this.colorPrimary,
    this.style,
    this.borderColor,
    this.buttonHeight,
    this.iconPath,
    this.borderWidth,
    this.borderRadius,
    this.color,
    this.paddingHorizontal,
    this.paddingVertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _getColorPrimary() {
      return colorPrimary ?? Styles.colorPrimary;
    }

    _getTextWidget(){
      Widget textWidget = Text(
        text,
        style: style ?? Styles.buttonPrimary,
      );

      if( iconPath!=null && iconPath!='' ){
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath!, width: 24, height: 24, color: color ?? Styles.colorPrimary),
            const SizedBox(width: 6),
            textWidget,
          ],
        );
      }
      else {
        return textWidget;
      }

    }

    _buildText() {

      Widget _text = Center(
        child: _getTextWidget(),
      );

      return _text;

      if( buttonHeight==null ){
        return _text;
      }
      else{
        return SizedBox(
          height: buttonHeight,
          child: _text,
        );
      }
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: _getColorPrimary(),
        padding: EdgeInsets.symmetric(horizontal: paddingHorizontal ?? Styles.buttonPaddingHorizontal, vertical: paddingVertical ?? Styles.buttonPaddingVertical),
        // minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: borderWidth ?? 1,
            color: borderColor ?? _getColorPrimary(),
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? Styles.btnRadius),
        ),
      ),
      child: _buildText(),
      onPressed: onClicked,
    );
  }
}
