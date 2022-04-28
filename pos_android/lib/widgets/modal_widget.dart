import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/pos_icons.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/widgets/button_widget.dart';

class ModalWidget extends StatelessWidget {
  const ModalWidget({
    Key? key,
    this.title,
    this.icon,
    this.text,
    this.isCancel = true,
    this.cancelText,
    this.onCancel,
    this.isDone = true,
    this.doneText,
    this.onDone,
    this.onClose,
    this.width = 400,
    this.height = 400,
    this.isBack = true,
    this.child,
  }) : super(key: key);

  final String? title;
  final String? text;
  final String? icon;
  final bool? isCancel;
  final String? cancelText;
  final VoidCallback? onCancel;
  final bool? isDone;
  final String? doneText;
  final VoidCallback? onDone;
  final VoidCallback? onClose;
  final bool? isBack;

  final double width;
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            IntrinsicWidth(
              child: IntrinsicHeight(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: width,
                    // minHeight: height,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Styles.dialogRadius),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildIcon(),
                              _buildTitle(),
                              _buildText(),
                            ],
                          ),
                        ),
                        const SizedBox(height: Styles.padding),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: Styles.padding),
                            _buildBtnCancel(),
                            SizedBox(
                                width: isCancel == true && isDone == true
                                    ? Styles.padding
                                    : 0),
                            _buildBtnDone(),
                            const SizedBox(width: Styles.padding),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildClose(),
          ],
        ),
      ),
    );
  }
  Widget _buildIcon() {
    double iconSize = 100.0;

    if(icon=='warning'){
      return Padding(
        padding: const EdgeInsets.only(bottom: Styles.padding),
        child: SizedBox(
          width: iconSize,
          height: iconSize,
          child: SvgPicture.asset(PosIcons.warningPath),
        ),
      );
    }

    return Container();
  }

  Widget _buildTitle() {
    if (title != null) {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title!,
            style: Styles.title,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildText() {
    if (text != null) {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            text!,
            style: Styles.text,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildBtnCancel() {
    if (isCancel == true) {
      return _buttonWrap(
        ButtonWidget(
          text: cancelText ?? 'ไม่ใช่',
          onClicked: () {
            if (isBack == true) {
              Get.back();
            }

            if (onCancel != null) {
              onCancel!();
            }
          },
          colorPrimary: Colors.white,
          borderColor: Styles.buttonCancelBorderColor,
          style: Styles.buttonCancel,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildBtnDone() {
    if (isDone == true) {
      return _buttonWrap(
        ButtonWidget(
          text: doneText ?? 'ใช่',
          onClicked: () {
            if (isBack == true) {
              Get.back();
            }

            if (onDone != null) {
              onDone!();
            }
          },
          colorPrimary: Styles.buttonPrimaryColor,
          style: Styles.buttonPrimary,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildClose() {
    return Positioned(
      right: 20,
      top: 20,
      child: GestureDetector(
        onTap: () {
          if (isBack == true) {
            Get.back();
          }

          if (onClose != null) {
            onClose!();
          }
        },
        child: Container(
          height: 22.7,
          width: 22.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
          ),
          child: Center(
            child: SizedBox(
              child: SvgPicture.asset(PosIcons.closePath,
                  color: const Color.fromRGBO(224, 224, 224, 1)),
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonWrap(Widget child) {
    if (isCancel == true && isDone == true) {
      return Expanded(child: child);
    } else {
      return ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 356,
        ),
        child: child,
      );
    }
  }
}
