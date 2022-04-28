import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pos/constants/keys.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/controllers/user_controller.dart';
import 'package:pos/routes/app_pages.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/form_field_widget.dart';
import 'package:pos/widgets/modal_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;
  final UserController userController = Get.find();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _closeKeyboard() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _formValidator() async {
    _closeKeyboard();

    if (userController.isWorking) return;

    if (_formKey.currentState!.validate()) {
      String _usernameValue = _usernameController.text.toString().trim();
      String _passwordValue = _passwordController.text.toString();

      bool isLoginSuccess = await userController.login(_usernameValue, _passwordValue);
      if (isLoginSuccess) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.dialog(const ModalWidget(
          title: 'เข้าสู่ระบบไม่สำเร็จ',
          text: 'Username/Password ไม่ถูกต้อง',
          doneText: 'ตกลง',
          isCancel: false,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const String _pageTitle = "เข้าสู่ระบบ";
    // const String _pageDescription = "AxPOS แอปพลิเคชั่นสำหรับจัดการหน้าร้าน เพื่อช่วยอำนวยความสะดวกในการดำเนินธุรกิจ ให้การขายเป็นเรื่องง่าย สะดวก และรวดเร็ว";
    const String _btnSubmitText = "เข้าสู่ระบบ";

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 550),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _pageTitle,
                        style: Styles.title,
                        textAlign: TextAlign.left,
                      ),
                      // Text(
                      //   _pageDescription,
                      //   style: Styles.text.copyWith(
                      //       color: const Color.fromRGBO(71, 77, 87, 1)),
                      //   textAlign: TextAlign.left,
                      // ),
                      const SizedBox(height: 20),
                      FormFieldWidget(
                        key: Key(Keys.loginUsername),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        label: 'ชื่อผู้ใช้งาน (เบอร์โทรศัพท์)',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณาระบุชื่อผู้ใช้งาน';
                          }
                          return null;
                        },
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 20),
                      FormFieldWidget(
                        key: Key(Keys.loginPassword),
                        label: 'รหัสผ่าน',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณาระบุรหัสผ่าน';
                          }
                          return null;
                        },
                        obscureText: !_showPassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            child: Icon(
                              _showPassword == true
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.visibility_off,
                            ),
                            onTap: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                          ),
                        ),
                      ),
                      // const SizedBox(height: 8),
                      // Text(
                      //   'ลืมรหัสผ่าน?',
                      //   style: TextStyle(
                      //       fontSize: 20, color: Styles.colorSecondary),
                      //   textAlign: TextAlign.left,
                      // ),
                      const SizedBox(height: 30),
                      Stack(
                        children: [
                          ButtonWidget(
                            key: Key(Keys.loginSubmit),
                            text: _btnSubmitText,
                            onClicked: _formValidator,
                          ),
                          Obx(
                                () => userController.isWorking == true
                                ? Positioned(
                              top: 0,
                              left: 0,
                              bottom: 0,
                              right: 0,
                              child: Container(
                                // width: double.infinity,
                                color: Colors.white.withOpacity(0.5),
                                padding: const EdgeInsets.all(8.0),
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                            )
                                : Container(),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
