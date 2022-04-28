import 'package:get/get.dart';
import 'package:pos_android/payloads/menu_payload.dart';
import 'package:pos_android/routes/app_pages.dart';

class UIController extends GetxController {
  final RxList<MenuPayload> _navigationList = RxList<MenuPayload>().obs();

  List<MenuPayload> get navigationList => _navigationList;

  @override
  void onInit() {
    super.onInit();

    _setNavigation();
  }

  void _setNavigation() {
    _navigationList.clear();

    _navigationList.add(
      MenuPayload(
        nameLocal: 'อัพเดทข้อมูล',
        pathname: Routes.syncDataMaster,
        svgPath: 'assets/icons/update.svg',
      ),
    );
  }
}
