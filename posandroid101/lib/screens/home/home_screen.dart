import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posandroid101/constants/styles.dart';
import 'package:posandroid101/routes/app_pages.dart';
import 'package:posandroid101/widgets/appbar_widget.dart';
import 'package:posandroid101/widgets/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppbarWidget(automaticallyImplyLeading: false, title: 'POS 101',),
          const Expanded(child: Text('')),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    'ลูกค้าทั่วไป',
                    onClicked: () {
                      FirebaseAnalytics.instance.logEvent(
                        name: 'customer',
                        parameters: {'type': 'ลูกค้าทั่วไป'},
                      );

                      Get.toNamed(Routes.cart);
                    },
                    buttonHeight: 50,
                    style: TextStyle(color: Styles.colorPrimary),
                    colorPrimary: Colors.white,
                    borderColor: Styles.colorPrimary,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ButtonWidget(
                    'ลูกค้าสมาชิก',
                    onClicked: () {
                      FirebaseAnalytics.instance.logEvent(
                          name: 'customer',
                          parameters: {'type': 'ลูกค้าสมาชิก'});

                      Get.toNamed(Routes.cart);
                    },
                    buttonHeight: 50,
                    style: TextStyle(color: Styles.colorPrimary),
                    colorPrimary: Colors.white,
                    borderColor: Styles.colorPrimary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
