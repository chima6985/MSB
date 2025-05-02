// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
              Padding(
                padding: EdgeInsets.only(left: 24.h, right: 24.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.blueE6,
                          child: AppAssets.images.svgs.heartAdd.svg(),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            Text(
                              context.appLocale.gameInvite,
                              style: context.textTheme.titleLarge,
                            ),
                          ],
                        ),
                        const Spacer(
                          flex: 8,
                        ),
                        Text(
                          '2hr ago',
                          style: context.textTheme.titleMedium!
                              .copyWith(fontFamily: FontFamily.kanit),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 48.h),
                      child: Text(
                        context.appLocale.practiceInvite,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
