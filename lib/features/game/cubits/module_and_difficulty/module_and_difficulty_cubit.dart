import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

part 'module_and_difficulty_state.dart';
part 'module_and_difficulty_cubit.freezed.dart';

class ModuleAndDifficultyCubit extends Cubit<ModuleAndDifficultyState> {
  ModuleAndDifficultyCubit({
    GameRepository? gameRepository,
    required AuthBloc authBloc,
  })  : _gameRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _gameRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Get sections and difficulty
  Future<void> getSectionsAndDifficulty() async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final apiResponse = await _gameRepository.getSectionsAndDifficulty(
        languageId: yorubaLanguageId,
        token: user.token,
      );
      emit(_Loaded(moduleDifficulty: apiResponse));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
