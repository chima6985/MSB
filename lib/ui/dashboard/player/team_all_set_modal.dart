import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class TeamAllSetModal extends StatelessWidget {
  const TeamAllSetModal({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateTo() {
      Future.delayed(5.seconds).then((_) {
        router.pushReplacementNamed(
          PlayQuestionScreen.id,
          extra: {
            'isPractice': false,
            'isTimed': true,
            'isMultiPlayer': true,
            'isGameMaster': true,
          },
        );
      });
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
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
            allThingsSetYr,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              eachPlayerGameInstructionYr,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              teamLeadersChoiceInstructionYr,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                color: AppColors.yellowFF,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Button(
            label: startPlayingYr,
            onPressed: () => context
              ..pop()
              ..pushNamed(
                QuizLoaderScreen.id,
                extra: {'navigateTo': navigateTo},
              ),
          ),
          const SizedBox(height: 24),
          Button(
            label: adjustTeamYr,
            isOutlined: true,
            labelColor: AppColors.black15,
            onPressed: () => context.pop(context),
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}
