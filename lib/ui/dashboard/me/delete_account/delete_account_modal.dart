import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app_strings.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class EnterYourPasswordModal extends HookWidget {
  const EnterYourPasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final passwordController = useTextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
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
            enterYourPasswordEn,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              context.appLocale.toCompleteYourDeletionProcess,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 42),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: PasswordTextField(
              textEditingController: passwordController,
              textFieldText: context.appLocale.yoruba,
              textFieldSubText: context.appLocale.yoruba,
              isBottomSpacing: false,
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: AppColors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 10.5),
              backgroundColor: AppColors.redFF,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {
              context.pop();
              showModalBottomSheet(
                context: context,
                isDismissible: false,
                enableDrag: false,
                builder: (context) => const AccountDeletedModal(),
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              );
            },
            child: IntrinsicWidth(
              child: SizedBox(
                width: mqr.width * 0.8,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FittedBox(
                      child: Text(
                        deleteMyAccountEn,
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: context.btmPadding),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}

class AccountDeletedModal extends StatelessWidget {
  const AccountDeletedModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 35),
          Text(
            deleteMyAccountEn,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              thankYouForUsingOurProductEn,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 35),
          Button(
            label: context.appLocale.closeTheApp,
            onPressed: () => context.goNamed(SplashScreen.id),
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}
