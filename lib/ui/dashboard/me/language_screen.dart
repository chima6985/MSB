import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class LanguageScreen extends HookWidget {
  const LanguageScreen({
    super.key,
  });
  static const String id = 'languageScreen';

  @override
  Widget build(BuildContext context) {
    final localeBloc = context.read<LocaleBloc>();
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, state) {
        final locale = state.when(
          locale: (locale) => locale,
        );
        return Scaffold(
          body: DecoratedContainer(
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
                          languageYr,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontFamily: FontFamily.margarine,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36.h),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 15),
                  child: Column(
                    children: [
                      Text(
                        selectPreferredLanguage2En,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontSize: 13.5.sp,
                        ),
                      ),
                      SizedBox(height: 36.h),
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
                            isEnabled: locale == const Locale(yo),
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
                            isEnabled: locale == const Locale(en),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(height: context.btmPadding),
              ],
            ),
          ),
        );
      },
    );
  }
}
