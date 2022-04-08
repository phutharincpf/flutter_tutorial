import 'dart:async';

import 'package:get/get.dart';
import 'package:posandroid101/routes/app_pages.dart';

class PaymentController extends GetxController {
  final RxInt _countdown = 0.obs;
  get countdown => _countdown.value;

  final RxString _currentMethod = ''.obs;
  get currentMethod => _currentMethod.value;

  late StreamSubscription _streamCountdown;

  void startCountdown() {
    _countdown.value = 10;
    const int ticks = 9;
    _streamCountdown = Stream<int>.periodic(
        const Duration(seconds: 1), (x) => ticks - x % (ticks + 1))
        .listen((value) {
      if(value == 0){
        clearCountdown();
        Get.offAllNamed(Routes.home);
      }
      else{
        _countdown.value = value;
      }
    });
  }

  clearCountdown(){
    // print('isPaused ------------------> ${_streamCountdown.isPaused}');
    _streamCountdown.cancel();
  }

  @override
  void dispose() {
    clearCountdown();
    super.dispose();
  }

  void activeMethod(String method) {
    _currentMethod.value = method;
  }
}