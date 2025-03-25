import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class DiveInScreen extends StatelessWidget {
  const DiveInScreen({super.key});
  static const String id = 'diveInScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final currentLocale = context.currentLocale;
    final user = AppStorage.getUser();
    return Scaffold(
      body: DecoratedContainer(
        enablePadding: true,
        isAnimate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: context.topPadding + 40.h,
            ),
            Hero(
              tag: 'masoyinbo_logo',
              child: AppAssets.images.jpegs.masoyinboLogo.image(scale: 4.5),
            ),
            SizedBox(height: mqr.height * 0.03),
            Text(
              context.appLocale.driveRightIn,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge!.copyWith(
                fontFamily: FontFamily.margarine,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.appLocale.saveProvidedDetails,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall!.copyWith(
                height: 1.4,
                letterSpacing: 0.3,
              ),
            ),
            SizedBox(height: mqr.height * 0.07),
            Button(
              label: '',
              onPressed: () {
                if (user == null) {
                  context.goNamed(LoginScreen.id);
                } else {
                  context.goNamed(DashboardIndexScreen.id);
                }
              },
              child: RichText(
                text: TextSpan(
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                  ),
                  children: [
                    TextSpan(text: context.appLocale.continueTx),
                    TextSpan(
                      text:
                          ' (${currentLocale == yo ? context.enLocale.continueTx : context.yoLocale.continueTx})',
                      style: context.textTheme.bodySmall!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}
