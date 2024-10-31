import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class LanguagePreferenceScreen extends StatelessWidget {
  const LanguagePreferenceScreen({super.key});
  static const String id = 'languagePreferenceScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final languageEnabled = ValueNotifier('yr');
    return Scaffold(
      body: DecoratedContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: context.topPadding),
              const SizedBox(height: 15),
              AppAssets.images.jpegs.bawoniHello.image(
                scale: 2.45.sp,
              ),
              const SizedBox(height: 20),
              Text(
                languagePreferenceEn,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: 'Margarine',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  selectPreferredLanguageEn,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    yoruba,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: languageEnabled,
                    builder: (context, val, child) {
                      return CustomSwitch(
                        onTap: (p0) => languageEnabled.value = 'yr',
                        isEnabled: languageEnabled.value == 'yr',
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    english,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: languageEnabled,
                    builder: (context, val, child) {
                      return CustomSwitch(
                        onTap: (p0) => languageEnabled.value = 'en',
                        isEnabled: languageEnabled.value == 'en',
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 85.h),
              Button(
                width: mqr.width,
                label: saveEr,
                onPressed: () => context.pushNamed(SurveyScreen.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
