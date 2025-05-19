import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    required this.isEnabled,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final bool isEnabled;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnabled) {
          onTap?.call();
        }
      },
      child: Opacity(
        opacity: isEnabled ? 1 : 0.5,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.5,
                  color: AppColors.black15,
                ),
              ),
              child: icon,
            ),
            const SizedBox(height: 1),
            Text(
              label,
              textAlign: TextAlign.start,
              textScaler: TextScaler.noScaling,
              style: context.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
