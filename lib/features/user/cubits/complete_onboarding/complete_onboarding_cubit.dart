import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'complete_onboarding_state.dart';
part 'complete_onboarding_cubit.freezed.dart';

class CompleteOnboardingCubit extends Cubit<CompleteOnboardingState> {
  CompleteOnboardingCubit({
    UserRepository? userRepository,
    required AuthBloc authBloc,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        _authBloc = authBloc,
        super(const CompleteOnboardingState.initial());

  /// User repository.
  final UserRepository _userRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Update password
  Future<void> completeOnboarding({
    required String gender,
    required String username,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _userRepository.completeOnboarding(
        token: user.token,
        gender: gender,
        username: username,
      );
      emit(const _Loaded());
    } on UserException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
