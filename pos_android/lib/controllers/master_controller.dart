import 'package:get/get.dart';
import 'package:pos_android/screens/master/master_modal.dart';
import 'package:pos_android/utils/snackbar.dart';

class MasterController extends GetxController {
  final RxBool _showModal = false.obs;
  final RxBool _processing = false.obs;
  final RxInt _currentStep = 0.obs;
  bool _showSnackBar = false;
  bool _coolDown = false;

  final List<MasterStatusPayload> statusList = [
    MasterStatusPayload(message: 'กำลังเตรียมข้อมูลเพื่อทำการเชื่อมต่อ', statusCode: 200),
    MasterStatusPayload(message: 'กำลังเชื่อมต่อข้อมูลจากส่วนกลาง', statusCode: 200, duration: 3),
    MasterStatusPayload(message: 'กำลังอัพเดทข้อมูลลงในเครื่อง POS', statusCode: 200, duration: 10),
    MasterStatusPayload(message: 'อัพเดทข้อมูลสำเร็จ', statusCode: 200, duration: 3),
    MasterStatusPayload(message: 'ข้อมูลสินค้าล่าสุดวันที่ 12/02/2564 12:14', statusCode: 200),
  ];

  double get statusPercent =>
      (100 * (_currentStep.value + 1)) / statusList.length;

  bool get isModal => _showModal.value;
  bool get processing => _processing.value;

  String get statusMessage => statusList[_currentStep.value].message;
  int get currentStep => _currentStep.value;

  void showModal() {
    _showModal.value = true;
    _showSnackBar = false;
    Get.dialog(const MasterModal());

    if( !_coolDown ){
      updateStatus();
    }

  }

  void closeModal() {
    _showModal.value = false;
    _showSnackBar = true;
  }

  Future<void> updateStatus() async {
    if (_processing.value == false) {
      // Reset processing
      _currentStep.value = 0;
      _processing.value = true;
    }

    // ----------------------------
    int _step = currentStep;
    print('Master: updateStatus : ${_currentStep.value} / ${statusList[_step].message} / loading:${statusList[_step].loading}  / Duration: ${statusList[_step].duration}');
    if (!statusList[_step].loading) {
      statusList[_step].loading = true;
      // _statusMessage.value = statusList[_step].message;

      await Future.delayed(Duration(seconds: statusList[_step].duration), () {
        print('Master: updateStatus : $_step ==========> Complete');
        statusList[_step].loading = false;
        _currentStep.value++;

        if( _currentStep.value == statusList.length-1 ){
          print('Master: updateStatus : $_step ==========> Done');
          _processing.value = false;
          _alertMessageDone();

          _setCoolDown();
        }
        else{
          //
          // switch (_currentStep.value) {
          //   case 0: { _connectInternet();} break;
          //   case 1: {_connectMaterHQ();} break;
          //   case 2: {_zipFile();} break;
          //   case 3: {_done();} break;
          // }

          updateStatus();
        }
      });
    }
  }

  void _alertMessageDone(){
    MasterStatusPayload _status = statusList[_currentStep.value];

    if( _showSnackBar ){
      SnackBarUtil.show(title: 'สำเร็จ!', text: _status.message);
    }
  }

  void _setCoolDown() async {

    _coolDown = true;
    await Future.delayed(const Duration(seconds: 60), () {
      _coolDown = false;
    });
  }
}

class MasterStatusPayload {
  final int statusCode;
  late int duration;
  late String message;
  late bool loading;
  late String lastDate;

  MasterStatusPayload(
      {required this.message, required this.statusCode, this.loading = false, this.duration=1});
}