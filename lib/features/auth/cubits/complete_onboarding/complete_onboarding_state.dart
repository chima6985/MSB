part of 'complete_onboarding_cubit.dart';

@freezed
class CompleteOnboardingState with _$CompleteOnboardingState {
  const factory CompleteOnboardingState.initial() = _Initial;
  const factory CompleteOnboardingState.loading() = _Loading;
  const factory CompleteOnboardingState.loaded() = _Loaded;
  const factory CompleteOnboardingState.error({
    String? error,
  }) = _Error;
}
