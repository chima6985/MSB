import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'user_cubit.freezed.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({
    UserRepository? userRepository,
    required AuthBloc authBloc,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        _authBloc = authBloc,
        super(const UserState.initial());

  /// User repository.
  final UserRepository _userRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  void init() {
    final user = _authBloc.state.user;
    emit(_Loaded(user: user!));
  }

  /// Get user
  Future<void> getUser() async {
    emit(_Loading(user: state.user));
    final user = AppStorage.getUser();
    try {
      if (user != null) {
        final currentUser = await _userRepository.getUser(token: user.token);
        AppStorage.saveUser(currentUser);
        emit(_Loaded(user: currentUser));
      } else {
        _authBloc.add(const AuthEvent.authAppStarted());
      }
    } on UserException catch (e) {
      emit(
        _Error(
          user: user,
          error: e.message,
        ),
      );
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
