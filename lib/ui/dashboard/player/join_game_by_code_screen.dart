import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class JoinGameByCodeScreen extends StatelessWidget {
  const JoinGameByCodeScreen({super.key});

  static const String id = 'joinGameByCodeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JoinGameRoomCubit(
        authBloc: context.read(),
      ),
      child: const _JoinGameByCodeScreen(),
    );
  }
}

class _JoinGameByCodeScreen extends HookWidget {
  const _JoinGameByCodeScreen();

  @override
  Widget build(BuildContext context) {
    final gameCodeController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useState(GlobalKey<FormState>());
    return BlocListener<JoinGameRoomCubit, JoinGameRoomState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => isLoading.value = true,
          loaded: () {
            isLoading.value = false;
            showModalBottomSheet(
              context: context,
              builder: (context) => const GameSetupModal(),
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            );
          },
          error: (error) {
            isLoading.value = false;
            ToastMessage.showError(
              context: context,
              text: error ?? '',
            );
          },
          orElse: () => isLoading.value = false,
        );
      },
      child: Scaffold(
        body: DecoratedContainer(
          canPop: !isLoading.value,
          child: AbsorbPointer(
            absorbing: isLoading.value,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 21),
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
                        Form(
                          key: formKey.value,
                          child: CustomTextField(
                            textEditingController: gameCodeController,
                            textFieldText: gameCodeYr,
                            textFieldSubText: gameCodeYr,
                            validator: (value) =>
                                FormValidation.validateFieldNotEmpty(
                              value,
                              gameCodeYr,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Button(
                          label: findGameRoomYr,
                          isLoading: isLoading.value,
                          onPressed: () {
                            if (formKey.value.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<JoinGameRoomCubit>().joinGameRoom(
                                    gameCode: gameCodeController.text.trim(),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: context.btmPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
