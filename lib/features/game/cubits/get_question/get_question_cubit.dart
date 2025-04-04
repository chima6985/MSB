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
  })  : _practiceRepository = gameRepository ?? locator<GameRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// GameRepository repository.
  final GameRepository _practiceRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Get question
  Future<void> getQuestions({
    required String difficulty,
    required String section,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _practiceRepository.getQuestions(
        difficulty: difficulty,
        section: section,
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
