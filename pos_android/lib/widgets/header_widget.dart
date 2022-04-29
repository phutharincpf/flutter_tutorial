import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final bool? automaticallyImplyLeading;
  final VoidCallback? onClosed;
  final bool? isBack;

  const HeaderWidget(
    this.title, {
    Key? key,
    this.automaticallyImplyLeading = true,
    this.isBack = true,
    this.onClosed,
  }) : super(key: key);

  _goToBack(){
    if(isBack==true){
      Get.back();
    }
  }

  _buildBack() {
    if (automaticallyImplyLeading == false || Get.previousRoute == '') {
      return Container();
    }

    return TextButton(
      onPressed: () {
        _goToBack();

        if(onClosed!=null){
          onClosed!();
        }
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(40, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Center(
          child: Icon(
        Icons.arrow_back,
        color: Styles.appbarTextColor,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Styles.padding, vertical: Styles.padding / 2),
      color: Styles.appbarColor,
      child: SafeArea(
        child: Row(
          children: [
            _buildBack(),
            const SizedBox(width: Styles.padding / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Styles.title.copyWith(color: Styles.appbarTextColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
