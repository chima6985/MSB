import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class ConfirmLeaveActionModal extends StatelessWidget {
  const ConfirmLeaveActionModal({
    super.key,
    this.onTapIntent,
  });

  final VoidCallback? onTapIntent;

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
            confirmActionYr,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          SizedBox(height: 32.h),
          AppAssets.images.jpegs.exitDoor.image(scale: 4),
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
          SizedBox(height: 62.h),
          Button(
            label: leaveRoomYr,
            onPressed: onTapIntent ??
                () => context
                  ..pop(context)
                  ..pop(context),
          ),
          const SizedBox(height: 24),
          Button(
            label: dontLeaveYr,
            isOutlined: true,
            labelColor: AppColors.black15,
            onPressed: () => context..pop(context),
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}

class ConfirmPracticeLeaveActionModal extends StatelessWidget {
  const ConfirmPracticeLeaveActionModal({
    super.key,
    this.onTapIntent,
  });

  final VoidCallback? onTapIntent;

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
            confirmActionYr,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!.copyWith(
              fontFamily: FontFamily.margarine,
            ),
          ),
          SizedBox(height: 32.h),
          AppAssets.images.jpegs.exitDoor.image(scale: 4),
          SizedBox(height: 16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              sureToLeavePractiveYr,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 62.h),
          Button(
            label: leavePracticeYr,
            onPressed: onTapIntent ??
                () => context
                  ..pop(context)
                  ..pop(context),
          ),
          const SizedBox(height: 24),
          Button(
            label: dontLeaveYr,
            isOutlined: true,
            labelColor: AppColors.black15,
            onPressed: () => context..pop(context),
          ),
          SizedBox(height: context.btmPadding),
        ],
      ),
    );
  }
}
