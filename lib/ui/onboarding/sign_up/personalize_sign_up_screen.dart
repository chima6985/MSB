import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class PersonalizeSignUpScreen extends StatelessWidget {
  const PersonalizeSignUpScreen({
    super.key,
    required this.email,
  });

  final String email;

  static const String id = 'personalizeSignUpScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteOnboardingCubit(),
      child: _PersonalizeSignUpScreen(email: email),
    );
  }
}

class _PersonalizeSignUpScreen extends HookWidget {
  const _PersonalizeSignUpScreen({
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final selectedGender = useState<String?>(null);
    final usernameController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    final currentLocale = context.currentLocale;

    final genderOptionsMap = {
      'Male': context.appLocale.male,
      'Female': context.appLocale.female,
    };

    final genderOptions = [
      context.appLocale.male,
      context.appLocale.female,
    ];

    return BlocListener<CompleteOnboardingCubit, CompleteOnboardingState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: () {
            isLoading.value = false;
            context.goNamed(AllSetScreen.id);
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
                  SizedBox(height: 24.h),
                  Text(
                    context.appLocale.createAccount,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.appLocale.personalizeYourAccountFurther,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Form(
                    key: formKey.value,
                    child: Column(
                      children: [
                        CustomDropDownField(
                          textFieldText: context.appLocale.gender,
                          textFieldSubText: currentLocale == yo
                              ? context.enLocale.gender
                              : context.yoLocale.gender,
                          hintText: context.appLocale.selectGender,
                          items: genderOptions
                              .map(
                                (gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(
                                    gender,
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (val) => selectedGender.value = val,
                          validator: (value) =>
                              FormValidation.validateFieldNotEmpty(
                            selectedGender.value,
                            'Gender',
                          ),
                        ),
                        CustomTextField(
                          textEditingController: usernameController,
                          textFieldText: context.appLocale.username,
                          textFieldSubText: context.appLocale.username,
                          textInputAction: TextInputAction.done,
                          validator: (value) =>
                              FormValidation.validateFieldNotEmpty(
                            value,
                            'Username',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.h),
                  Button(
                    label: context.appLocale.save,
                    isLoading: isLoading.value,
                    onPressed: () {
                      if (formKey.value.currentState!.validate()) {
                        final gender = genderOptionsMap.entries
                            .firstWhere(
                              (g) => g.value == selectedGender.value,
                            )
                            .key;
                        FocusManager.instance.primaryFocus?.unfocus();
                        context
                            .read<CompleteOnboardingCubit>()
                            .completeOnboarding(
                              email: email,
                              username: usernameController.text.trim(),
                              gender: gender,
                            );
                      }
                    },
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
