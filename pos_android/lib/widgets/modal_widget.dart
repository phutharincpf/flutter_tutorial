import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/pos_icons.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/widgets/button_widget.dart';

class ModalWidget extends StatelessWidget {
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
  final bool? isClose;

  final double width;
  final double height;
  final double? paddingHeader;
  final double? paddingFooter;

  final Widget? child;

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
    this.isClose = true,
    this.paddingHeader,
    this.paddingFooter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buttonAnimation(
      child: Scaffold(
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
                        borderRadius:
                            BorderRadius.circular(Styles.dialogRadius),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: paddingHeader ?? 30),
                          Expanded(
                            child: _buildBody(),
                          ),
                          isCancel == true || isDone == true
                              ? const SizedBox(height: Styles.padding)
                              : Container(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(width: Styles.padding),
                              _buildBtnCancel(),
                              SizedBox(
                                  width: isCancel == true &&
                                          isDone == true
                                      ? Styles.padding
                                      : 0),
                              _buildBtnDone(),
                              const SizedBox(width: Styles.padding),
                            ],
                          ),
                          SizedBox(height: paddingFooter ?? 30),
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
      ),
    );
  }

  Widget _buildBody() {
    if (child != null) {
      return child!;
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildIcon(),
          _buildTitle(),
          _buildText(),
        ],
      );
    }
  }

  Widget _buildIcon() {
    double iconSize = 100.0;

    if (icon == 'warning') {
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
    }

    return Container();
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
    }

    return Container();
  }

  Widget _buildBtnCancel() {
    if (isCancel == true) {
      return _buttonWrap(
        ButtonWidget(
          text: cancelText ?? 'ไม่ใช่',
          onClicked: () {
            _goToBack();

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
            _goToBack();

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
    Widget _icon = Container();
    if (isClose == true) {
      _icon = GestureDetector(
        onTap: () {
          _goToBack();

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
      );
    }

    return Positioned(
      right: 20,
      top: 20,
      child: _icon,
    );
  }

  void _goToBack() {
    if (isBack == true) {
      Get.back();
    }
  }

  Widget _buttonWrap(Widget child) {
    if (isCancel == true &&isDone == true) {
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

  Widget _buttonAnimation({child}) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: .75, end: 1),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 100),
        tween: Tween<double>(begin: 0, end: 1),
        child: child,
        builder: (BuildContext context, double _opacity, Widget? _child) {
          return Opacity(opacity: _opacity, child: _child);
        },
      ),
      builder: (BuildContext context, double _scale, Widget? _child) {
        return Transform.scale(scale: _scale, child: child);
      },
    );
  }
}
