import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app_strings.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Iconsax.close_circle),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            context.appLocale.logout,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              areYouSureYouWantToContinueEn,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 35),
          Button(
            label: context.appLocale.continueTx,
            onPressed: () {
              AppStorage.clear();
              context.goNamed(SplashScreen.id);
            },
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}
