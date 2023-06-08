import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Lable extends StatelessWidget {
  String text;
  TextStyle style;
  TextAlign? textAlign;
  Alignment? alignment;
  double vertical, horizantal;
  bool isAlign = false;
  int? maxLines;

  Lable(
    this.text,
    this.style, {
    this.textAlign = TextAlign.left,
    this.vertical = 8.0,
    this.alignment = Alignment.center,
    this.horizantal = 0.0,
    this.isAlign = true,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: vertical.sp, horizontal: horizantal.sp),
      // alignment: alignment,
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}
