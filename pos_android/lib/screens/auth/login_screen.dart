import 'package:flutter/material.dart';
import 'package:pos_android/screens/auth/widgets/login_form_widget.dart';
import 'package:pos_android/widgets/carousel_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(241, 243, 255, 1),
        body: Row(
          children: const [
            Expanded(
              flex: 60,
              child: CarouselWidget(),
            ),
            Expanded(
              flex: 40,
              child: LoginFormWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
