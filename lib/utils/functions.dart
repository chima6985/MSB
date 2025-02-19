import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

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
}
