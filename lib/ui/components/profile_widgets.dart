import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class GameRoomProfileWidget extends StatelessWidget {
  const GameRoomProfileWidget({
    super.key,
    this.isGameMaster = false,
    required this.image,
    required this.name,
    this.size = 1,
  });

  final bool isGameMaster;
  final String image;
  final String name;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: size,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isGameMaster)
            AppAssets.images.svgs.masterGameConsole.svg()
          else
            const SizedBox(height: 21),
          const SizedBox(height: 2),
          CircleAvatar(
            backgroundColor:
                isGameMaster ? AppColors.whiteFB : AppColors.greyB6,
            radius: 32,
            child: Image.asset(
              image,
              width: 45.w,
              height: 45.w,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class TeamSetProfileWidget extends StatelessWidget {
  const TeamSetProfileWidget({
    super.key,
    this.isTeamLeader = false,
    required this.image,
    required this.name,
  });

  final bool isTeamLeader;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isTeamLeader) ...[
          AppAssets.images.svgs.crown.svg(
            width: 12.w,
            height: 12.w,
          ),
          const SizedBox(height: 4),
        ] else
          const SizedBox(height: 16),
        CircleAvatar(
          backgroundColor: AppColors.greyB6,
          radius: 18,
          child: Image.asset(
            image,
            width: 22.w,
            height: 22.w,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 40.w,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: context.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
