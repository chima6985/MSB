import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({
    super.key,
  });
  static const String id = 'notificationsScreen';

  @override
  Widget build(BuildContext context) {
    final isRemindersEnabled = useState(false);
    final isStreakRemindersEnabled = useState(true);
    final isInAppNotificationEnabled = useState(false);
    final isEmailNotificaionEnabled = useState(true);
    final isSmsNotification = useState(true);
    return Scaffold(
      body: DecoratedContainer(
        child: SingleChildScrollView(
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
                         context.appLocale.notifications,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          remindersEn,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodySmall,
                        ),
                        ValueListenableBuilder(
                          valueListenable: isRemindersEnabled,
                          builder: (context, val, child) {
                            return CustomSwitch(
                              onTap: (p0) => isRemindersEnabled.value =
                                  !isRemindersEnabled.value,
                              isEnabled: isRemindersEnabled.value == true,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          streakRemindersEn,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodySmall,
                        ),
                        ValueListenableBuilder(
                          valueListenable: isStreakRemindersEnabled,
                          builder: (context, val, child) {
                            return CustomSwitch(
                              onTap: (p0) => isStreakRemindersEnabled.value =
                                  !isStreakRemindersEnabled.value,
                              isEnabled: isStreakRemindersEnabled.value == true,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          inAppNotificationEn,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodySmall,
                        ),
                        ValueListenableBuilder(
                          valueListenable: isInAppNotificationEnabled,
                          builder: (context, val, child) {
                            return CustomSwitch(
                              onTap: (p0) => isInAppNotificationEnabled.value =
                                  !isInAppNotificationEnabled.value,
                              isEnabled:
                                  isInAppNotificationEnabled.value == true,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          emailNotificationEn,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodySmall,
                        ),
                        ValueListenableBuilder(
                          valueListenable: isEmailNotificaionEnabled,
                          builder: (context, val, child) {
                            return CustomSwitch(
                              onTap: (p0) => isEmailNotificaionEnabled.value =
                                  !isEmailNotificaionEnabled.value,
                              isEnabled:
                                  isEmailNotificaionEnabled.value == true,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          smsNotificationEn,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodySmall,
                        ),
                        ValueListenableBuilder(
                          valueListenable: isSmsNotification,
                          builder: (context, val, child) {
                            return CustomSwitch(
                              onTap: (p0) => isSmsNotification.value =
                                  !isSmsNotification.value,
                              isEnabled: isSmsNotification.value == true,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(height: context.btmPadding),
            ],
          ),
        ),
      ),
    );
  }
}
