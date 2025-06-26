import 'package:cached_network_image/cached_network_image.dart';
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
                      textScaler: TextScaler.noScaling,
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
                  Hero(
                    tag: 'profile_image',
                    child: Container(
                      width: 80.w,
                      height: 80.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blue13,
                      ),
                      padding: const EdgeInsetsDirectional.all(8),
                      child: CachedNetworkImage(
                        imageUrl: user?.image ?? '',
                        errorWidget: (context, _, error) => Icon(
                          Iconsax.user4,
                          size: 27.w,
                          color: AppColors.white,
                        ),
                        progressIndicatorBuilder: (context, _, val) => Icon(
                          Iconsax.user4,
                          size: 27.w,
                          color: AppColors.white,
                        ),
                      ),
                    ),
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
                              textScaler: TextScaler.noScaling,
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
                  SizedBox(height: 75.h),
                  Button(
                    label: updateChangesEn,
                    onPressed: () {},
                  ),
                  SizedBox(height: 25.h),
                  InkWell(
                    onTap: () => context.pushNamed(DeleteAccountScreen.id),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Iconsax.trash,
                          color: AppColors.redFF,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          context.appLocale.deleteAccount,
                          textScaler: TextScaler.noScaling,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.redFF,
                          ),
                        ),
                      ],
                    ),
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
