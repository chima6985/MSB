import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ConfirmEmailScreen extends StatelessWidget {
  const ConfirmEmailScreen({super.key});

  static const String id = 'confirmEmailScreen';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VerifyOtpCubit(),
        ),
        BlocProvider(
          create: (context) => ResendOtpCubit(),
        ),
      ],
      child: const _ConfirmEmailScreen(),
    );
  }
}

class _ConfirmEmailScreen extends StatefulWidget {
  const _ConfirmEmailScreen();

  @override
  State<_ConfirmEmailScreen> createState() => _ConfirmEmailScreenState();
}

class _ConfirmEmailScreenState extends State<_ConfirmEmailScreen>
    with TickerProviderStateMixin {
  CustomTimerController? otpCountDownController;
  final pinController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    otpCountDownController = CustomTimerController(
      begin: const Duration(seconds: 60),
      end: Duration.zero,
      vsync: this,
    )..start();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    otpCountDownController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<VerifyOtpCubit, VerifyOtpState>(
          listener: (context, state) {
            state.maybeWhen(
              verifying: () => setState(() {
                isLoading = true;
              }),
              verified: () => context.goNamed(PersonalizeSignUpScreen.id),
              error: (error) {
                setState(() {
                  isLoading = false;
                });
                ToastMessage.showError(
                  context: context,
                  text: error ?? '',
                );
              },
              orElse: () => setState(() {
                isLoading = false;
              }),
            );
          },
        ),
        BlocListener<ResendOtpCubit, ResendOtpState>(
          listener: (context, state) {
            state.maybeWhen(
              loading: () {
                otpCountDownController?.reset();
                otpCountDownController?.start();
              },
              loaded: () {
                ToastMessage.showSuccess(
                  context: context,
                  text: 'Otp resent',
                );
              },
              error: (error) {
                otpCountDownController?.finish();
                ToastMessage.showError(
                  context: context,
                  text: error ?? '',
                );
              },
              orElse: () {
                otpCountDownController?.finish();
              },
            );
          },
        ),
      ],
      child: AbsorbPointer(
        absorbing: isLoading,
        child: Scaffold(
          body: DecoratedContainer(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.topPadding),
                    Hero(
                      tag: 'masoyinbo_logo',
                      child: AppAssets.images.jpegs.masoyinboLogo.image(
                        width: 70.w,
                        height: 70.w,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      confirmYourOtpYr,
                      textScaler: TextScaler.noScaling,
                      style: context.textTheme.titleLarge!.copyWith(
                        fontFamily: FontFamily.margarine,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: context.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          const TextSpan(text: enterTheOtpYr),
                          TextSpan(
                            text: ' oladimejiu@gmail.com ',
                            style: context.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const TextSpan(text: toResetYourPasswordYr),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: formKey,
                      child: CustomPinField(
                        controller: pinController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return fieldIsRequiredYr;
                          }
                          if (value.length != 6) {
                            return fieldIsRequiredYr;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTimer(
                        controller: otpCountDownController!,
                        builder: (state, time) {
                          return state == CustomTimerState.finished
                              ? InkWell(
                                  onTap: () {
                                    context.read<ResendOtpCubit>().resendOtp(
                                          email: 'daudu.victor173@gmail.com',
                                        );
                                  },
                                  child: Text(
                                    'Resend',
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    style:
                                        context.textTheme.bodyMedium!.copyWith(
                                      color: AppColors.blue12,
                                    ),
                                    children: [
                                      const TextSpan(text: 'Tun kóòdù rán '),
                                      TextSpan(
                                        text:
                                            ' ${time.minutes}:${time.seconds}',
                                        style: context.textTheme.bodyMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    ),
                    const SizedBox(height: 49),
                    Button(
                      label: '',
                      isLoading: isLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<VerifyOtpCubit>().verifyOtp(
                                email: 'daudu.victor173@gmail.com',
                                otp: pinController.text,
                              );
                        }
                      },
                      child: RichText(
                        text: TextSpan(
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: AppColors.white,
                          ),
                          children: [
                            const TextSpan(text: confirmYr),
                            TextSpan(
                              text: ' ($confirmEn)',
                              style: context.textTheme.bodySmall!.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w300,
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
            ),
          ),
        ),
      ),
    );
  }
}
