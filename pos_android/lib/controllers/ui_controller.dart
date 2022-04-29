import 'package:get/get.dart';
import 'package:pos_android/constants/pos_icons.dart';
import 'package:pos_android/controllers/master_controller.dart';
import 'package:pos_android/payloads/menu_payload.dart';
import 'package:pos_android/routes/app_pages.dart';
import 'package:pos_android/screens/master/master_modal.dart';
import 'package:pos_android/screens/order/order_cancel_screen.dart';
import 'package:pos_android/widgets/dialog_widget.dart';

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
        route: Routes.syncDataMaster,
        svgPath: PosIcons.updateSVGPath,
        isModal: true,
        page: const MasterModal(),
      ),
    );

    _navigationList.add(
      MenuPayload(
        nameLocal: 'ยกเลิกใบเสร็จ',
        route: Routes.orderCancel,
        svgPath: PosIcons.receiptSVGPath,
        isDialog: true,
        page: const OrderCancelScreen(),
      ),
    );

    _navigationList.add(
      MenuPayload(
        nameLocal: 'รายงานราคาสินค้า',
        route: Routes.reportPricing,
        svgPath: PosIcons.pricingSVGPath,
      ),
    );

    _navigationList.add(
      MenuPayload(
        nameLocal: 'ออกจากระบบ',
        route: Routes.logout,
        svgPath: PosIcons.logoutSVGPath,
      ),
    );
  }

  void activeNavigation(MenuPayload menu) {
    switch (menu.route) {
      case Routes.syncDataMaster: {
          MasterController masterController = Get.find();
          masterController.showModal();
        }
        break;

      case Routes.logout:
        {
          Get.offAllNamed(Routes.login);
        }
        break;

      default:
        {
          _activeNavigationDefault(menu);
        }
        break;
    }
  }

  void _activeNavigationDefault(MenuPayload menu) {
    if (Get.currentRoute != menu.route) {
      Get.back();

      if (menu.isModal && menu.page != null) {
        Get.dialog(menu.page!);
      } else if (menu.isDialog && menu.page != null) {
        Get.dialog(DialogWidget(
          title: menu.nameLocal,
          child: menu.page!,
        ));
      } else {
        Get.toNamed(menu.route);
      }
    }
  }
}

/*
//

// infoDialog(context, const OrderCancelScreen());

// Get.generalDialog(pageBuilder:
//     (BuildContext buildContext,
//         Animation animation,
//         Animation secondaryAnimation) {
//   return AlertDialog(
//     contentPadding: EdgeInsets.zero,
//     // this padding user for outside of alert padding
//     insetPadding: const EdgeInsets.all(30.0),
//     content: Container(
//         height: Get.height - 300,
//         // Change as per your requirement
//         width: Get.width,
//         // Change as per your requirement
//         color: Colors.deepOrange,
//         child: const OrderCancelScreen()),
//   );
// });
// Get.dialog(widget);
 */
