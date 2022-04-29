import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';

class DialogWidget extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final String? title;

  const DialogWidget(
      {Key? key, required this.child, this.backgroundColor, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buttonAnimation(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Styles.dialogRadius),
            color: backgroundColor ?? Colors.white,
          ),
          margin: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              _buildTitle(),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.transparent,
    //   body: TweenAnimationBuilder(
    //     duration: const Duration(milliseconds: 100),
    //     tween: Tween<double>(begin: 50, end: 0),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(Styles.dialogRadius),
    //         color: backgroundColor ?? Colors.white,
    //       ),
    //       margin: const EdgeInsets.all(30.0),
    //       child: ,
    //     ),
    //     builder: (BuildContext context, double size, Widget? child) {
    //       return Center(
    //         child: SizedBox(
    //           width: Get.width - size,
    //           height: Get.height - size,
    //           child: TweenAnimationBuilder(
    //             duration: const Duration(milliseconds: 100),
    //             tween: Tween<double>(begin: 0, end: 1),
    //             child: child,
    //             builder: (BuildContext context, double _opacity, Widget? _child) {
    //               return Opacity(opacity: _opacity, child: _child);
    //             },
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );

    // return AlertDialog(
    //   contentPadding: const EdgeInsets.all(30.0),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //   content: child,
    // );

    // return Dialog(
    //   key: key,
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    //   backgroundColor: Colors.green,
    //   insetPadding:const EdgeInsets.all(30.0),
    //   elevation: 0,
    //   child: Container(
    //     color: Colors.transparent,
    //
    //     child: child,
    //   ),
    // );
  }

  _buildIcon() {
    return Container();
  }

  _buildTitle() {
    if (title!.isNotEmpty) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Styles.dialogRadius),
            topRight: Radius.circular(Styles.dialogRadius),
          ),
          color: Styles.appbarColor,
        ),
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Styles.padding, vertical: Styles.padding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildIcon(),
                      Text(title!,
                          style: Styles.title
                              .copyWith(color: Styles.appbarTextColor)),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(40, 40),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Icon(Icons.clear,
                        size: 30, color: Styles.appbarTextColor),
                  )
                ],
              )),
        ),
      );
    } else {
      return Container();
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
