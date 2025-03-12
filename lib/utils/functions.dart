import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class Functions {
  static void autoScroll({
    required ScrollController controller,
    required double position,
  }) {
    controller.animateTo(
      position,
      duration: 300.ms,
      curve: Curves.linear,
    );
  }

  static void showModalAuth(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const AuthModal(),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );
  }

  static List<String> greetingMessage(BuildContext context) {
    final currentLocale = context.currentLocale;
    final now = DateTime.now().hour;

    if (now < 12) {
      return [
        context.appLocale.goodMorning,
        if (currentLocale == yo)
          context.enLocale.goodMorning
        else
          context.yoLocale.goodMorning,
      ];
    } else if (now < 17) {
      return [
        context.appLocale.goodAfternoon,
        if (currentLocale == yo)
          context.enLocale.goodAfternoon
        else
          context.yoLocale.goodAfternoon,
      ];
    } else {
      return [
        context.appLocale.goodEvening,
        if (currentLocale == yo)
          context.enLocale.goodEvening
        else
          context.yoLocale.goodEvening,
      ];
    }
  }
}
