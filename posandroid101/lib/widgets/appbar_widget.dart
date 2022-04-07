import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posandroid101/constants/styles.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
    this.title,
    this.automaticallyImplyLeading = true,
    this.leadingText,
    this.leadingClicked,
  }) : super(key: key);

  final String? title;
  final String? leadingText;
  final bool? automaticallyImplyLeading;
  final VoidCallback? leadingClicked;

  @override
  Widget build(BuildContext context) {
    bool _automaticallyImplyLeading = Get.previousRoute != '' &&
        Get.currentRoute != Get.previousRoute &&
        automaticallyImplyLeading == true;

    return Container(
      color: Styles.appbarColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: Styles.padding / 2,
              right: Styles.padding,
              bottom: Styles.padding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _automaticallyImplyLeading == true
                    ? GestureDetector(
                        onTap: leadingClicked ?? () => Get.back(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 24,
                              height: 24,
                              child: Center(
                                  child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 16,
                              )),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              leadingText ?? 'กลับ',
                              style: Styles.text.copyWith(color: Colors.white, height: 1),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
              Expanded(
                child: Text(
                  title ?? 'POS Android 101',
                  style: Styles.title.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}