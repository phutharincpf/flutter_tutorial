import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/master_controller.dart';
import 'package:pos_android/widgets/buttons/button_info.dart';
import 'package:pos_android/widgets/modal_widget.dart';

class MasterModal extends StatelessWidget {
  const MasterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MasterController masterController = Get.find();
    double _progressHeight = 12;
    double _progressWidth = 500;
    double _progressRadius = 20;

    return ModalWidget(
      width: 620,
      isCancel: false,
      isClose: false,
      isDone: false,
      paddingHeader: 0,
      paddingFooter: 0,
      onDone: () {
        debugPrint('onDone');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Styles.dialogRadius),
                topRight: Radius.circular(Styles.dialogRadius),
              ),
              color: Styles.colorPrimary.withOpacity(.1),
            ),
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
            child: Column(
              children: [
                Text(
                  'อัพเดตข้อมูล',
                  style: Styles.title,
                ),
                Obx(() => Text(
                      'สถานะ: ${masterController.statusMessage} (${masterController.statusPercent}%)',
                      style: Styles.textMuted,
                    )),
                const SizedBox(height: Styles.padding / 2),
                Stack(
                  children: [
                    Container(
                      width: _progressWidth,
                      height: _progressHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(_progressRadius),
                        color: Styles.colorGrey,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Obx(() => Container(
                        width: _progressWidth * (masterController.statusPercent / 100),
                        height: _progressHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(_progressRadius),
                          color: Styles.colorPrimary,
                        ),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'คุณต้องการขายต่อ ในราคาเดิมหรือไม่?',
                    style: Styles.text,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: Styles.padding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 220,
                      child: ButtonInfo(
                        'ขายต่อ',
                        onClicked: () {
                          masterController.closeModal();
                          Get.back();
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
