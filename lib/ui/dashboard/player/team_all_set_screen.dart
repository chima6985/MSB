import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class TeamAllSetScreen extends HookWidget {
  const TeamAllSetScreen({
    super.key,
  });
  static const String id = 'teamAllSetScreen';

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;

    void navigateTo() {
      Future.delayed(7.seconds).then((_) {
        router.pushReplacementNamed(
          PlayQuestionScreen.id,
          extra: {
            'isPractice': false,
            'isTimed': true,
            'isMultiPlayer': true,
          },
        );
      });
    }

    void navigateToTeamLeader() {
      Future.delayed(7.seconds).then((_) {
        router.pushReplacementNamed(
          PlayQuestionScreen.id,
          extra: {
            'isPractice': false,
            'isTimed': true,
            'isMultiPlayer': true,
            'isTeamLeader': true,
          },
        );
      });
    }

    useEffect(() {
      Future.delayed(10.seconds).then((_) {
        if (context.mounted) {
          final currentRoute = router.state?.name;
          if (currentRoute == TeamAllSetScreen.id) {
            context.pushReplacementNamed(
              QuizLoaderScreen.id,
              extra: {'navigateTo': navigateTo},
            );
          }
        }
      });
      return null;
    });

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
                      teamAllSetYr,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 21),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Manual',
                            style: context.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  const TeamLeaderConfirmationModal(),
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                            ).then(
                              (value) async {
                                await Future.delayed(2.seconds);
                                if (context.mounted) {
                                  context.pushReplacementNamed(
                                    QuizLoaderScreen.id,
                                    extra: {'navigateTo': navigateToTeamLeader},
                                  );
                                }
                              },
                            ),
                            child: Text(
                              'Team 1',
                              style: context.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Team formation',
                            style: context.textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.5.sp,
                            ),
                          ),
                          Text(
                            'My Team',
                            style: context.textTheme.bodySmall!.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                              fontSize: 12.5.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    const SingleChildScrollView(
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TeamFormationWidget(),
                          TeamFormationWidget(),
                          TeamFormationWidget(),
                        ],
                      ),
                    ),
                    SizedBox(height: 44.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        eachPlayerInstructionYr,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        systemRecognizesTeamLeadersChoicesYr,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(height: mqr.height * 0.09),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            waitingForGameMasterToStartTheGameYr,
                            style: context.textTheme.bodySmall!.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        const TypeWriterProgressTextIndicator(
                          fontWeight: FontWeight.w400,
                          isItalic: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.btmPadding),
          ],
        ),
      ),
    );
  }
}

class TeamFormationWidget extends StatelessWidget {
  const TeamFormationWidget({
    super.key,
    this.teamNo,
  });

  final int? teamNo;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: mqr.width * 0.41,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
          margin: const EdgeInsets.only(right: 18),
          decoration: BoxDecoration(
            color: AppColors.blueE7,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.greyB6),
          ),
          child: Wrap(
            spacing: 39.sp,
            children: [
              TeamSetProfileWidget(
                isTeamLeader: true,
                image: AppAssets.images.jpegs.profileImage.path,
                name: 'P4',
              ),
              TeamSetProfileWidget(
                image: AppAssets.images.jpegs.profileImage1.path,
                name: 'Angel',
              ),
              TeamSetProfileWidget(
                image: AppAssets.images.jpegs.profileImage1.path,
                name: 'Kiki',
              ),
              TeamSetProfileWidget(
                image: AppAssets.images.jpegs.profileImage.path,
                name: 'Kido',
              ),
            ],
          ),
        ),
        if (teamNo != null) ...[
          const SizedBox(height: 8),
          Text(
            'Team $teamNo',
            style: context.textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
