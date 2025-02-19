import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class PersonalizeSignUpScreen extends StatelessWidget {
  const PersonalizeSignUpScreen({super.key});

  static const String id = 'personalizeSignUpScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompleteOnboardingCubit(authBloc: context.read()),
      child: const _PersonalizeSignUpScreen(),
    );
  }
}

class _PersonalizeSignUpScreen extends HookWidget {
  const _PersonalizeSignUpScreen();

  @override
  Widget build(BuildContext context) {
    final gender = useState<String?>(null);
    final usernameController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useState(GlobalKey<FormState>());
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
                  const SizedBox(height: 24),
                  Text(
                    createAccountYr,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
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
                  Form(
                    key: formKey.value,
                    child: Column(
                      children: [
                        CustomDropDownField(
                          textFieldText: genderYr,
                          textFieldSubText: genderEn,
                          hintText: 'Select Gender',
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
                          onChanged: (val) => gender.value = val,
                          validator: (value) =>
                              FormValidation.validateFieldNotEmpty(
                            gender.value,
                            'Gender',
                          ),
                        ),
                        CustomTextField(
                          textEditingController: usernameController,
                          textFieldText: usernameYr,
                          textFieldSubText: usernameEn,
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
                  const SizedBox(height: 17),
                  Button(
                    label: fipamoYr,
                    isLoading: isLoading.value,
                    onPressed: () {
                      if (formKey.value.currentState!.validate()) {
                        context
                            .read<CompleteOnboardingCubit>()
                            .completeOnboarding(
                              gender: gender.value ?? '',
                              username: usernameController.text.trim(),
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
