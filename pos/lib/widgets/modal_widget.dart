import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/widgets/button_widget.dart';

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
    this.width = 730,
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
    double iconSize = 150.0;

    _buildIcon(){
      return Container();
    }
    _buildTitle() {
      if (title != null) {
        return Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title!,
              style: Styles.h1,
            ),
          ),
        );
      } else {
        return Container();
      }
    }

    _buildText() {
      if (title != null) {
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
                        SizedBox(height: title != null ? 30 : 60),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 20),
                            isCancel == true
                                ? buttonWrap(
                                    ButtonWidget(
                                      text: cancelText ?? 'ไม่ใช่',
                                      buttonHeight: 72,
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
                                  )
                                : Container(),
                            SizedBox(
                                width: isCancel == true && isDone == true
                                    ? 20
                                    : 0),
                            isDone == true
                                ? buttonWrap(
                                    ButtonWidget(
                                      text: doneText ?? 'ใช่',
                                      buttonHeight: 72,
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
                                  )
                                : Container(),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
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
                  child: const Center(
                    child: SizedBox(
                      child: ImageIcon(
                        AssetImage('assets/images/x-button.png'),
                        color: Color.fromRGBO(224, 224, 224, 1),
                      ),
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonWrap(Widget child) {
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
