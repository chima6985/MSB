import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'get_lesson_state.dart';
part 'get_lesson_cubit.freezed.dart';

class GetLessonCubit extends Cubit<GetLessonState> {
  GetLessonCubit({
    LearnRepository? learnRepository,
    required AuthBloc authBloc,
  })  : _learnRepository = learnRepository ?? locator<LearnRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// Learn repository.
  final LearnRepository _learnRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Get lesson
  Future<void> getLesson({
    required String moduleId,
  }) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final lesson = await _learnRepository.getLesson(
        moduleId: moduleId,
        token: user.token,
      );
      emit(_Loaded(lesson: lesson));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
