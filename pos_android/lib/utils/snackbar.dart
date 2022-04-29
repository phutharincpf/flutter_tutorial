import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';

class SnackBar {
  static final List<Flushbar> flushBars = [];

  static void show({
    required String title,
    required String text,
    int? durationSeconds,
    double? width,

  }) {
    Get.snackbar(
      title,
      text,
      borderRadius: 8,
      backgroundColor: Colors.white,
      overlayColor: Colors.transparent,
      snackPosition: SnackPosition.TOP,
      titleText: Text(
        title,
        style: Styles.title.copyWith(color: Colors.black, fontSize: 34),
      ),
      messageText: Text(
        text,
        style: Styles.subTitle.copyWith(color: Colors.black, fontSize: 26),
      ),
      duration: Duration(seconds: durationSeconds ?? 3),
      margin: const EdgeInsets.only(top: 70),
      maxWidth: width ?? 300,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
