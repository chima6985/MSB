import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ModulesScreen extends HookWidget {
  const ModulesScreen({
    super.key,
  });
  static const String id = 'modulesScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final selectedPosition = useState<int?>(null);
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
                        'Alphabets',
                        style: context.textTheme.titleLarge!.copyWith(
                          fontFamily: FontFamily.margarine,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                welcomeToYourYrLearningClass,
                textScaler: TextScaler.noScaling,
                style: context.textTheme.bodySmall,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    _AlphabetModeuleListTileWidget(
                      title: 'Master the alphabets. Part 1',
                      position: 0,
                      selectedPosition: selectedPosition,
                    ),
                    _AlphabetModeuleListTileWidget(
                      title: 'Master the alphabets. Part 2',
                      position: 1,
                      selectedPosition: selectedPosition,
                    ),
                    _AlphabetModeuleListTileWidget(
                      title: 'Tone marks',
                      position: 2,
                      selectedPosition: selectedPosition,
                    ),
                    _AlphabetModeuleListTileWidget(
                      title: 'Master the alphabets',
                      position: 3,
                      selectedPosition: selectedPosition,
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(height: mqr.height * 0.2 + context.btmPadding),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlphabetModeuleListTileWidget extends StatelessWidget {
  const _AlphabetModeuleListTileWidget({
    required this.title,
    required this.position,
    required this.selectedPosition,
  });

  final String title;
  final int position;
  final ValueNotifier<int?> selectedPosition;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedPosition.value == position;
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (isSelected) {
              context.pushNamed(
                ModuleIntroScreen.id,
                extra: {'title': title},
              );
            } else {
              selectedPosition.value = position;
              Future.delayed(900.ms).then((_) {
                if (!context.mounted) return;
                context.pushNamed(
                  ModuleIntroScreen.id,
                  extra: {'title': title},
                );
              });
            }
          },
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: isSelected ? 1.5 : 0.6,
                color: isSelected
                    ? AppColors.blue12
                    : AppColors.blue12.withOpacity(0.6),
              ),
            ),
            child: Row(
              children: [
                AppAssets.images.jpegs.alphabet.image(
                  width: 40.w,
                  height: 40.w,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    textScaler: TextScaler.noScaling,
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                Icon(
                  Icons.check_circle,
                  color: isSelected ? AppColors.green4A : AppColors.blackB6,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
