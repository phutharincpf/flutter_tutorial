import 'package:get/get.dart';
import 'package:posandroid101/controllers/payment_controller.dart';

class ShoppingBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => PaymentController());
  }
}