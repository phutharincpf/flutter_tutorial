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
          padding: const EdgeInsets.symmetric(vertical: Styles.padding/2, horizontal: Styles.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 25,
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
                                  size: 22,
                                ),
                              ),
                            ),
                            leadingText!=null ? const SizedBox(width: 2): Container(),
                            leadingText!=null ? Expanded(
                              child: Text(
                                leadingText!,
                                style: Styles.text
                                    .copyWith(color: Colors.white, height: 1.2),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                softWrap: true,
                              ),
                            ) : Container(),
                            const SizedBox(width: 6),
                          ],
                        ),
                      )
                    : Container(),
              ),
              Expanded(
                flex: 50,
                child: title!=null ? Text(
                  title!,
                  style: Styles.title.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ): Container(),
              ),
              Expanded(flex: 25,child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
