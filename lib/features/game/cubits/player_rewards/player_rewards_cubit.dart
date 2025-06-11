import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'player_rewards_state.dart';
part 'player_rewards_cubit.freezed.dart';

class PlayerRewardsCubit extends Cubit<PlayerRewardsState> {
  PlayerRewardsCubit({
    GameRepository? gameRepository,
    required AuthBloc authBloc,
    required UserCubit userCubit,
  })  : _gameRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        _userCubit = userCubit,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _gameRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// User Cubit.
  final UserCubit _userCubit;

  /// Get player rewards
  /// Practice and Single
  Future<void> getPlayerRewards({
    required bool isPractice,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final apiResponse = await _gameRepository.getPlayerRewards(
        isPractice: isPractice,
        token: user.token,
      );
      try {
        await _userCubit.getUser();
      } catch (e) {
        log(e.toString());
      }
      emit(_Loaded(playerStat: apiResponse));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }

  /// Get multiplayer player performance
  Future<void> getMultiplayerPlayerPerformance() async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final apiResponse = await _gameRepository.getMultiplayerPlayerPerformance(
        token: user.token,
      );
      try {
        await _userCubit.getUser();
      } catch (e) {
        log(e.toString());
      }
      emit(_Loaded(playerStat: apiResponse));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
