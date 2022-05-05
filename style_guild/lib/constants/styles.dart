import 'package:flutter/material.dart';

class Styles {
  // ----------------------------------------------------------------------------------/
  // Colors
  static Color mainColor                            = Colors.white;
  static Color textColor                            = const Color.fromRGBO(30,35,41, 1);

  // TextStyle
  static double fontSize18                          = 18;
  static double fontSize                            = 26;
  static double fontSizeSmall                       = fontSize18;
  static double fontSizeMedium                      = 32;
  static double fontSizeLarge                       = 44;
  static double fontSizeJumbo                       = 64;

  static const String fontFamilyName                = 'CPFImmSook';
  static TextStyle baseFontFamily                   = const TextStyle(fontFamily: fontFamilyName);

  static TextStyle text                             = baseFontFamily.copyWith(fontWeight: FontWeight.w400,fontSize: fontSize,height: 1.2,color: textColor);
  static TextStyle title2                           = text.copyWith();
  static TextStyle textMuted                        = text.copyWith(color: const Color.fromRGBO(112,122,138, 1));
  static TextStyle title                            = text.copyWith(fontWeight: FontWeight.w600);
  static TextStyle subTitle                         = text.copyWith(color: Colors.black87);
  static TextStyle subText                          = textMuted.copyWith(fontSize: fontSizeSmall);
  static TextStyle textLarge                        = text.copyWith(fontSize: fontSizeLarge, height: 1.3);
  static TextStyle textXL                           = text.copyWith(fontSize: fontSizeLarge, height: 1.5, fontWeight: FontWeight.w600);


  static TextStyle textReg18                        = text.copyWith(fontSize: 18);
  static TextStyle textSemi28                       = text.copyWith(fontSize: 28, fontWeight: FontWeight.w600);
  static TextStyle textSemi32                       = text.copyWith(fontSize: 32, fontWeight: FontWeight.w600);
  static TextStyle textReg40                        = text.copyWith(fontSize: 40);
  static TextStyle textSemi40                       = text.copyWith(fontSize: 48, fontWeight: FontWeight.w600);
  static TextStyle textSemi48                       = text.copyWith(fontSize: 48, fontWeight: FontWeight.w600);
  static TextStyle textSemi64                       = text.copyWith(fontSize: 64, fontWeight: FontWeight.w600);
  static TextStyle textBold96                       = text.copyWith(fontSize: 96, fontWeight: FontWeight.w700);

  static TextStyle h1                               = text.copyWith(fontWeight: FontWeight.w600, fontSize: 24);
  static TextStyle h2                               = text.copyWith(fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle h3                               = text.copyWith(fontWeight: FontWeight.w500, fontSize: 18);

  static Color colorPrimary                         = const Color.fromRGBO(43,61,152, 1);
  static Color colorDanger                          = const Color.fromRGBO(168, 7, 26, 1);
  static Color colorGray                            = const Color.fromRGBO(140, 140, 140, 1);


  // form
  static Color formColor                          = const Color.fromRGBO(38, 38, 38, 1);
  static Color formBorderColor                    = const Color.fromRGBO(209, 215, 231, 1);
  static Color formFocusedBorderColor             = colorPrimary;
  static Color formDisabledBorderColor            = const Color.fromRGBO(209, 215, 231, 1);
  static Color formBorderErrorColor               = colorDanger;
  static Color formDisabledColor                  = const Color.fromRGBO(191, 191, 191, 1);
  static Color formDisabledBg                     = const Color.fromRGBO(245, 245, 245, 1);
  static const double formBorderWidth             = 2;
  static const double formBorderRadius            = 8;
  static TextStyle formTextStyleInput             = text.copyWith(fontWeight: FontWeight.w600);
  static TextStyle formTextStyleInputError        = formTextStyleInput.copyWith(color: colorDanger);
  static TextStyle formTextStyleLabel             = text;
  static const double formPadding                 = 10;
  static const double formPaddingHorizontal       = 15;
}