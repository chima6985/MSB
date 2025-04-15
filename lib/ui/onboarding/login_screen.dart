import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});
  static const String id = 'loginScreen';

  @override
  Widget build(BuildContext context) {
    final emailAddressController = useTextEditingController(
      text: AppStorage.getEmail(),
    );
    final currentLocale = context.currentLocale;
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          authenticating: (user) => isLoading.value = true,
          authenticated: (user) {
            isLoading.value = false;
            context.read<UserCubit>().init();
            if (!user.isCompleted) {
              context.goNamed(
                PersonalizeSignUpScreen.id,
                extra: {'email': emailAddressController.text.trim()},
              );
            } else if (!user.isSurveyCompleted) {
              context.goNamed(SurveyScreen.id);
            } else {
              context.goNamed(DashboardIndexScreen.id);
            }
          },
          loginError: (user, error) {
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
                  SizedBox(height: context.topPadding),
                  Hero(
                    tag: 'masoyinbo_logo',
                    child: AppAssets.images.jpegs.masoyinboLogo.image(
                      width: 70.w,
                      height: 70.w,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      if (kDebugMode) {
                        emailAddressController.text =
                            'Daudu.victor173+29@gmail.com';
                        passwordController.text = 'Daudu123.';
                      }
                    },
                    child: Text(
                      context.appLocale.enterDetails,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                        height: 1.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentLocale == yo
                        ? context.enLocale.enterDetails
                        : context.yoLocale.enterDetails,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 40),
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
                          validator: (value) =>
                              FormValidation.validateFieldNotEmpty(
                            value,
                            context.appLocale.password,
                          ),
                          isBottomSpacing: false,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          context.pushNamed(ForgotPasswordScreen.id),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.blue12,
                      ),
                      child: Text(
                        context.appLocale.forgotPassword,
                        textScaler: TextScaler.noScaling,
                        style: context.textTheme.bodySmall!.copyWith(
                          fontSize: 13.5.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  Button(
                    label: context.appLocale.logIn,
                    isLoading: isLoading.value,
                    onPressed: () {
                      if (formKey.value.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<AuthBloc>().add(
                              AuthEvent.authSignIn(
                                email: emailAddressController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(text: context.appLocale.dontHaveAnAccount),
                          TextSpan(
                            text: ' ${context.appLocale.signUp}',
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => context.replaceNamed(SignUpScreen.id),
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
                  const SizedBox(height: 24),
                  Button(
                    label: '',
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
