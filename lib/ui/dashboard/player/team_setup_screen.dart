import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/dashboard/player/team_all_set_modal.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class TeamSetupScreen extends StatefulWidget {
  const TeamSetupScreen({
    super.key,
    this.isTeamFormationAutomatic = false,
  });
  static const String id = 'teamSetupScreen';

  final bool isTeamFormationAutomatic;

  @override
  State<TeamSetupScreen> createState() => _TeamSetupScreenState();
}

class _TeamSetupScreenState extends State<TeamSetupScreen> {
  bool isTeamSet = false;

  int teamsGroup = 0;

  final scrollController = ScrollController();

  final groupedPlayers = <GameRoomProfileWidget>[];

  final exampleBox = <TeamSetProfileWidget>[];

  final exampleBox1 = <TeamSetProfileWidget>[];

  //todo : work on example box and teamsGroup to be dynamic for the addition of teams

  final teamPlayers = [
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
  ];

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    final isManualReady = !widget.isTeamFormationAutomatic &&
        (exampleBox.length != 4 || exampleBox1.length != 4);
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
                              widget.isTeamFormationAutomatic
                                  ? 'Automatic'
                                  : 'Manual',
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
                        Opacity(
                          opacity: widget.isTeamFormationAutomatic ? 0.5 : 1,
                          child: ElevatedButton(
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
                              if (!widget.isTeamFormationAutomatic) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    teamsGroup++;
                                  });
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent +
                                        mqr.width * 0.45,
                                    duration: 300.ms,
                                    curve: Curves.linear,
                                  );
                                });
                              }
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
                      children: teamPlayers.map((player) {
                        return AbsorbPointer(
                          absorbing: groupedPlayers.contains(player) ||
                              widget.isTeamFormationAutomatic,
                          child: Draggable<GameRoomProfileWidget>(
                            data: player,
                            feedback: player,
                            child: Opacity(
                              opacity:
                                  groupedPlayers.contains(player) ? 0.7 : 1,
                              child: player,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: mqr.height * 0.1),
                  if (widget.isTeamFormationAutomatic)
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 23),
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      child: Row(
                        children: [
                          _ManualTeamFormationWidget(
                            teamNo: 1,
                            children: [
                              TeamSetProfileWidget(
                                isTeamLeader: true,
                                image:
                                    AppAssets.images.jpegs.profileImage1.path,
                                name: 'Master',
                              ),
                              TeamSetProfileWidget(
                                image: AppAssets.images.jpegs.profileImage.path,
                                name: 'You',
                              ),
                              TeamSetProfileWidget(
                                image:
                                    AppAssets.images.jpegs.profileImage1.path,
                                name: 'Tosin',
                              ),
                              TeamSetProfileWidget(
                                image: AppAssets.images.jpegs.profileImage.path,
                                name: 'P4',
                              ),
                            ],
                          ),
                          _ManualTeamFormationWidget(
                            teamNo: 2,
                            children: [
                              TeamSetProfileWidget(
                                image:
                                    AppAssets.images.jpegs.profileImage1.path,
                                name: 'Lateefah',
                              ),
                              TeamSetProfileWidget(
                                image: AppAssets.images.jpegs.profileImage.path,
                                name: 'Viko',
                              ),
                              TeamSetProfileWidget(
                                image:
                                    AppAssets.images.jpegs.profileImage1.path,
                                name: 'Angel',
                              ),
                              TeamSetProfileWidget(
                                image: AppAssets.images.jpegs.profileImage.path,
                                name: 'Kido',
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  else
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 23),
                      scrollDirection: Axis.horizontal,
                      controller: scrollController,
                      child: Row(
                        children: [
                          DragTarget<GameRoomProfileWidget>(
                            onWillAcceptWithDetails: (details) {
                              if (exampleBox.length == 4) {
                                ToastMessage.showError(
                                  context: context,
                                  text: 'Team is full',
                                );
                                return false;
                              }
                              return true;
                            },
                            onAcceptWithDetails: (data) {
                              setState(() {
                                groupedPlayers.add(data.data);
                                exampleBox.add(
                                  TeamSetProfileWidget(
                                    image: data.data.image,
                                    name: data.data.name,
                                    // ignore: prefer_is_empty
                                    isTeamLeader: exampleBox.length == 0,
                                  ),
                                );
                              });
                            },
                            onLeave: (data) {
                              setState(() {
                                exampleBox.remove(
                                  TeamSetProfileWidget(
                                    image: data?.image ?? '',
                                    name: data?.name ?? '',
                                    // ignore: prefer_is_empty
                                    isTeamLeader: exampleBox.length == 0,
                                  ),
                                );
                              });
                            },
                            builder: (context, candidateData, rejectedData) {
                              return _ManualTeamFormationWidget(
                                teamNo: 1,
                                children: exampleBox.map(
                                  (person) {
                                    final profileWidget = GameRoomProfileWidget(
                                      image: person.image,
                                      name: person.name,
                                      isGameMaster: exampleBox
                                              .indexWhere((e) => e == person) ==
                                          0,
                                      size: 0.73,
                                    );
                                    return Draggable<GameRoomProfileWidget>(
                                      data: profileWidget,
                                      feedback: profileWidget,
                                      child: Opacity(
                                        opacity: groupedPlayers
                                                .contains(profileWidget)
                                            ? 0.7
                                            : 1,
                                        child: person,
                                      ),
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                          DragTarget<GameRoomProfileWidget>(
                            onWillAcceptWithDetails: (details) {
                              if (exampleBox1.length == 4) {
                                ToastMessage.showError(
                                  context: context,
                                  text: 'Team is full',
                                );
                                return false;
                              }
                              return true;
                            },
                            onAcceptWithDetails: (data) {
                              setState(() {
                                groupedPlayers.add(data.data);
                                exampleBox1.add(
                                  TeamSetProfileWidget(
                                    image: data.data.image,
                                    name: data.data.name,
                                    // ignore: prefer_is_empty
                                    isTeamLeader: exampleBox.length == 0,
                                  ),
                                );
                              });
                            },
                            onLeave: (data) {
                              setState(() {
                                exampleBox1.remove(
                                  TeamSetProfileWidget(
                                    image: data?.image ?? '',
                                    name: data?.name ?? '',
                                    // ignore: prefer_is_empty
                                    isTeamLeader: exampleBox1.length == 0,
                                  ),
                                );
                              });
                            },
                            builder: (context, candidateData, rejectedData) {
                              return _ManualTeamFormationWidget(
                                teamNo: 2,
                                children: exampleBox1.map(
                                  (person) {
                                    final profileWidget = GameRoomProfileWidget(
                                      image: person.image,
                                      name: person.name,
                                      isGameMaster: exampleBox1
                                              .indexWhere((e) => e == person) ==
                                          0,
                                      size: 0.73,
                                    );
                                    return Draggable<GameRoomProfileWidget>(
                                      data: profileWidget,
                                      feedback: profileWidget,
                                      child: Opacity(
                                        opacity: groupedPlayers
                                                .contains(profileWidget)
                                            ? 0.7
                                            : 1,
                                        child: person,
                                      ),
                                    );
                                  },
                                ).toList(),
                              );
                            },
                          ),
                          for (int i = 0; i < teamsGroup; i++)
                            DragTarget<GameRoomProfileWidget>(
                              onWillAcceptWithDetails: (details) {
                                if (exampleBox.length == 4) {
                                  ToastMessage.showError(
                                    context: context,
                                    text: 'Team is full',
                                  );
                                  return false;
                                }
                                return true;
                              },
                              onAcceptWithDetails: (data) {
                                setState(() {
                                  groupedPlayers.add(data.data);
                                  exampleBox.add(
                                    TeamSetProfileWidget(
                                      image: data.data.image,
                                      name: data.data.name,
                                      // ignore: prefer_is_empty
                                      isTeamLeader: exampleBox.length == 0,
                                    ),
                                  );
                                });
                              },
                              onLeave: (data) {
                                setState(() {
                                  exampleBox.remove(
                                    TeamSetProfileWidget(
                                      image: data?.image ?? '',
                                      name: data?.name ?? '',
                                      // ignore: prefer_is_empty
                                      isTeamLeader: exampleBox.length == 0,
                                    ),
                                  );
                                });
                              },
                              builder: (context, candidateData, rejectedData) {
                                return _ManualTeamFormationWidget(
                                  teamNo: i + 3,
                                  children: exampleBox.map(
                                    (person) {
                                      final profileWidget =
                                          GameRoomProfileWidget(
                                        image: person.image,
                                        name: person.name,
                                        isGameMaster: exampleBox.indexWhere(
                                              (e) => e == person,
                                            ) ==
                                            0,
                                        size: 0.73,
                                      );
                                      return Draggable<GameRoomProfileWidget>(
                                        data: profileWidget,
                                        feedback: profileWidget,
                                        child: Opacity(
                                          opacity: groupedPlayers
                                                  .contains(profileWidget)
                                              ? 0.7
                                              : 1,
                                          child: person,
                                        ),
                                      );
                                    },
                                  ).toList(),
                                );
                              },
                            ),
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
                  if (isManualReady) {
                    ToastMessage.showError(
                      context: context,
                      text: 'Please set a complete team to proceed',
                    );
                    return;
                  }
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

class _ManualTeamFormationWidget extends StatelessWidget {
  const _ManualTeamFormationWidget({
    required this.children,
    required this.teamNo,
  });

  final List<Widget> children;
  final int? teamNo;

  @override
  Widget build(BuildContext context) {
    final mqr = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: mqr.width * 0.41,
          height: mqr.width * 0.41,
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
          margin: const EdgeInsets.only(right: 18),
          decoration: BoxDecoration(
            color: AppColors.blueE7,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.greyB6),
          ),
          child: Wrap(
            spacing: 39.sp,
            children: children,
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
