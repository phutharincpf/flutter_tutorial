import 'package:get/get.dart';

class UserController extends GetxController {

  final RxBool _isWorking = false.obs;
  bool get isWorking => _isWorking.value;

  Future<bool> login (String user, String pass) async {
    _isWorking.value = true;
    // Get.dialog(const ModalWidget(
    //   title: 'กำลังโหลด...',
    //   isDone: false,
    //   isCancel: false,
    // ));

    await Future.delayed(const Duration(seconds: 2), () {});

    _isWorking.value = false;
    return true;
  }
}