import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({
    super.key,
  });
  static const String id = 'settingsScreen';

  @override
  Widget build(BuildContext context) {
    final isSoundEnabled = useState(false);
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
                        settingsEn,
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
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    generalEn,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 5),
                child: Column(
                  children: [
                    _SettingsWidget(
                      title: accountYr,
                      iconData: Iconsax.user,
                      onTap: () => context.pushNamed(AccountScreen.id),
                    ),
                    _SettingsWidget(
                      title: notificationsYr,
                      iconData: Iconsax.notification,
                      onTap: () => context.pushNamed(NotificationsScreen.id),
                    ),
                    _SettingsWidget(
                      title: paymentPlanYr,
                      iconData: Iconsax.moneys,
                      onTap: () => context.pushNamed(PaymentScreen.id),
                    ),
                    _SettingsWidget(
                      title: languageYr,
                      iconData: Iconsax.global,
                      onTap: () => context.pushNamed(LanguageScreen.id),
                    ),
                    _SettingsWidget(
                      title: soundEffectYr,
                      iconData: Iconsax.volume_high,
                      trailingIcon: ValueListenableBuilder(
                        valueListenable: isSoundEnabled,
                        builder: (context, val, child) {
                          return CustomSwitch(
                            onTap: (p0) =>
                                isSoundEnabled.value = !isSoundEnabled.value,
                            isEnabled: isSoundEnabled.value == true,
                          );
                        },
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    othersEn,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 5),
                child: Column(
                  children: [
                    _SettingsWidget(
                      title: helpYr,
                      iconData: Iconsax.support,
                      onTap: () => context.pushNamed(HelpScreen.id),
                    ),
                    _SettingsWidget(
                      title: logoutYr,
                      iconData: Iconsax.logout,
                      onTap: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => const LogoutModal(),
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    _SettingsWidget(
                      title: deleteAccountYr,
                      iconData: Iconsax.trash,
                      foregroundColor: AppColors.redFF,
                      onTap: () => context.pushNamed(DeleteAccountScreen.id),
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

class _SettingsWidget extends StatelessWidget {
  const _SettingsWidget({
    required this.title,
    required this.iconData,
    required this.onTap,
    this.foregroundColor = AppColors.black15,
    this.trailingIcon,
  });

  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  final Color foregroundColor;
  final Widget? trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            iconData,
            color: foregroundColor,
          ),
          minLeadingWidth: 12,
          title: Text(
            title,
            style: context.textTheme.bodyMedium!.copyWith(
              color: foregroundColor,
            ),
          ),
          trailing: trailingIcon ??
              Icon(
                Iconsax.arrow_right_3,
                color: foregroundColor,
              ),
          onTap: onTap,
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
