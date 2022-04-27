import 'package:get/get.dart';
import 'package:pos/controllers/user_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<UserController>(UserController());
  }
}
