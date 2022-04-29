import 'package:get/get.dart';
import 'package:pos_android/screens/master/master_modal.dart';

class MasterController extends GetxController {
  final RxDouble _loadPercent = 0.0.obs;
  final RxInt _statusCode = 0.obs;
  final RxBool _showModal = false.obs;
  final RxBool _processing = false.obs;

  final List<MasterStatusPayload> statusList = [
    MasterStatusPayload(message: 'กำลังเตรียมข้อมูลเพื่อทำการเชื่อมต่อ', statusCode: 200),
    MasterStatusPayload(message: 'กำลังเชื่อมต่อข้อมูลจากส่วนกลาง', statusCode: 200),
    MasterStatusPayload(message: 'กำลังอัพเดทข้อมูลลงในเครื่อง', statusCode: 200),
    MasterStatusPayload(message: 'อัพเดทข้อมูลสำเร็จ', statusCode: 200),
  ];

  double get statusPercent =>
      (100 * (_statusCode.value + 1)) / statusList.length;

  int get statusCode => _statusCode.value;

  bool get isModal => _showModal.value;
  bool get processing => _processing.value;

  String get statusMessage => statusList[_statusCode.value].message;

  void showModal() {
    _showModal.value = true;
    Get.dialog(const MasterModal());
    updateStatus();
  }

  void closeModal() {
    _showModal.value = false;
  }

  Future<void> updateStatus() async {
    MasterStatusPayload status = statusList[_statusCode.value];

    print('Master: updateStatus : ${_statusCode.value}');


    if (_processing.value == false) {

      // Reset processing
      _statusCode.value = 0;
      _processing.value = true;
    }


    switch (_statusCode.value) {
      case 0: { _connectInternet();} break;
      case 1: {_connectMaterHQ();} break;
      case 2:{_zipFile();} break;
    }
  }

  // Step: 0
  Future<void> _connectInternet() async {
    int _step = 0;
    print('Master: _connectInternet ${_statusCode.value} : ${statusList[_step].loading}');

    if (_statusCode.value == _step && !statusList[_step].loading) {
      statusList[_step].loading = true;

      await Future.delayed(const Duration(seconds: 2), () {
        statusList[_step].loading = false;

        _statusCode.value++;
        updateStatus();
      });
    }
  }

  // Step: 1
  Future<void> _connectMaterHQ() async {
    int _step = 1;
    print('Master: _connectMaterHQ ${_statusCode.value} : ${statusList[_step].loading}');

    if (_statusCode.value == _step && !statusList[_step].loading) {
      statusList[_step].loading = true;

      await Future.delayed(const Duration(seconds: 10), () {
        statusList[_step].loading = false;

        _statusCode.value++;
        updateStatus();
      });
    }
  }

  // Step: 2
  Future<void> _zipFile() async {
    int _step = 2;
    print('Master: _zipFile ${_statusCode.value} : ${statusList[_step].loading}');

    if (_statusCode.value == _step && !statusList[_step].loading) {
      statusList[_step].loading = true;

      await Future.delayed(const Duration(seconds: 10), () {
        statusList[_step].loading = false;
        _statusCode.value++;

        // update
        _processing.value = false;
      });
    }
  }
}

class MasterStatusPayload {
  final int statusCode;
  final String message;
  late bool loading;

  MasterStatusPayload(
      {required this.message, required this.statusCode, this.loading = false});
}