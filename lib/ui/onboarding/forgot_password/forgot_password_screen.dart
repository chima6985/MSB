import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ForgotPasswordScreen extends HookWidget {
  const ForgotPasswordScreen({super.key});
  static const String id = 'forgotPasswordScreen';

  @override
  Widget build(BuildContext context) {
    final emailAddressController = useTextEditingController(
      text: AppStorage.getEmail(),
    );
    final currentLocale = context.currentLocale;
    final yo = context.yoLocale;
    final en = context.enLocale;
    return Scaffold(
      body: DecoratedContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.topPadding),
                Hero(
                  tag: 'masoyinbo_logo',
                  child: AppAssets.images.jpegs.masoyinboLogo.image(
                    width: 70.w,
                    height: 70.w,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  currentLocale == 'yr' ? yo.resetPassword : en.resetPassword,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontFamily: FontFamily.margarine,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  currentLocale == 'yr'
                      ? en.enterEmailAddressToReceiveOtp
                      : yo.enterEmailAddressToReceiveOtp,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.4,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  textEditingController: emailAddressController,
                  textFieldText:
                      currentLocale == 'yr' ? yo.emailAddress : en.emailAddress,
                  textFieldSubText:
                      currentLocale == 'yr' ? en.emailAddress : yo.emailAddress,
                ),
                const SizedBox(height: 17),
                Button(
                  label: currentLocale == 'yr' ? yo.confirm : en.confirm,
                  onPressed: () =>
                      context.pushNamed(ForgotPasswordOtpScreen.id),
                ),
                const SizedBox(height: 24),
                Button(
                  label: currentLocale == 'yr' ? yo.back : en.back,
                  isOutlined: true,
                  labelColor: AppColors.black15,
                  onPressed: () => context.pop(context),
                ),
                SizedBox(height: context.btmPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
