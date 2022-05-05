import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/controllers/hotkey_controller.dart';

class HotkeyCard extends StatelessWidget {
  const HotkeyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HotKeyController hotKeyController = Get.find();

    return SizedBox(
      width: double.infinity,
      child: Obx((){

        if( hotKeyController.isLoadItem ){
          return _buildSkeleton();
        }
        else{
          return GridView.builder(
            padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: hotKeyController.itemList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Styles.radius),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38.withOpacity(.05),
                        spreadRadius: 0,
                        blurRadius: 2, // changes position of shadow
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Styles.radius),
                            topRight: Radius.circular(Styles.radius),
                          ),
                        ),
                      )),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hotKeyController.itemList[index].name, style: Styles.text.copyWith(height: 1, fontWeight: FontWeight.w600), softWrap: true, overflow: TextOverflow.visible, maxLines: 1,),
                            Text('${hotKeyController.itemList[index].price}', style: Styles.title.copyWith(height: 1, fontWeight: FontWeight.w700)),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
          );
        }
      }),
    );
  }

  _buildSkeleton(){

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Styles.radius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38.withOpacity(.05),
                  spreadRadius: 0,
                  blurRadius: 2, // changes position of shadow
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Styles.radius),
                      topRight: Radius.circular(Styles.radius),
                    ),
                  ),
                )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 40, child: Container(
                            width: double.infinity,
                            height: 15,
                            color: Colors.grey.withOpacity(.2),
                          )),
                          Expanded(flex: 60, child: Container()),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(flex: 80, child: Container(
                            width: double.infinity,
                            height: 10,
                            color: Colors.grey.withOpacity(.2),
                          )),
                          Expanded(flex: 20, child: Container()),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
