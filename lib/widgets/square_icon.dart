import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';


class SquareIcon extends StatelessWidget {
  double width, height;
  Color container_color;
  String icon;
  double borderRadius, padding, margin;
  bool isBorder,isgradient;
  final BoxFit fit;

  SquareIcon(
    this.icon, {
    this.width = 50,
    this.height = 50,
    this.borderRadius = 8.0,
    this.margin = 10.0,
    this.padding = 5.0,
    this.container_color = Colors.white,
    this.isBorder = false,
        this.isgradient=false,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.all(padding.sp),
      decoration: BoxDecoration(
        color: container_color,
          gradient: isgradient? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[AppColors.brown, AppColors.mid_yellow],
          ):
          LinearGradient(
            colors: <Color>[container_color, container_color],
          ),
        border: isBorder
            ? Border.all(color: AppColors.grey, width: 1)
            : Border.all(
                color: AppColors.grey, width: 0, style: BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius.sp)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius.sp),
        child: (icon.contains('http'))
            ? Image.network(
                icon,
                fit: fit,
              )
            : ((icon.contains('svg'))
                ? SvgPicture.asset(
                    icon,
                    fit: fit,
                  )
                : Image.asset(
                    icon,
                    fit: fit,
                  )),
      ),
    );
  }
}
