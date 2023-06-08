import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';

class Btn extends StatelessWidget {
  String text;
  double width, height;
  VoidCallback? onPressed;
  Color color = AppColors.primary, textColor = AppColors.white;

  double verticalMargin = 0, horizontal = 4.w;
  final double borderRadius, fontSize;
  final bool isBorder, isgradient, isWithIcon;
  FontWeight fontweight;
  Btn(this.text,
      {super.key,
      this.width = double.infinity,
      this.height = 58.0,
      this.verticalMargin = 10,
      this.horizontal = 15,
      this.fontweight = FontWeight.w700,
      this.color = AppColors.primary,
      this.textColor = Colors.white,
      this.onPressed,
      this.fontSize = 18,
      this.borderRadius = 32.0,
      this.isBorder = false,
      this.isWithIcon = false,
      this.isgradient = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontal.w, vertical: verticalMargin.h),
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius.sp)),
            border: isBorder
                ? Border.all(color: textColor, width: 1.0)
                : Border.all(color: Colors.transparent, width: 0.0),
            color: color,
            gradient: isgradient
                ? LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[AppColors.brown, AppColors.mid_yellow],
                  )
                : LinearGradient(
                    colors: <Color>[color, color],
                  )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isWithIcon
                ? SvgPicture.asset(
                    'assets/images/bag.svg',
                  )
                : const SizedBox(),
            SizedBox(
              width: 10.sp,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium!.merge(TextStyle(
              color: textColor,
              fontSize: fontSize.sp,
              fontWeight: fontweight)),
            ),
          ],
        ),
      ),
    );
  }
}
