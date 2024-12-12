import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class GameRoomScreen extends HookWidget {
  const GameRoomScreen({
    super.key,
  });
  static const String id = 'gameRoomScreen';

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(7.seconds).then((_) {
        if (context.mounted) {
          context.pushReplacementNamed(TeamAllSetScreen.id);
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
                      gameRoomYr,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VV9645',
                          style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '8',
                          style: context.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Game code',
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.5.sp,
                          ),
                        ),
                        Text(
                          'Players',
                          style: context.textTheme.bodySmall!.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.5.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          spacing: 65.w,
                          runSpacing: 21.w,
                          children: [
                            GameRoomProfileWidget(
                              isGameMaster: true,
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Master',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'You',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Tosin',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'P4',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Lateefah',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'Viko',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage1.path,
                              name: 'Angel',
                            ),
                            GameRoomProfileWidget(
                              image: AppAssets.images.jpegs.profileImage.path,
                              name: 'Kido',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Waiting for the game master to set up the team',
                            style: context.textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        const TypeWriterProgressTextIndicator(),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Button(
                      label: leaveGameRoomYr,
                      onPressed: () => showModalBottomSheet(
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
