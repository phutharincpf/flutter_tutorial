import 'package:flutter/material.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/widgets/header_widget.dart';

class PricingReportScreen extends StatelessWidget {
  const PricingReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderWidget('aaa'),
          Center(
            child: Text(
              'PricingReportScreen',
              style: Styles.title,
            ),
          ),
        ],
      )
    );
  }
}
