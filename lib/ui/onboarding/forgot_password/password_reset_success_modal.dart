import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:masoyinbo_mobile/app/app_strings.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class PasswordResetSuccessModal extends StatelessWidget {
  const PasswordResetSuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: const Icon(Iconsax.close_circle),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            yourPasswordHasBeenSetYr,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          const SizedBox(height: 24),
          AppAssets.images.jpegs.successIcon.image(
            width: 100.w,
            height: 100.w,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              successfullyCreatedNewPasswordYr,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 35),
          Button(
            label: logInYr,
            onPressed: () => Navigator.popUntil(
              context,
              ModalRoute.withName('loginScreen'),
            ),
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}
