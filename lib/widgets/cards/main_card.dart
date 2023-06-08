import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_base_project/networking/models/home_response.dart';
import 'package:simple_base_project/widgets/btn.dart';
import 'package:simple_base_project/widgets/lable.dart';
import 'package:simple_base_project/widgets/square_icon.dart';

import '../../utils/app_colors.dart';

class MainCard extends StatefulWidget {
  final ProductModel data;

  const MainCard({super.key, required this.data});

  @override
  State<StatefulWidget> createState() {
    return MainCardState(data);
  }
}

class MainCardState extends State<MainCard> {
  final ProductModel data;

  MainCardState(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154.w,
      margin: EdgeInsets.all(5.0.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(22.0.sp)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 3,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22.0.sp),
                        topLeft: Radius.circular(22.0.sp)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(
                        //     Colors.black.withOpacity(0.4), BlendMode.dstATop),
                        image: NetworkImage(data.mainImage ?? '')),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Btn(
                      '10%'.tr,
                      height: 27.h,
                      width: 45.w,
                      isgradient: false,
                      horizontal: 5,
                      isBorder: false,
                      fontweight: FontWeight.normal,
                      fontSize: 12,
                      color: AppColors.red,
                      borderRadius: 18.0,
                    ),
                    SquareIcon(
                      'assets/images/heart.svg',
                      width: 30.0,
                      height: 30.0,
                      container_color: AppColors.white,
                      borderRadius: 10.0,
                      margin: 5,
                    ),
                  ],
                )
              ])),
          SizedBox(height: 5.h),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lable(
                    data.name ?? '',
                    Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .merge(TextStyle(fontSize: 12.sp)),
                    vertical: 0.0.sp,
                    horizantal: 5.0.sp,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: AppColors.yellow,
                        ),
                      ),
                      Lable(
                        '(4.8)',
                        Theme.of(context).textTheme.titleLarge!.merge(TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.normal)),
                        vertical: 0.0.sp,
                        horizantal: 0.0.sp,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: '120',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: 'D.K'.tr,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lable(
                            '100',
                            Theme.of(context).textTheme.titleLarge!.merge(
                                TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.normal)),
                            vertical: 0.0.sp,
                            horizantal: 5.0.sp,
                          ),
                          Lable(
                            'D.K'.tr,
                            Theme.of(context).textTheme.titleLarge!.merge(
                                TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.red,
                                    fontWeight: FontWeight.normal)),
                            vertical: 0.0.sp,
                            horizantal: 5.0.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SquareIcon(
                      'assets/images/bag.svg',
                      width: 30.0,
                      height: 30.0,
                      isgradient: true,
                      borderRadius: 12,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
