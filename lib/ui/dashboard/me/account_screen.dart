import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class AccountScreen extends HookWidget {
  const AccountScreen({
    super.key,
  });
  static const String id = 'accountScreen';

  @override
  Widget build(BuildContext context) {
    final genderOptionsMap = {
      'Male': context.appLocale.male,
      'Female': context.appLocale.female,
    };

    final genderOptions = [
      context.appLocale.male,
      context.appLocale.female,
    ];

    final currentLocale = context.currentLocale;
    final user = context.watch<UserCubit>().state.user;
    final usernameController =
        useTextEditingController(text: user?.username ?? '');
    final emailAddressController =
        useTextEditingController(text: user?.email.titleCase() ?? '');
    final passwordController = useTextEditingController(text: 'password');
    final selectedGender = useState<String?>(genderOptionsMap[user?.gender]);

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
                      context.appLocale.account,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () => context.pushNamed(ChangeAvatarScreen.id),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 40.sp,
                    backgroundColor: AppColors.blue13,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.blueE7,
                    radius: 12.sp,
                    child: Icon(
                      Iconsax.edit_2,
                      color: AppColors.blue12,
                      size: 17.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 55.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomDropDownField(
                    textFieldText: context.appLocale.gender,
                    textFieldSubText: currentLocale == yo
                        ? context.enLocale.gender
                        : context.yoLocale.gender,
                    hintText: context.appLocale.selectGender,
                    selectedValue: selectedGender.value,
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
                  ),
                  CustomTextField(
                    textEditingController: usernameController,
                    textFieldText: context.appLocale.username,
                    textFieldSubText: currentLocale == yo
                        ? context.enLocale.username
                        : context.yoLocale.username,
                  ),
                  CustomTextField(
                    textEditingController: emailAddressController,
                    textFieldText: context.appLocale.emailAddress,
                    textFieldSubText: currentLocale == yo
                        ? context.enLocale.emailAddress
                        : context.yoLocale.emailAddress,
                  ),
                  GestureDetector(
                    onTap: () => context.pushNamed(PasswordScreen.id),
                    child: AbsorbPointer(
                      child: PasswordTextField(
                        textEditingController: passwordController,
                        textFieldText: context.appLocale.password,
                        textFieldSubText: currentLocale == yo
                            ? context.enLocale.password
                            : context.yoLocale.password,
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Button(
                    label: updateChangesEn,
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
