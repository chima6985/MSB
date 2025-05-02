import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'all_players_state.dart';
part 'all_players_cubit.freezed.dart';

class AllPlayersCubit extends Cubit<AllPlayersState> {
  AllPlayersCubit({
    GameRepository? gameRepository,
    required AuthBloc authBloc,
  })  : _gameRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _gameRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  Timer? _timer;

  /// Start polling getAllPlayersEndpoint every 10 seconds
  Future<void> startPolling({required String gameCode}) async {
    _timer?.cancel();

    await getAllPlayersEndpoint(gameCode: gameCode);

    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      getAllPlayersEndpoint(gameCode: gameCode);
    });
  }

  /// Stop polling
  void stopPolling() {
    print('here');
    _timer?.cancel();
    _timer = null;
  }

  /// Get all players
  Future<void> getAllPlayersEndpoint({
    required String gameCode,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _gameRepository.getAllPlayersEndpoint(
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

  @override
  Future<void> close() {
    stopPolling();
    return super.close();
  }
}
