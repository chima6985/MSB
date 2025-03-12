import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_yo.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

extension AppExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get topPadding => MediaQuery.of(this).viewPadding.top + 5.h;
  double get btmPadding => MediaQuery.of(this).viewPadding.bottom + 5.h;
  AppLocalizations get appLocale =>
      AppLocalizations.of(this) ?? AppLocalizationsEn();
  AppLocalizations get enLocale => AppLocalizationsEn();
  AppLocalizations get yoLocale => AppLocalizationsYo();
  String get currentLocale => Localizations.localeOf(this).languageCode;
  bool get isTablet => MediaQuery.of(this).size.shortestSide > 550;
}
