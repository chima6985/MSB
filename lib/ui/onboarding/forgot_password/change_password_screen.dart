import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  static const String id = 'changePasswordScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: _ChangePasswordScreen(email: email),
    );
  }
}

class _ChangePasswordScreen extends HookWidget {
  const _ChangePasswordScreen({
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final newPasswordController = useTextEditingController();
    final confirmNewPasswordController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    final currentLocale = context.currentLocale;
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: () {
            isLoading.value = false;
            showModalBottomSheet(
              context: context,
              isDismissible: false,
              enableDrag: false,
              builder: (context) => const PasswordResetSuccessModal(),
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
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
      child: AbsorbPointer(
        absorbing: isLoading.value,
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
                      context.appLocale.createANewPassword,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.appLocale.createANewPasswordForYourAccount,
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
                          PasswordTextField(
                            textEditingController: newPasswordController,
                            textFieldText: context.appLocale.password,
                            textFieldSubText: currentLocale == yo
                                ? context.enLocale.password
                                : context.yoLocale.password,
                            validator: FormValidation.validatePassword,
                          ),
                          PasswordTextField(
                            textEditingController: confirmNewPasswordController,
                            textFieldText: context.appLocale.confirmPassword,
                            textFieldSubText: currentLocale == yo
                                ? context.enLocale.confirmPasswordLw
                                : context.yoLocale.confirmPasswordLw,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return context.appLocale.fieldIsRequired;
                              }
                              if (newPasswordController.text !=
                                  confirmNewPasswordController.text) {
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
                    Button(
                      label: context.appLocale.resetPassword_,
                      isLoading: isLoading.value,
                      onPressed: () {
                        if (formKey.value.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          context.read<ResetPasswordCubit>().resetPassword(
                                email: email,
                                password: newPasswordController.text.trim(),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    Button(
                      label: context.appLocale.back,
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
        ),
      ),
    );
  }
}
