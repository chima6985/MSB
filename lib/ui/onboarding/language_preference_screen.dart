import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class LanguagePreferenceScreen extends StatelessWidget {
  const LanguagePreferenceScreen({super.key});
  static const String id = 'languagePreferenceScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final currentLocale = context.currentLocale;
    final localeBloc = context.read<LocaleBloc>();
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        final locale = state.when(
          locale: (locale) => locale,
        );
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
                    currentLocale == 'yo'
                        ? context.yoLocale.languagePreference
                        : context.enLocale.languagePreference,
                    style: context.textTheme.bodyLarge!.copyWith(
                      fontFamily: FontFamily.margarine,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      currentLocale == 'yo'
                          ? context.enLocale.languagePreference
                          : context.yoLocale.languagePreference,
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
                        context.appLocale.yoruba,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      CustomSwitch(
                        onTap: (v) =>
                            localeBloc.add(const LocaleEvent.yoLocale()),
                        isEnabled: locale == const Locale('yo'),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.appLocale.english,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      CustomSwitch(
                        onTap: (v) =>
                            localeBloc.add(const LocaleEvent.enLocale()),
                        isEnabled: locale == const Locale('en'),
                      ),
                    ],
                  ),
                  SizedBox(height: 85.h),
                  Button(
                    width: mqr.width,
                    label: '',
                    child: RichText(
                      text: TextSpan(
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                        ),
                        children: [
                          TextSpan(
                            text: currentLocale == 'yo'
                                ? context.yoLocale.save
                                : context.enLocale.save,
                          ),
                          TextSpan(
                            text:
                                ' (${currentLocale == 'yo' ? context.enLocale.save : context.yoLocale.save})',
                            style: context.textTheme.bodySmall!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => context.pushNamed(DashboardIndexScreen.id),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
