import 'package:get/get.dart';
import 'package:pos_android/controllers/hotkey_controller.dart';
import 'package:pos_android/controllers/master_controller.dart';
import 'package:pos_android/controllers/ui_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<UIController>(UIController());
    Get.put<MasterController>(MasterController());

    // Get.lazyPut(()=>HotKeyController());
    Get.put<HotKeyController>(HotKeyController());
  }
}
