import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({super.key});
  static const String id = 'signUpScreen';

  @override
  Widget build(BuildContext context) {
    final emailAddressController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    final isAgreement = useState(false);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticating: (user) => isLoading.value = true,
          authenticated: (user) => context.pushNamed(ConfirmEmailScreen.id),
          signUpError: (user, error) {
            isLoading.value = false;
            ToastMessage.showError(
              context: context,
              text: error ?? '',
            );
          },
          orElse: () => isLoading.value = false,
        );
      },
      child: AbsorbPointer(
        absorbing: isLoading.value,
        child: DecoratedContainer(
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
                  Form(
                    key: formKey.value,
                    child: Column(
                      children: [
                        CustomTextField(
                          textEditingController: emailAddressController,
                          textFieldText: emailAddressYr,
                          textFieldSubText: emailAddressEn,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return fieldIsRequiredYr;
                            }
                            if (!EmailValidator.validate(val)) {
                              return invalidEmailYr;
                            }
                            return null;
                          },
                        ),
                        PasswordTextField(
                          textEditingController: passwordController,
                          textFieldText: passwordYr,
                          textFieldSubText: passwordEn,
                          validator: FormValidation.validatePassword,
                        ),
                        PasswordTextField(
                          textEditingController: confirmPasswordController,
                          textFieldText: passwordYr,
                          textFieldSubText: confirmPasswordEn,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return fieldIsRequiredYr;
                            }
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return 'Password mismatch';
                            }
                            return null;
                          },
                          isBottomSpacing: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: Checkbox(
                          value: isAgreement.value,
                          fillColor: !isAgreement.value
                              ? WidgetStateProperty.all(
                                  AppColors.black15.withValues(alpha: 0.1),
                                )
                              : WidgetStateProperty.all(AppColors.blue12),
                          onChanged: (value) =>
                              isAgreement.value = !isAgreement.value,
                        ),
                      ),
                      SizedBox(width: 3.w),
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
                  Opacity(
                    opacity: isAgreement.value ? 1 : 0.6,
                    child: Button(
                      label: moveForwardYr,
                      isLoading: isLoading.value,
                      onPressed: () {
                        if (isAgreement.value &&
                            formKey.value.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.read<AuthBloc>().add(
                                AuthEvent.authSignUp(
                                  email: emailAddressController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                    ),
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
                              ..onTap =
                                  () => context.replaceNamed(LoginScreen.id),
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
                  SizedBox(
                    height: context.btmPadding +
                        MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
