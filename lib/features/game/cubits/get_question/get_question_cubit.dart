import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'get_question_state.dart';
part 'get_question_cubit.freezed.dart';

class GetQuestionCubit extends Cubit<GetQuestionState> {
  GetQuestionCubit({
    GameRepository? gameRepository,
    required AuthBloc authBloc,
  })  : _gameRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _gameRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Get practice questions
  Future<void> getQuestions({
    required String difficulty,
    required String section,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final apiResponse = await _gameRepository.getQuestions(
        difficulty: difficulty,
        section: section,
        token: user.token,
      );
      emit(_Loaded(questions: apiResponse['questions']));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }

  /// Get single player questions
  Future<void> getSinglePlayerQuestions({
    required String difficulty,
    required String section,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final apiResponse = await _gameRepository.getQuestions(
        difficulty: difficulty,
        section: section,
        token: user.token,
      );
      final questions = (apiResponse['questions'] as List)
          .map((item) => Question.fromJson(item))
          .toList();
      final userLives = apiResponse.containsKey('userLives')
          ? apiResponse['userLives'] as int
          : 0;

      emit(
        _Loaded(
          questions: questions,
          userLives: userLives,
        ),
      );
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }

  /// Get multi-player question
  Future<void> getMultiPlayerQuestion({
    required String difficulty,
    required String section,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final apiResponse = await _gameRepository.getQuestions(
        difficulty: difficulty,
        section: section,
        token: user.token,
      );
      emit(_Loaded(questions: apiResponse['questions']));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
