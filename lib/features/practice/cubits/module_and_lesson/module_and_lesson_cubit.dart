import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

part 'module_and_lesson_state.dart';
part 'module_and_lesson_cubit.freezed.dart';

class ModuleAndLessonCubit extends Cubit<ModuleAndLessonState> {
  ModuleAndLessonCubit({
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

  /// Get module and lesson
  Future<void> getModuleAndLesson() async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _practiceRepository.getModuleAndLessons(
        language: yoruba,
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
