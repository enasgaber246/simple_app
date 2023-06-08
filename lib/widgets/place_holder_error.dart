import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_base_project/utils/app_colors.dart';
import 'package:simple_base_project/widgets/lable.dart';
import 'package:simple_base_project/widgets/square_image.dart';

class PlaceHolderError extends StatelessWidget {
  const PlaceHolderError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.0.sp),
        child: Column(
          children: [
            SquareImage(
              'assets/images/no-connection.png',
              height: 112.h,
              radius: 0.0,
              margin: 0,
              fit: BoxFit.contain,
              color: AppColors.light_purple,
            ),
            Center(
              child: Lable(
                'network_error_message'.tr,
                Theme.of(context).textTheme.titleMedium!.merge(TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColors.secondary,
                      height: 1.75,
                    )),
                textAlign: TextAlign.center,
                alignment: Alignment.center,
                horizantal: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
