import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'complete_onboarding_state.dart';
part 'complete_onboarding_cubit.freezed.dart';

class CompleteOnboardingCubit extends Cubit<CompleteOnboardingState> {
  CompleteOnboardingCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(const _Initial());

  /// User repository.
  final UserRepository _userRepository;

  /// Auth Bloc.

  /// Update password
  Future<void> completeOnboarding({
    required String email,
    required String username,
    required String gender,
  }) async {
    try {
      emit(const _Loading());
      await _userRepository.completeOnboarding(
        email: email,
        gender: gender,
        username: username,
      );
      emit(const _Loaded());
    } on UserException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
