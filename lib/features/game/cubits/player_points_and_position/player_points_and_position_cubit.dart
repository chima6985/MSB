import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'player_points_and_position_state.dart';
part 'player_points_and_position_cubit.freezed.dart';

class PlayerPointsAndPositionCubit extends Cubit<PlayerPointsAndPositionState> {
  PlayerPointsAndPositionCubit({
    GameRepository? gameRepository,
    required AuthBloc authBloc,
  })  : _gameRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _gameRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Get player points and position
  Future<void> getPlayerPointsAndPosition({
    required String gameCode,
  }) async {
    try {
      emit(_Loading(players: state.players));
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final apiResponse = await _gameRepository.getPlayerPointsAndPosition(
        gameCode: gameCode,
        token: user.token,
      );
      emit(_Loaded(players: apiResponse));
    } on GameException catch (e) {
      emit(
        _Error(
          players: state.players,
          error: e.message,
        ),
      );
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
