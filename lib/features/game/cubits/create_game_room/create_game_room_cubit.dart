import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'create_game_room_state.dart';
part 'create_game_room_cubit.freezed.dart';

class CreateGameRoomCubit extends Cubit<CreateGameRoomState> {
  CreateGameRoomCubit({
    GameRepository? gameRepository,
    required AuthBloc authBloc,
  })  : _gameRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _gameRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Create game room
  Future<void> createGameRoom({
    required String sectionId,
    required String difficultyId,
    required bool teamMode,
    required String teamFormation,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final gameCode = await _gameRepository.createRoom(
        sectionId: sectionId,
        difficultyId: difficultyId,
        teamMode: teamMode,
        teamFormation: teamFormation,
        token: user.token,
      );
      emit(_Loaded(gameCode: gameCode));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
