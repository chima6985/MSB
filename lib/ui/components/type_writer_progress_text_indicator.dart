import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class TypeWriterProgressTextIndicator extends StatefulWidget {
  const TypeWriterProgressTextIndicator({
    super.key,
    this.fontWeight = FontWeight.w500,
    this.isItalic = false,
    this.color = AppColors.black15,
  });

  final FontWeight? fontWeight;
  final bool isItalic;
  final Color color;

  @override
  State<TypeWriterProgressTextIndicator> createState() =>
      _TypeWriterProgressTextIndicatorState();
}

class _TypeWriterProgressTextIndicatorState
    extends State<TypeWriterProgressTextIndicator>
    with TickerProviderStateMixin {
  late AnimationController controller;
  String indicatorText = '';

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    controller.addListener(() {
      final cv = controller.value;
      setState(() {
        if (cv > 0.65) {
          indicatorText = '...';
        } else if (cv > 0.45) {
          indicatorText = '..';
        } else if (cv > 0.25) {
          indicatorText = '.';
        } else {
          indicatorText = '';
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.2.sp),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Text(
            indicatorText,
            style: context.textTheme.bodyLarge!.copyWith(
              fontStyle: widget.isItalic ? FontStyle.italic : null,
              fontWeight: widget.fontWeight,
              color: widget.color,
              fontSize: 22.sp,
              height: 1,
            ),
          );
        },
      ),
    );
  }
}
