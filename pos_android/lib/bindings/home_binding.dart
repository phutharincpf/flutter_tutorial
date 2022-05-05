import 'package:get/get.dart';
import 'package:pos_android/controllers/payment_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<PaymentController>(PaymentController());
  }
}
