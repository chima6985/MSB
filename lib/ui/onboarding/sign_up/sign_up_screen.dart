import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});
  static const String id = 'signUpScreen';

  @override
  Widget build(BuildContext context) {
    final emailAddressController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isAgreement = useState(false);
    return DecoratedContainer(
      child: SingleChildScrollView(
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
              const SizedBox(height: 18),
              Text(
                createAccountYr,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.titleLarge!.copyWith(
                  fontFamily: FontFamily.margarine,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                createAccountEn,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 35),
              CustomTextField(
                textEditingController: emailAddressController,
                textFieldText: emailAddressYr,
                textFieldSubText: emailAddressEn,
              ),
              PasswordTextField(
                textEditingController: passwordController,
                textFieldText: passwordYr,
                textFieldSubText: passwordEn,
              ),
              PasswordTextField(
                textEditingController: confirmPasswordController,
                textFieldText: passwordYr,
                textFieldSubText: confirmPasswordEn,
                isBottomSpacing: false,
              ),
              const SizedBox(height: 17),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isAgreement.value,
                    fillColor: !isAgreement.value
                        ? WidgetStateProperty.all(
                            AppColors.black15.withValues(alpha: 0.1),
                          )
                        : WidgetStateProperty.all(AppColors.black15),
                    onChanged: (value) =>
                        isAgreement.value = !isAgreement.value,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          const TextSpan(text: bySigningUp),
                          TextSpan(
                            text: ' $termsAndConditions',
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Button(
                label: moveForwardYr,
                onPressed: () => context.goNamed(PersonalizeSignUpScreen.id),
              ),
              const SizedBox(height: 15),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      const TextSpan(text: alreadyAUserEn),
                      TextSpan(
                        text: ' $logInYr',
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.replaceNamed(LoginScreen.id),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
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
              const SizedBox(height: 22),
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
              SizedBox(height: context.btmPadding),
            ],
          ),
        ),
      ),
    );
  }
}
