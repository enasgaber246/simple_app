import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_colors.dart';
import 'lable.dart';

class BarWidget extends StatelessWidget {
  String rightIcon, leftIcon;
  String? lable;
  VoidCallback? onPressedLeft, onPressedRight;
  bool isBorder, islogo, isIconOnly;
  double padding;
  double rotate;
  Color container_color;

  final int quarterTurns;

  BarWidget({
    super.key,
    required this.rightIcon,
    required this.leftIcon,
    this.onPressedLeft,
    this.container_color = Colors.transparent,
    this.lable,
    this.padding = 9,
    this.onPressedRight,
    this.rotate = -1,
    this.isIconOnly = false,
    this.isBorder = false,
    this.islogo = true,
    this.quarterTurns = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 12.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              rightIcon == ''
                  ? const SizedBox()
                  : InkWell(
                      onTap: onPressedRight,
                      child: Container(
                        padding: EdgeInsets.all(13.0.sp),
                        margin: EdgeInsets.symmetric(horizontal: 10.0.sp),
                        width: 44.0.w,
                        height: 44.0.h,
                        decoration: BoxDecoration(
                          color: container_color,
                          border: isBorder
                              ? Border.all(
                                  color: AppColors.light_grey, width: 1.0)
                              : Border.all(
                                  color: AppColors.light_grey, width: 0.0),
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                        child: SvgPicture.asset(
                          rightIcon,
                          width: 24.w,
                          height: 24.h,
                        ),
                      )),
              if (!islogo)
                Lable(
                  lable ?? '',
                  Theme.of(context).textTheme.titleLarge!.merge(
                        TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: AppColors.black),
                      ),
                  vertical: 5.0,
                  horizantal: 20.0,
                ),
            ],
          ),
          if (islogo)
            Image.asset(
              'assets/images/logo.png',
            ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            leftIcon == ''
                ? const SizedBox()
                : isIconOnly
                    ? Container(
                        padding: EdgeInsets.all(padding.sp),
                        margin: EdgeInsets.symmetric(horizontal: 10.0.h),
                        child: SvgPicture.asset(
                          leftIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                      )
                    : InkWell(
                        onTap: onPressedLeft,
                        child: Container(
                            padding: EdgeInsets.all(padding.sp),
                            margin: EdgeInsets.symmetric(horizontal: 10.0.h),
                            width: 44.0.w,
                            height: 44.0.h,
                            decoration: BoxDecoration(
                              color: container_color,
                              border: isBorder
                                  ? Border.all(
                                      color: AppColors.light_grey, width: 1.0)
                                  : Border.all(
                                      color: AppColors.light_grey, width: 0.0),
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(16.sp),
                            ),
                            child: SvgPicture.asset(
                              leftIcon,
                              width: 24.w,
                              height: 24.h,
                            )),
                      ),
          ]),
        ],
      ),
    );
  }
}
