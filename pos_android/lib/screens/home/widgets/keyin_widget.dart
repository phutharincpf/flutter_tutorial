import 'package:flutter/material.dart';
import 'package:pos_android/constants/keys.dart';
import 'package:pos_android/constants/styles.dart';
import 'package:pos_android/widgets/form_field_widget.dart';

class KeyInWidget extends StatefulWidget {
  const KeyInWidget({Key? key}) : super(key: key);

  @override
  State<KeyInWidget> createState() => _KeyInWidgetState();
}

class _KeyInWidgetState extends State<KeyInWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.transparent,
          width: 100,
          child: const FormFieldWidget(
            placeholder: 'จำนวน',
            borderWidth: 1,
          ),
        ),
        const SizedBox(width: Styles.padding / 2),
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: FormFieldWidget(
              placeholder: 'กรอกรหัสสินค้า',
              borderWidth: 1,
              enabledBorderColor: Styles.colorPrimary,

            ),
          ),
        )
      ],
    );
  }
}
