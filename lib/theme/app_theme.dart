import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masoyinbo_mobile/theme/theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    textTheme: textTheme,
    primaryColor: AppColors.blue12,
    fontFamily: 'Kanit',
    highlightColor: AppColors.black15,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    // dialogTheme: _dialogTheme,
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(AppColors.white),
      fillColor: WidgetStateProperty.all(AppColors.black15.withOpacity(0.3)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      splashRadius: 5,
      side: const BorderSide(
        width: 0.9,
        color: AppColors.black15,
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: AppColors.secondaryColor,
      todayBackgroundColor:
          WidgetStatePropertyAll(AppColors.secondaryColor.withOpacity(0.1)),
      todayForegroundColor:
          const WidgetStatePropertyAll(AppColors.secondaryColor),
      dayBackgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.secondaryColor;
          }
          return AppColors.white;
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.blue12),
      splashRadius: 5,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.black,
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black15,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black15,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.blackColor,
    // ),
    useMaterial3: false,
  );

  static TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 36.sp,
      color: AppColors.black15,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      fontSize: 29.sp,
      color: AppColors.black15,
      fontWeight: FontWeight.w500,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.sp,
      color: AppColors.black15,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 20.sp,
      color: AppColors.black15,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black15,
      // height: 1.25,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black15,
      // height: 1.25,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black15,
      // height: 1.25,
    ),
    titleMedium: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black15,
    ),
    titleSmall: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.black15,
    ),
  );

  // static const DialogTheme _dialogTheme = DialogTheme(
  //   backgroundColor: AppColors.whiteColor,
  // );
}
