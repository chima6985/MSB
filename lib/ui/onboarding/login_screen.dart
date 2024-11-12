import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});
  static const String id = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    final emailAddressController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      body: DecoratedContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.topPadding,
              ),
              Hero(
                tag: 'masoyinbo_logo',
                child: AppAssets.images.jpegs.masoyinboLogo.image(
                  width: 70.w,
                  height: 70.w,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                enterDetailsYr,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.titleLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                enterDetailsEn,
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
                textFieldText: emailAddressYr,
                textFieldSubText: emailAddressEn,
              ),
              PasswordTextField(
                textEditingController: passwordController,
                textFieldText: passwordYr,
                textFieldSubText: passwordEn,
                isBottomSpacing: false,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // context.pushNamed(ResetPassword.id);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.blue12,
                  ),
                  child: Text(
                    forgotPasswordEn,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 17),
              Button(
                label: logInYr,
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      const TextSpan(text: dontHaveAnAccount),
                      TextSpan(
                        text: ' $signUp',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.replaceNamed(SignUpScreen.id),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.blackB6,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Text(
                      'OR',
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.blackB6,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Button(
                label: logInYr,
                isOutlined: true,
                onPressed: () {},
                child: Row(
                  children: [
                    AppAssets.images.svgs.google.svg(),
                    const SizedBox(width: 8),
                    Text(
                      signUpWithGoogleYr,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
