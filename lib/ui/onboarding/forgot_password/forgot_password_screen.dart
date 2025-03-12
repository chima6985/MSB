import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/auth/auth.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  static const String id = 'forgotPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: const _ForgotPasswordScreen(),
    );
  }
}

class _ForgotPasswordScreen extends HookWidget {
  const _ForgotPasswordScreen();

  @override
  Widget build(BuildContext context) {
    final emailAddressController = useTextEditingController(
      text: AppStorage.getEmail(),
    );
    final isLoading = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    final currentLocale = context.currentLocale;
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: () {
            isLoading.value = false;
            ToastMessage.showSuccess(
              context: context,
              text: anOtpSentToEmailYr,
            );
            context.pushNamed(
              ForgotPasswordOtpScreen.id,
              extra: {'email': emailAddressController.text.trim()},
            );
          },
          error: (error) {
            isLoading.value = false;
            ToastMessage.showError(
              context: context,
              text: error ?? '',
            );
          },
          orElse: () => isLoading.value = false,
        );
      },
      child: Scaffold(
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
                    context.appLocale.resetPassword,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.appLocale.enterEmailAddressToReceiveOtp,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 40),
                  AbsorbPointer(
                    absorbing: isLoading.value,
                    child: Column(
                      children: [
                        Form(
                          key: formKey.value,
                          child: CustomTextField(
                            textEditingController: emailAddressController,
                            textFieldText: context.appLocale.emailAddress,
                            textFieldSubText: currentLocale == yo
                                ? context.enLocale.emailAddress
                                : context.yoLocale.emailAddress,
                            validator: FormValidation.validateEmailAddress,
                          ),
                        ),
                        const SizedBox(height: 17),
                        Button(
                          label: context.appLocale.confirm,
                          isLoading: isLoading.value,
                          onPressed: () {
                            if (formKey.value.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context
                                  .read<ForgetPasswordCubit>()
                                  .forgetPassword(
                                    email: emailAddressController.text
                                        .toLowerCase()
                                        .trim(),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Button(
                    label: context.appLocale.back,
                    isOutlined: true,
                    labelColor: AppColors.black15,
                    onPressed: () {
                      context.pop(context);
                    },
                  ),
                  SizedBox(height: context.btmPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
