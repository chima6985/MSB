import 'package:flutter/material.dart';

extension AppExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
  double get btmPadding => MediaQuery.of(this).viewPadding.bottom;
}
