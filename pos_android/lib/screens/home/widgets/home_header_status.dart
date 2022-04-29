import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/master_controller.dart';

class HomeHeaderStatus extends StatefulWidget {
  const HomeHeaderStatus({Key? key}) : super(key: key);

  @override
  State<HomeHeaderStatus> createState() => _HomeHeaderStatusState();
}

class _HomeHeaderStatusState extends State<HomeHeaderStatus>
    with SingleTickerProviderStateMixin {
  MasterController masterController = Get.find();

  // late Animation<double> animation;
  // late AnimationController controller;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  //
  // stopRotation() {
  //   animationController.stop();
  // }
  //
  // startRotation() {
  //   animationController.repeat();
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: masterController.processing ? Styles.colorWarning.withOpacity(.2): Styles.colorSuccess.withOpacity(.2),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text('สถานะ : ', style: Styles.textSmall),
              masterController.processing
                  ? AnimatedBuilder(
                      animation: animationController,
                      child: Icon(Icons.refresh_outlined,
                          size: Styles.fontSizeSmall - 2,
                          color: Styles.appbarTextColor),
                      builder: (BuildContext context, Widget? _widget) {
                        return Transform.rotate(
                          angle: animationController.value * 6.3,
                          child: _widget,
                        );
                      },
                    )
                  : Icon(Icons.check_circle,
                      size: Styles.fontSizeSmall - 3, color: Styles.colorSuccess),
              const SizedBox(width: 2),
              Text(masterController.statusMessage, style: Styles.textSmall.copyWith(color: masterController.processing ? Styles.appbarTextColor: Styles.colorSuccess)),
            ],
          ),
    ));
  }
}

// check_circle_outline
