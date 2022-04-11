import 'package:flutter/material.dart';

class Styles {

  // Colors
  static Color mainColor                        = const Color.fromRGBO(240, 242, 245, 1);
  static Color borderColor                      = const Color.fromRGBO(104, 120, 171, 1);
  static Color textColor                        = Colors.black;
  static Color textSecondary                    = const Color.fromRGBO(104, 120, 171, 1);

  static Color colorPrimary                     = const Color.fromRGBO(0, 150, 76, 1);
  static Color colorLight                       = const Color.fromRGBO(216, 218, 223, 1);
  static Color colorDanger                      = const Color.fromRGBO(168, 7, 26, 1);
  static Color colorOutlineLight                = const Color.fromRGBO(255, 255, 255, 1);
  static Color colorSecondary                   = const Color.fromRGBO(104, 120, 171, 1);
  static Color colorSecondaryLight              = const Color.fromRGBO(209, 215, 231, 1);
  static Color colorGray                        = const Color.fromRGBO(140, 140, 140, 1);

  // Font
  static String fontFamilyName                  = '';
  static TextStyle baseFontFamily               = TextStyle(fontFamily: fontFamilyName);
  static TextStyle text                         = baseFontFamily.copyWith(fontSize: 16, height: 1.3, color: textColor);
  static TextStyle title                        = text.copyWith(fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle subtitle                     = text.copyWith(color: Colors.grey);


  // Button
  static const double buttonHeight              = 32;
  static const double buttonMediumHeight        = 56;
  static const double buttonLargeHeight         = 72;

  static TextStyle textButton                   = text.copyWith(fontWeight: FontWeight.w600);
  static TextStyle textButtonDisabled           = textButton.copyWith(color: textSecondary);

  // appbar
  static Color appbarColor                      = colorPrimary;


  // reset
  static List<BoxShadow> get boxShadows => [
     BoxShadow(
      color: Colors.black.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 5,// changes position of shadow
    ),
  ];

  static const double padding                   = 15;
  static const double borderRadius              = 15;
}