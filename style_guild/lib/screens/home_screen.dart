import 'package:flutter/material.dart';
import 'package:style_guild/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:style_guild/widgets/text_field_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Size: $width x $height'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildContent(false)),
              Expanded(child: _buildContent(true)),
            ],
          ),
        ),
      ),
    );
  }

  _buildContent(bool isResponsive) {
    TextStyle textReg28 = Styles.text.copyWith(
        fontSize: isResponsive ? Styles.fontSize.sp : Styles.fontSize);

    TextStyle textReg18 =
        Styles.textReg18.copyWith(fontSize: isResponsive ? 18.sp : 18);
    TextStyle textSemi28 =
        Styles.textSemi28.copyWith(fontSize: isResponsive ? 28.sp : 28);
    TextStyle textSemi32 =
        Styles.textSemi32.copyWith(fontSize: isResponsive ? 32.sp : 32);
    TextStyle textReg40 =
        Styles.textReg40.copyWith(fontSize: isResponsive ? 40.sp : 40);
    TextStyle textSemi64 =
        Styles.textSemi64.copyWith(fontSize: isResponsive ? 64.sp : 64);
    TextStyle textSemi40 =
        Styles.textSemi40.copyWith(fontSize: isResponsive ? 40.sp : 40);
    TextStyle textSemi48 =
        Styles.textSemi48.copyWith(fontSize: isResponsive ? 48.sp : 48);
    TextStyle textBold96 = Styles.textBold96.copyWith(fontSize: isResponsive ? 96.sp : 96);

    TextStyle textFieldStyle = textReg28.copyWith(fontWeight: FontWeight.w600);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 20,
                child: Text(
                  'Logo: ',
                  style: textReg28.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 80,
                child: Text(
                  'POS android',
                  style: textReg28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SeparatorWidget(),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 20,
                child: Text(
                  'Concept: ',
                  style: textReg28.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 80,
                child: Text(
                  'ระบบจัดการร้านค้าที่ตอบทุกความต้องการ',
                  style: textReg28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SeparatorWidget(),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 20,
                child: Text(
                  'Design: ',
                  style: textReg28.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 80,
                child: Text(
                  'ฟันเฟืองที่ขับเคลื่อนบนระบบ POS android โดยการนำรูปแบบ Synchronize icon มาออกแบบในรูปแบบของตัวอักษร O ให้อยู่ระหว่างตัวอักษร P และ S เพื่อต้องการให้สื่อถึงการทำงานของ ระบบการจัดการสินค้าของ POS android ที่กำลังหมุนและทำงานเพื่อ ตอบสนองทุกความต้องการของผู้ใช้งานอยู่ตลอดเวลา',
                  style: textReg28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SeparatorWidget(),
          _buildRow('18px', 'Reg', 'Online/offline', textStyle: textReg18),
          _buildRow('28px', 'Semi', 'ชื่อร้านค้า', textStyle: textSemi28),
          _buildRow('32px', 'Semi', 'หมวดหมู่สินค้า', textStyle: textSemi32),
          _buildRow('40px', 'Reg', 'เมนู (Slide-bar)', textStyle: textReg40),
          _buildRow('40px', 'Semi', 'เมนู (Slide-bar), รายการสินค้าในตะกร้า', textStyle: textSemi40),
          _buildRow('48px', 'Semi', 'ราคาสุทธิ', textStyle: textSemi48),
          _buildRow('64px', 'Semi', 'Button, Numpad', textStyle: textSemi64),
          _buildRow('96px', 'Bold', 'Total (ตัวเลข)', textStyle: textBold96),
          const SizedBox(height: 20),
          TextFieldWidget(style: textFieldStyle),
          const SizedBox(height: 20),
          _buildButton(isResponsive),
        ],
      ),
    );
  }

  _buildRow(String size, String type, String status, {TextStyle? textStyle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(size, style: Styles.subText),
              const SizedBox(width: 5),
              Text(type, style: Styles.subText),
            ],
          ),
          const SizedBox(height: 5),
          Text(status, style: textStyle ?? Styles.text),
          const SizedBox(height: 5),
          const SeparatorWidget(),
        ],
      ),
    );
  }

  _buildButton(bool isResponsive) {
    TextStyle _textButton = Styles.text.copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: isResponsive ? Styles.fontSize.sp : Styles.fontSize);

    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Styles.colorPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          minimumSize: const Size(0, 0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Styles.colorPrimary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Button',
          style: _textButton,
        ),
        onPressed: () {},
      ),
    );
  }
}

class SeparatorWidget extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const SeparatorWidget({
    Key? key,
    this.height = 1,
    this.color = Colors.grey,
    this.width = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();

        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
