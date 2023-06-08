import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_base_project/features/offers/offers_screen.dart';
import 'package:simple_base_project/utils/app_strings.dart';
import 'package:simple_base_project/utils/localization/trans.dart';

import 'config/themes/app_theme.dart';

class SimpleApp extends StatelessWidget {
  Locale? locale;

  SimpleApp({super.key, this.locale});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              title: AppStrings.appName,
              debugShowCheckedModeBanner: false,
              translations: trans(),
              locale: locale,
              theme: appTheme(),
              home: OffersScreen(
                onMenuTap: () {},
                onNotificationTap: () {},
              ));
        });
  }
}
