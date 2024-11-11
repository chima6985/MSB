import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class HelpScreen extends HookWidget {
  const HelpScreen({
    super.key,
  });
  static const String id = 'helpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedContainer(
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                const CustomBackButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Center(
                    child: Text(
                      helpYr,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Column(
                children: [
                  Text(
                    needHelpEn,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 13.sp,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  const _HelpWidget(
                    title: 'Call',
                    subtitle: 'Need to speak with us? Give us a call!',
                    iconData: Iconsax.call_outgoing5,
                  ),
                  const _HelpWidget(
                    title: 'Mail',
                    subtitle: 'Reach us via email with your concerns',
                    iconData: Iconsax.sms5,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class _HelpWidget extends StatelessWidget {
  const _HelpWidget({
    required this.title,
    required this.subtitle,
    required this.iconData,
  });

  final String title;
  final String subtitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.blueE7,
        child: Icon(
          iconData,
          color: AppColors.black15,
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.bodyMedium!.copyWith(),
      ),
      subtitle: Text(
        subtitle,
        style: context.textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ),
      trailing: const Icon(
        Iconsax.arrow_right_3,
        color: AppColors.black15,
      ),
    );
  }
}
