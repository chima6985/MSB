// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/components/notification_item.dart';
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
            SizedBox(
              height: 32.h,
            ),
            if (!showSecondScreen.value) ...[
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: AppColors.blueE6,
                  child: AppAssets.images.svgs.notification.svg(),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      Text(
                        context.appLocale.itsQuietInHere,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.kanit,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        context.appLocale.keeppracticing,
                        style: context.textTheme.titleMedium!.copyWith(
                          fontFamily: FontFamily.kanit,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            if (showSecondScreen.value) ...[
              NotificationItem(
                icon: AppAssets.images.svgs.heartAdd.svg(),
                title: 'Game Invite',
                time: '2hr ago',
                message:
                    'You have been invited to join a game. Go to the  game set up to join your friends. Have fun',
              ),
              NotificationItem(
                icon: AppAssets.images.svgs.infoCircle.svg(),
                title: 'System update',
                time: '2hr ago',
                message:
                    'We would be running a system update of the application by 12am midnight on 16 February, 2025',
              ),
              NotificationItem(
                icon: AppAssets.images.svgs.heartAdd.svg(),
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
