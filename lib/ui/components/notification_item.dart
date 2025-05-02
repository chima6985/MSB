import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.icon,
    required this.title,
    required this.time,
    required this.message,
    super.key,
  });
  final Widget icon;
  final String title;
  final String time;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.blueE6,
                child: icon,
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Text(
                  title,
                  style: context.textTheme.titleLarge,
                ),
              ),
              Text(
                time,
                style: context.textTheme.titleMedium!
                    .copyWith(fontFamily: FontFamily.kanit),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 48.h),
            child: Text(
              message,
              style: context.textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
