import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class TeamLeaderConfirmationModal extends StatelessWidget {
  const TeamLeaderConfirmationModal({super.key});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 30),
          Text(
            teamLeaderYr,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          SizedBox(height: 32.h),
          AppAssets.images.jpegs.confetti.image(scale: 4),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              sureToLeaveGameYr,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Button(
            label: editTeamNameYr,
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => const TeamNameModal(),
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
    );
  }
}

class TeamNameModal extends HookWidget {
  const TeamNameModal({super.key});

  @override
  Widget build(BuildContext context) {
    final teamNameController = useTextEditingController();
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
            teamNameYr,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomTextField(
              textEditingController: teamNameController,
              textFieldText: enterTeamNameYr,
              textFieldSubText: enterTeamNameEn,
              bottomSpacing: false,
            ),
          ),
          const SizedBox(height: 35),
          Button(
            label: continueYr,
            onPressed: () => context
              ..pop(context)
              ..pop(context),
          ),
          SizedBox(height: context.btmPadding),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
