import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
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
    final usernameController = useTextEditingController();
    final emailAddressController = useTextEditingController();
    final passwordController = useTextEditingController();
    final gender = useState<String?>(null);
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
                      accountYr,
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
                  ),
                  CustomTextField(
                    textEditingController: usernameController,
                    textFieldText: usernameYr,
                    textFieldSubText: usernameEn,
                  ),
                  CustomTextField(
                    textEditingController: emailAddressController,
                    textFieldText: emailAddressYr,
                    textFieldSubText: emailAddressEn,
                  ),
                  GestureDetector(
                    onTap: () => context.pushNamed(PasswordScreen.id),
                    child: AbsorbPointer(
                      child: PasswordTextField(
                        textEditingController: passwordController,
                        textFieldText: passwordYr,
                        textFieldSubText: passwordEn,
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
