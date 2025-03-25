import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'submit_answer_state.dart';
part 'submit_answer_cubit.freezed.dart';

class SubmitAnswerCubit extends Cubit<SubmitAnswerState> {
  SubmitAnswerCubit({
    PracticeRepository? practiceRepository,
    required AuthBloc authBloc,
  })  : _practiceRepository =
            practiceRepository ?? locator<PracticeRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// PracticeRepository repository.
  final PracticeRepository _practiceRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Answer submit
  Future<void> submitAnswer({
    required String questionId,
    required String answer,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _practiceRepository.submitAnswer(
        questionId: questionId,
        answer: answer,
        token: user.token,
      );
      emit(const _Loaded());
    } on PracticeException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
