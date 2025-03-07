import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class DeleteAccountSurveyScreen extends HookWidget {
  const DeleteAccountSurveyScreen({
    super.key,
  });
  static const String id = 'deleteAccountSurveyScreen';

  @override
  Widget build(BuildContext context) {
    final otherReasonController = useTextEditingController();
    final selectedReason = useState<Set<String>>({});
    final mqr = MediaQuery.of(context).size;
    final currentLocale = context.currentLocale;
    final yo = context.yoLocale;
    final en = context.enLocale;
    return Scaffold(
      body: DecoratedContainer(
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
                        deleteAccountEn,
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quickSurveyEn,
                      style: context.textTheme.titleLarge,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      weHateToSeeYouGoEn,
                      style: context.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    for (final option in surveyDeleteOptions)
                      _SurveyOptionWidget(
                        text: option,
                        isSelected: selectedReason.value.contains(option),
                        onTap: () {
                          final temp = Set<String>.from(selectedReason.value);
                          if (temp.contains(option)) {
                            temp.remove(option);
                          } else {
                            temp.add(option);
                          }
                          selectedReason.value = temp;
                        },
                      ),
                    SizedBox(height: 18.h),
                    RichText(
                      text: TextSpan(
                        style: context.textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: howCanWeImproveOurServiceEn),
                          TextSpan(
                            text: ' ($optionalEn)',
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: otherReasonController,
                      maxLines: 4,
                      // style: context.textTheme.bodyMedium!.copyWith(
                      //   color: kTextMainColor,
                      // ),
                      decoration: InputDecoration(
                        fillColor: AppColors.blueE7.withValues(alpha: 0.8),
                        filled: true,
                        hintText: saySomethingEn,
                        hintStyle: context.textTheme.bodySmall!.copyWith(
                          fontSize: 13.5.sp,
                          color: AppColors.blue12.withValues(alpha: 0.7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: AppColors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.blue12.withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100.h),
              Button(
                label: currentLocale == 'yr' ? yo.confirm : en.confirm,
                width: mqr.width * 0.83,
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const EnterYourPasswordModal(),
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.btmPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class _SurveyOptionWidget extends StatelessWidget {
  const _SurveyOptionWidget({
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Transform.translate(
      offset: const Offset(-5, 0),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      checkColor: WidgetStateProperty.all(
                        AppColors.white,
                      ),
                      fillColor: WidgetStateProperty.all(
                        isSelected ? AppColors.blue12 : AppColors.white,
                      ),
                      side: BorderSide(
                        width: 1.4,
                        color: AppColors.blue12.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                  child: AbsorbPointer(
                    child: Checkbox(
                      value: isSelected,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Text(
                  text,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
