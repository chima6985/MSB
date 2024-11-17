import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ForgotPasswordOtpScreen extends HookWidget {
  const ForgotPasswordOtpScreen({super.key});
  static const String id = 'forgotPasswordOtpScreen';

  @override
  Widget build(BuildContext context) {
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
                  confirmYourOtpYr,
                  textScaler: TextScaler.noScaling,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontFamily: FontFamily.margarine,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      const TextSpan(text: enterTheOtpYr),
                      TextSpan(
                        text: ' oladimejiu@gmail.com ',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const TextSpan(text: toResetYourPasswordYr),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const CustomPinField(),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColors.blue12,
                      ),
                      children: [
                        const TextSpan(text: 'Tun kóòdù rán '),
                        TextSpan(
                          text: ' 00:59',
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 49),
                Button(
                  label: confirmYr,
                  onPressed: () => context.pushNamed(ChangePasswordScreen.id),
                ),
                const SizedBox(height: 24),
                Button(
                  label: backYr,
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
