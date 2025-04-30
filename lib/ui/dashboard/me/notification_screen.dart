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
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            SizedBox(height: 162.h),
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
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.blueE6,
                              child: AppAssets.images.svgs.heartAdd.svg(),
                            ),
                          ),
                          SizedBox(
                            width: 16.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.appLocale.gameInvite,
                                style: context.textTheme.titleLarge!,
                              ),
                              Text(
                                context.appLocale.practiceInvite,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
