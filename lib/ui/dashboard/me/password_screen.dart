import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class PasswordScreen extends HookWidget {
  const PasswordScreen({
    super.key,
  });
  static const String id = 'passwordScreen';

  @override
  Widget build(BuildContext context) {
    final newPasswordController = useTextEditingController();
    final reEnterNewPasswordController = useTextEditingController();
    final currentPasswordController = useTextEditingController();
    final mqr = MediaQuery.of(context).size;
    return DecoratedContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                const CustomBackButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Center(
                    child: Text(
                      passwordEn2,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  PasswordTextField(
                    textEditingController: currentPasswordController,
                    textFieldText: passwordYr,
                    textFieldSubText: currentPasswordEn,
                  ),
                  PasswordTextField(
                    textEditingController: newPasswordController,
                    textFieldText: passwordYr,
                    textFieldSubText: newPasswordEn,
                  ),
                  PasswordTextField(
                    textEditingController: reEnterNewPasswordController,
                    textFieldText: passwordYr,
                    textFieldSubText: reEnterNewPasswordEn,
                    isBottomSpacing: false,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
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
                  SizedBox(height: mqr.height * 0.2),
                  Button(
                    label: updatePasswordEn,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(
              height:
                  context.btmPadding + MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
