import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'start_game_state.dart';
part 'start_game_cubit.freezed.dart';

class StartGameCubit extends Cubit<StartGameState> {
  StartGameCubit({
    GameRepository? gameRepository,
    required AuthBloc authBloc,
  })  : _gameRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _gameRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Start game
  Future<void> startGame({
    required String gameCode,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _gameRepository.startGame(
        gameCode: gameCode,
        token: user.token,
      );
      emit(const _Loaded());
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
