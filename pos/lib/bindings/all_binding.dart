import 'package:get/get.dart';
import 'package:pos/controllers/ui_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<UIController>(UIController());
  }
}
