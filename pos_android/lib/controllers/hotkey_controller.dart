import 'package:get/get.dart';
import 'package:pos_android/payloads/hotkey_payload.dart';

class HotKeyController extends GetxController {
  final RxList<HotKeyPayload> _hotKeyList = RxList<HotKeyPayload>().obs();
  final RxString _currentCode = ''.obs;
  final RxBool _isLoad = true.obs;
  final RxBool _isLoadItem = false.obs;
  final RxList<HotKeyItemPayload> _itemList = RxList<HotKeyItemPayload>().obs();

  List<HotKeyPayload> get hotKeyList => _hotKeyList;
  List<HotKeyItemPayload> get itemList => _itemList;
  String get currentCode => _currentCode.value;
  bool get isLoad => _isLoad.value;
  bool get isLoadItem => _isLoadItem.value;

  void init() async {
    await _getHotKey();
    activeHotKey(_hotKeyList[0].code);
  }

  Future<void> _getHotKey() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    _hotKeyList.clear();

    // -----------------------
    _hotKeyList.add(HotKeyPayload(code: '01', name: 'ทั้วไป'));
    _hotKeyList.add(HotKeyPayload(code: '02', name: 'All Cafe'));
    _hotKeyList.add(HotKeyPayload(code: '03', name: 'น้ำ'));
    _hotKeyList.add(HotKeyPayload(code: '04', name: 'ไอศกรีม'));
    _hotKeyList.add(HotKeyPayload(code: '05', name: 'ขนมและลูกอม'));
    // -----------------------

    _isLoad.value = false;
  }

  void activeHotKey(String code) async {
    if( _isLoadItem.value ){
      print('กำลังโหลด...');
      return;
    }

    HotKeyPayload? hotKey = _hotKeyList.firstWhereOrNull((cat) => cat.code==code);

    if( hotKey!=null ){
      print('${hotKey.code} ==============> ${hotKey.isLoad}');
      _currentCode.value = code;
      _isLoadItem.value = hotKey.isLoad;
      _itemList.value = hotKey.items;

      if( hotKey.isLoad ){
        hotKey.items = await _getProductByHotKey(code);
        hotKey.isLoad = false;

        _isLoadItem.value = hotKey.isLoad;
        _itemList.value = hotKey.items;
      }
    }
  }

  Future<List<HotKeyItemPayload>> _getProductByHotKey(String hotKey) async {
    await Future.delayed(const Duration(seconds: 3), () {});

    List<HotKeyItemPayload> items = [];

    //**********************************************
    items.add(HotKeyItemPayload(price: 20, name: 'Item$hotKey 0'));
    items.add(HotKeyItemPayload(price: 100, name: 'Item$hotKey 1'));
    items.add(HotKeyItemPayload(price: 500, name: 'Item$hotKey 2'));
    items.add(HotKeyItemPayload(price: 1000, name: 'Item$hotKey 3'));
    //**********************************************
    return items;
  }
}