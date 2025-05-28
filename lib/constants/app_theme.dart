import 'package:ecom_print_store/constants/colors.dart';
import 'package:ecom_print_store/constants/font_family.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.productSans,
  brightness: Brightness.light,
  primaryColor: AppColors.orange[500],
  colorScheme: ColorScheme.fromSwatch(
          primarySwatch:
              MaterialColor(AppColors.orange[500]!.value, AppColors.orange))
      .copyWith(
    secondary: AppColors.orange[500],
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.productSans,
  brightness: Brightness.dark,
  primaryColor: AppColors.orange[500],
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.orange[500]),
);
