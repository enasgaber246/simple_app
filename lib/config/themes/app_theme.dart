import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      hintColor: AppColors.secondary,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.main_back_color,
      fontFamily: AppStrings.fontFamily,
      textTheme: const TextTheme(
        labelLarge:TextStyle(
            fontSize: 22, color: AppColors.white, fontWeight: FontWeight.w900),
        labelMedium: TextStyle(
            fontSize: 20, color: AppColors.black, fontWeight: FontWeight.w500),
        labelSmall:  TextStyle(
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w400),
        titleMedium: TextStyle(
            fontSize: 18,
            color: AppColors.secondary,
            fontWeight: FontWeight.w500),
        titleLarge:  TextStyle(
            fontSize: 22, color: AppColors.black, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(
            fontSize: 14,
            color: AppColors.secondary,
            fontWeight: FontWeight.w400),
      ));
}
