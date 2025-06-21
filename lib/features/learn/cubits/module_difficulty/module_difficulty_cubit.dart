import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'module_difficulty_state.dart';
part 'module_difficulty_cubit.freezed.dart';

class ModuleDifficultyCubit extends Cubit<ModuleDifficultyState> {
  ModuleDifficultyCubit({
    LearnRepository? learnRepository,
    required AuthBloc authBloc,
  })  : _learnRepository = learnRepository ?? locator<LearnRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// Learn repository.
  final LearnRepository _learnRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Get module difficulties
  Future<void> getModuleDifficulties() async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final moduleDifficulties = await _learnRepository.getModuleDifficulties(
        token: user.token,
      );
      emit(_Loaded(moduleDifficulties: moduleDifficulties));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
