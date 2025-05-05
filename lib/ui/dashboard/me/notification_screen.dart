// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class NotificationScreen extends HookWidget {
  const NotificationScreen({super.key});

  static const String id = 'notificationScreen';

  @override
  Widget build(BuildContext context) {
    final showSecondScreen = useState(true);
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
                    child: InkWell(
                      onTap: () {
                        showSecondScreen.value = !showSecondScreen.value;
                      },
                      child: Text(
                        context.appLocale.notifications,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 23.h),
            if (!showSecondScreen.value) ...[
              SizedBox(height: 85.h),
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.blueE7,
                  child: AppAssets.images.svgs.notification.svg(),
                ),
              ),
              SizedBox(height: 32.h),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(
                        context.appLocale.itsQuietInHere,
                        style: context.textTheme.titleLarge,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        context.appLocale.keepPracticing,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              _NotificationItem(
                iconPath: AppAssets.images.svgs.heartAdd.path,
                title: 'Game Invite',
                time: '2hr ago',
                message:
                    'You have been invited to join a game. Go to the  game set up to join your friends. Have fun',
              ),
              _NotificationItem(
                iconPath: AppAssets.images.svgs.infoCircle.path,
                title: 'System update',
                time: '2hr ago',
                message:
                    'We would be running a system update of the application by 12am midnight on 16 February, 2025',
              ),
              _NotificationItem(
                iconPath: AppAssets.images.svgs.heartAdd.path,
                title: 'Game Invite',
                time: '2hr ago',
                message:
                    'You have been invited to join a game. Go to the  game set up to join your friends. Have fun',
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.iconPath,
    required this.title,
    required this.time,
    required this.message,
  });

  final String iconPath;
  final String title;
  final String time;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          titleAlignment: ListTileTitleAlignment.top,
          leading: CircleAvatar(
            radius: 16.sp,
            backgroundColor: AppColors.blueE6,
            child: SvgPicture.asset(
              iconPath,
            ),
          ),
          title: Text(
            title,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            message,
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          trailing: Text(
            time,
            style: context.textTheme.bodySmall!.copyWith(
              fontFamily: FontFamily.kanit,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 13.h),
      ],
    );
  }
}
