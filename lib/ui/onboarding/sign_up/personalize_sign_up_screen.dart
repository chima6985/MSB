import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class PersonalizeSignUpScreen extends HookWidget {
  const PersonalizeSignUpScreen({super.key});
  static const String id = 'personalizeSignUpScreen';

  @override
  Widget build(BuildContext context) {
    final genderController = useTextEditingController();
    final usernameController = useTextEditingController();
    return Scaffold(
      body: DecoratedContainer(
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
                const SizedBox(height: 24),
                Text(
                  createAccountYr,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontFamily: 'Margarine',
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  personalizeYourAccountFurther,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.4,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  textEditingController: genderController,
                  textFieldText: genderYr,
                  textFieldSubText: genderEn,
                ),
                CustomTextField(
                  textEditingController: usernameController,
                  textFieldText: usernameYr,
                  textFieldSubText: usernameEn,
                ),
                const SizedBox(height: 17),
                Button(
                  label: fipamoYr,
                  onPressed: () => context.goNamed(AllSetScreen.id),
                ),
                const SizedBox(height: 17),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
