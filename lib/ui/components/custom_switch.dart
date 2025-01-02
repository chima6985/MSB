import 'package:flutter/cupertino.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.onTap,
    required this.isEnabled,
  });

  // ignore: avoid_positional_boolean_parameters
  final void Function(bool)? onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.75,
      child: CupertinoSwitch(
        onChanged: onTap,
        value: isEnabled,
        inactiveTrackColor: isEnabled ? AppColors.blue12 : AppColors.greyDB,
        activeTrackColor: AppColors.blue12,
        thumbColor: AppColors.greyB6,
      ),
    );
  }
}
