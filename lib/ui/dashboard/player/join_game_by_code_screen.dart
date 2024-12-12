import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class JoinGameByCodeScreen extends HookWidget {
  const JoinGameByCodeScreen({
    super.key,
  });
  static const String id = 'joinGameByCodeScreen';

  @override
  Widget build(BuildContext context) {
    final emailAddressController = useTextEditingController();
    return Scaffold(
      body: DecoratedContainer(
        child: Column(
          children: [
            SizedBox(height: context.topPadding),
            Stack(
              children: [
                const CustomBackButton(),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          joinGameRoomYr,
                          style: context.textTheme.titleLarge!.copyWith(
                            fontFamily: FontFamily.margarine,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 21),
                          child: Text(
                            inputGameCodeYr,
                            textAlign: TextAlign.center,
                            textScaler: TextScaler.noScaling,
                            style: context.textTheme.bodyMedium!.copyWith(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 65.h),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  children: [
                    CustomTextField(
                      textEditingController: emailAddressController,
                      textFieldText: gameCodeYr,
                      // textFieldSubText: genderEn,
                    ),
                    const SizedBox(height: 40),
                    Button(
                      label: findGameRoomYr,
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => const GameSetupModal(),
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
