import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'update_password_state.dart';
part 'update_password_cubit.freezed.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit({
    UserRepository? userRepository,
    required AuthBloc authBloc,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        _authBloc = authBloc,
        super(const UpdatePasswordState.initial());

  /// User repository.
  final UserRepository _userRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Update password
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _userRepository.updatePassword(
        token: user.token,
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      emit(const _Loaded());
    } on UserException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
