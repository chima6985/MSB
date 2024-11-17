import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get topPadding => MediaQuery.of(this).viewPadding.top + 5.h;
  double get btmPadding => MediaQuery.of(this).viewPadding.bottom + 5.h;
}
