import 'package:flutter/material.dart';
import 'package:pos/common/models/navigation_drawer.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/screens/home/cart/cart_layout.dart';
import 'package:pos/screens/home/hotkey/hotkey_widget.dart';
import 'package:pos/screens/home/widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double fullWidth = MediaQuery.of(context).size.width;
    bool isAspectRatio43 = fullWidth < 1360;

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        drawer: const NavigationDrawer(),
        backgroundColor: Styles.mainColor,
        drawerEnableOpenDragGesture: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: isAspectRatio43 ? 42 : 50,
                    child: const HotkeyLayout(),
                  ),
                  Expanded(
                    flex: isAspectRatio43 ? 58 : 50,
                    child: const CartLayout(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
