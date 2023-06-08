import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:simple_base_project/utils/app_colors.dart';

class ProgressLoading extends StatelessWidget {
  const ProgressLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56.h,
          child: const LoadingIndicator(
              indicatorType: Indicator.ballScaleMultiple,
              colors: [
                AppColors.secondary,
                AppColors.primary,
                AppColors.secondary
              ],
              strokeWidth: 2),
        ),
        // loadingView(),
      ],
    );
  }

  Widget loadingView() {
    if (Platform.isIOS) {
      return Container(
        padding: const EdgeInsets.all(12),
        child: const CupertinoActivityIndicator(
          animating: true,
          radius: 14,
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(12),
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
      );
    }
  }
}
