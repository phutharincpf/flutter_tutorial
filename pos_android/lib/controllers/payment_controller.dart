import 'package:get/get.dart';
import 'package:pos_android/payloads/payment_method_payload.dart';

class PaymentController extends GetxController {
  final RxList<PaymentMethodPayload> _methods = RxList<PaymentMethodPayload>().obs();
  final RxString _methodCode = ''.obs;

  String get methodCode => _methodCode.value;
  List<PaymentMethodPayload> get methods => _methods;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    _initMethod();
    activeMethod(_methods[0].methodCode);
  }

  void _initMethod() {
    _methods.clear();

    _methods.add(PaymentMethodPayload(displayName: 'เงินสด', methodCode: 'cash'));
    _methods.add(PaymentMethodPayload(displayName: 'True Money Wallet', methodCode: 'trueMoneyWallet'));
    _methods.add(PaymentMethodPayload(displayName: 'QR Prompt Pay', methodCode: 'QRPromptPay'));
    _methods.add(PaymentMethodPayload(displayName: 'Gift Voucher', methodCode: 'giftVoucher'));
    _methods.add(PaymentMethodPayload(displayName: 'ShopeePay', methodCode: 'shopeePay'));
    _methods.add(PaymentMethodPayload(displayName: 'VISA Card', methodCode: 'visa'));
    _methods.add(PaymentMethodPayload(displayName: 'Master Card', methodCode: 'masterClass'));
    _methods.add(PaymentMethodPayload(displayName: 'อื่นๆ', methodCode: 'other'));

  }

  void activeMethod(String code) {
    _methodCode.value = code;
  }
}