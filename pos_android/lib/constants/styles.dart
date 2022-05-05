import 'package:flutter/material.dart';

class Styles {

  // reset
  static List<BoxShadow> get boxShadows => [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      spreadRadius: 1,
      blurRadius: 5,// changes position of shadow
    ),
  ];

  static const double padding                   = 15;
  static const double radius                    = 8;
  static const double borderRadius              = radius;

  // TextStyle
  static double fontSize                            = 26;
  static double fontSizeSmall                       = 18;
  static double fontSizeMedium                      = 32;
  static double fontSizeLarge                       = 44;
  static double fontSizeJumbo                       = 64;

  // Colors
  static Color mainColor                        = const Color.fromRGBO(240,242,245, 1);
  static Color borderColor                      = const Color.fromRGBO(104, 120, 171, 1);
  static Color textColor                        = const Color.fromRGBO(43,61,152, 1);
  static Color textSecondary                    = const Color.fromRGBO(104, 120, 171, 1);

  static Color colorPrimary                     = const Color.fromRGBO(43,61,152, 1);
  static Color colorLight                       = const Color.fromRGBO(216, 218, 223, 1);
  static Color colorDanger                      = const Color.fromRGBO(168, 7, 26, 1);
  static Color colorOutlineLight                = const Color.fromRGBO(255, 255, 255, 1);
  static Color colorSecondary                   = const Color.fromRGBO(104, 120, 171, 1);
  static Color colorSecondaryLight              = const Color.fromRGBO(209, 215, 231, 1);
  static Color colorGray                        = const Color.fromRGBO(140, 140, 140, 1);
  static Color colorCancel                      = const Color.fromRGBO(177,4,13, 1);
  static Color colorSuccess                     = const Color.fromRGBO(42,128,0, 1);
  static Color colorInfo                        = const Color.fromRGBO(0, 132, 255, 1);
  static Color colorGrey                        = const Color.fromRGBO(196,196,196, 1);
  static Color colorWarning                     = const Color.fromRGBO(255,193,7, 1);
  static Color colorDark                        = const Color.fromRGBO(52,58,64, 1);


  // Font
  static String fontFamilyName                  = 'CPFImmSok';
  static TextStyle baseFontFamily               = TextStyle(fontFamily: fontFamilyName);
  static TextStyle text                         = baseFontFamily.copyWith(fontSize: fontSize, height: 1.2, color: textColor);
  static TextStyle textSmall                    = text.copyWith(fontSize: fontSizeSmall);
  static TextStyle textMuted                    = text.copyWith(color: const Color.fromRGBO(112,122,138, 1));
  static TextStyle title                        = text.copyWith(fontWeight: FontWeight.w600, fontSize: fontSizeMedium);
  static TextStyle subTitle                     = text.copyWith(color: Colors.black87);
  static TextStyle subText                      = textMuted.copyWith(fontSize: fontSizeSmall);
  static TextStyle textLarge                    = text.copyWith(fontSize: fontSizeLarge, height: 1.3);
  static TextStyle textJumbo                    = text.copyWith(fontSize: fontSizeJumbo, height: 1.5, fontWeight: FontWeight.w600);

  static TextStyle h1                           = text.copyWith(fontWeight: FontWeight.w600, fontSize: 24);
  static TextStyle h2                           = text.copyWith(fontWeight: FontWeight.w600, fontSize: 20);
  static TextStyle h3                           = text.copyWith(fontWeight: FontWeight.w500, fontSize: 18);



  // Button
  static const double buttonHeight              = 32;
  static const double buttonMediumHeight        = 56;
  static const double buttonLargeHeight         = 72;
  static const double buttonPaddingHorizontal   = 16;
  static const double buttonPaddingVertical     = 10;

  static TextStyle button                       = text.copyWith(fontWeight: FontWeight.w600);
  static TextStyle buttonDisabled               = button.copyWith(color: textSecondary);
  static TextStyle buttonPrimary                = button.copyWith(color: Colors.white);
  static Color buttonPrimaryColor               = colorPrimary;

  static TextStyle buttonCancel                 = button.copyWith(color: Colors.white);
  static TextStyle buttonSuccess                = button.copyWith(color: Colors.white);
  static Color buttonCancelBorderColor          = colorCancel;

  static double btnRadius                       = radius;

  // appbar
  static Color appbarColor                          = Colors.white; // const Color.fromRGBO(241, 243, 255, 1);
  static Color appbarTextColor                      = textColor;

  // Drawer
  static TextStyle drawer                           = text.copyWith(color: const Color.fromRGBO(0, 96, 49, 1));
  static Color drawerColor                          = Colors.white;
  static Color drawerTextColor                      = const Color.fromRGBO(0, 96, 49, 1);
  static Color drawerTextColorActive                = Colors.white;
  static TextStyle drawerText                       = text.copyWith(fontWeight: FontWeight.normal, fontSize: fontSize, height: 1.3, color: drawerTextColor);
  static Color drawerIconColor                      = const Color.fromRGBO(0, 96, 49, 1);
  static Color drawerIconColorActive                = Colors.white;
  static Color drawerActiveColor                    = colorPrimary;

  // Dialog
  static double dialogRadius                       = radius;

  // form
  static const double inputHeight                   = 72;
  static Color formColor                            = const Color.fromRGBO(38, 38, 38, 1);
  static Color formBorderColor                      = const Color.fromRGBO(209, 215, 231, 1);
  static Color formFocusedBorderColor               = colorPrimary;
  static Color formDisabledBorderColor              = const Color.fromRGBO(209, 215, 231, 1);
  static Color formBorderErrorColor                 = colorDanger;
  static Color formDisabledColor                    = const Color.fromRGBO(191, 191, 191, 1);
  static Color formDisabledBg                       = const Color.fromRGBO(245, 245, 245, 1);
  static const double formBorderWidth               = 2;
  static const double formBorderRadius              = radius;
  static TextStyle formTextStyleInput               = text.copyWith(fontWeight: FontWeight.w600, fontSize: 26, height: 1.3);
  static TextStyle formTextStyleInputError          = formTextStyleInput.copyWith(height: 1, fontSize: fontSizeSmall, color: colorDanger);
  static TextStyle formTextStyleLabel               = text.copyWith(fontWeight: FontWeight.normal, fontSize: 24, height: 1, color: const Color.fromRGBO(71, 77, 87, 1));
  static const double formPadding                   = 10;
  static const double formPaddingHorizontal         = 15;

}