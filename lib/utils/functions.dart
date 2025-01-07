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
}
