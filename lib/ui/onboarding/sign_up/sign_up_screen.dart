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
    final currentLocale = context.currentLocale;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticating: (user) => isLoading.value = true,
          authenticated: (user) {
            isLoading.value = false;
            ToastMessage.showSuccess(
              context: context,
              text: anOtpSentToEmailYr,
            );
            context.pushNamed(
              ConfirmEmailScreen.id,
              extra: {
                'email': emailAddressController.text.toLowerCase().trim(),
              },
            );
          },
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
                    context.appLocale.createAccount,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentLocale == yo
                        ? context.enLocale.createAccount
                        : context.yoLocale.createAccount,
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
                          textFieldText: context.appLocale.emailAddress,
                          textFieldSubText: currentLocale == yo
                              ? context.enLocale.emailAddress
                              : context.yoLocale.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return context.appLocale.fieldIsRequired;
                            }
                            if (!EmailValidator.validate(val)) {
                              return context.appLocale.invalidEmail;
                            }
                            return null;
                          },
                        ),
                        PasswordTextField(
                          textEditingController: passwordController,
                          textFieldText: context.appLocale.password,
                          textFieldSubText: currentLocale == yo
                              ? context.enLocale.password
                              : context.yoLocale.password,
                          validator: FormValidation.validatePassword,
                        ),
                        PasswordTextField(
                          textEditingController: confirmPasswordController,
                          textFieldText: context.appLocale.confirmPassword,
                          textFieldSubText: currentLocale == yo
                              ? context.enLocale.confirmPasswordLw
                              : context.yoLocale.confirmPasswordLw,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return context.appLocale.fieldIsRequired;
                            }
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return context.appLocale.passwordMismatch;
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
                              TextSpan(text: context.appLocale.bySigningUp),
                              TextSpan(
                                text:
                                    ' ${context.appLocale.termsAndConditions}',
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
                      label: context.appLocale.continueTx,
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
                          TextSpan(text: context.appLocale.alreadyAUser),
                          TextSpan(
                            text: ' ${context.appLocale.logIn}',
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
                          context.appLocale.or,
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
                    label: context.appLocale.logIn,
                    isOutlined: true,
                    onPressed: () {},
                    child: Row(
                      children: [
                        AppAssets.images.svgs.google.svg(),
                        const SizedBox(width: 8),
                        Text(
                          context.appLocale.signUpWithGoogle,
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
