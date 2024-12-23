import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/dashboard/player/team_all_set_modal.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class TeamSetupScreen extends HookWidget {
  const TeamSetupScreen({
    super.key,
    this.isTeamFormationAutomatic = false,
  });
  static const String id = 'teamSetupScreen';

  final bool isTeamFormationAutomatic;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final isTeamSet = useState(false);
    final isManualReady = !isTeamFormationAutomatic && !isTeamSet.value;
    return Scaffold(
      body: DecoratedContainer(
        isAnimate: true,
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                CustomBackButton(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const ConfirmLeaveActionModal(),
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Center(
                    child: Text(
                      teamSetUpYr,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 21),
                  Padding(
                    padding: const EdgeInsets.only(left: 26, right: 14),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isTeamFormationAutomatic ? 'Automatic' : 'Manual',
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Team formation',
                              style: context.textTheme.bodySmall!.copyWith(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300,
                                fontSize: 12.5.sp,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shadowColor: AppColors.transparent,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            backgroundColor: AppColors.blue12,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            if (isManualReady) {}
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_rounded,
                                size: 17.sp,
                              ),
                              Text(
                                'Add Team',
                                textScaler: TextScaler.noScaling,
                                style: context.textTheme.bodySmall!.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clickAndDragFriendsIntoTeamYr,
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          firstTeamMemberTeamLeaderYr,
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: AppColors.yellowFF,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GameRoomProfileWidget(
                          isGameMaster: true,
                          image: AppAssets.images.jpegs.profileImage1.path,
                          name: 'Master',
                          size: 0.7,
                        ),
                        GameRoomProfileWidget(
                          image: AppAssets.images.jpegs.profileImage.path,
                          name: 'You',
                          size: 0.73,
                        ),
                        GameRoomProfileWidget(
                          image: AppAssets.images.jpegs.profileImage1.path,
                          name: 'Tosin',
                          size: 0.73,
                        ),
                        GameRoomProfileWidget(
                          image: AppAssets.images.jpegs.profileImage.path,
                          name: 'P4',
                          size: 0.73,
                        ),
                        GameRoomProfileWidget(
                          image: AppAssets.images.jpegs.profileImage1.path,
                          name: 'Lateefah',
                          size: 0.73,
                        ),
                        GameRoomProfileWidget(
                          image: AppAssets.images.jpegs.profileImage.path,
                          name: 'Viko',
                          size: 0.73,
                        ),
                        GameRoomProfileWidget(
                          image: AppAssets.images.jpegs.profileImage1.path,
                          name: 'Angel',
                          size: 0.73,
                        ),
                        GameRoomProfileWidget(
                          image: AppAssets.images.jpegs.profileImage.path,
                          name: 'Kido',
                          size: 0.73,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: mqr.height * 0.1),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(left: 23),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => isTeamSet.value = true,
                          child: const TeamFormationWidget(teamNo: 1),
                        ),
                        const TeamFormationWidget(teamNo: 2),
                        const TeamFormationWidget(teamNo: 3),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Button(
                label: setTeamYr,
                color: isManualReady ? AppColors.greyDB : null,
                borderColor: isManualReady ? AppColors.greyDB : null,
                labelColor: isManualReady ? AppColors.black15 : null,
                onPressed: () {
                  if (isManualReady) return;
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const TeamAllSetModal(),
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}
