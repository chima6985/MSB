import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/extension/context_extension.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/gen/fonts.gen.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

class ForgotPasswordOtpScreen extends StatelessWidget {
  const ForgotPasswordOtpScreen({
    super.key,
    required this.email,
  });

  final String email;

  static const String id = 'forgotPasswordOtpScreen';

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
      child: _ForgotPasswordOtpScreen(email: email),
    );
  }
}

class _ForgotPasswordOtpScreen extends StatefulWidget {
  const _ForgotPasswordOtpScreen({
    required this.email,
  });

  final String email;

  @override
  State<_ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<_ForgotPasswordOtpScreen>
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
              verified: () {
                setState(() {
                  isLoading = true;
                });
                ToastMessage.showSuccess(
                  context: context,
                  text: otpVerifiedSuccessfullyYr,
                );
                context.replaceNamed(
                  ChangePasswordScreen.id,
                  extra: {'email': widget.email},
                );
              },
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
                pinController.clear();
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
                    context.appLocale.confirmYourOtp,
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
                        TextSpan(text: context.appLocale.enterTheOtp),
                        TextSpan(
                          text: ' ${widget.email} ',
                          style: context.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(text: context.appLocale.toResetYourPassword),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  AbsorbPointer(
                    absorbing: isLoading,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomPinField(
                            controller: pinController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return context.appLocale.fieldIsRequired;
                              }
                              if (value.length != 6) {
                                return context.appLocale.fieldIsRequired;
                              }
                              return null;
                            },
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
                                          context
                                              .read<ResendOtpCubit>()
                                              .resendOtp(
                                                email:
                                                    widget.email.toLowerCase(),
                                              );
                                        },
                                        child: Text(
                                          context.appLocale.resend,
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                            fontWeight: FontWeight.w400,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      )
                                    : RichText(
                                        text: TextSpan(
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                            color: AppColors.blue12,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: context
                                                  .appLocale.resendCodeIn,
                                            ),
                                            TextSpan(
                                              text:
                                                  ' ${time.minutes}:${time.seconds}',
                                              style: context
                                                  .textTheme.bodyMedium!
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
                            label: context.appLocale.confirm,
                            isLoading: isLoading,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                context.read<VerifyOtpCubit>().verifyOtp(
                                      email: widget.email.trim().toLowerCase(),
                                      otp: pinController.text,
                                    );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Button(
                    label: context.appLocale.back,
                    isOutlined: true,
                    labelColor: AppColors.black15,
                    onPressed: () => context.pop(context),
                  ),
                  SizedBox(height: context.btmPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
