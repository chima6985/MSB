import 'package:flutter/material.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get currentTheme => Theme.of(this);
  bool get isDarkMode => currentTheme.brightness == Brightness.dark;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
