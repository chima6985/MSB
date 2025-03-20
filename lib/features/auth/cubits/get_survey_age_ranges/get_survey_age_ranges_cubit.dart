import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'get_survey_age_ranges_state.dart';
part 'get_survey_age_ranges_cubit.freezed.dart';

class GetSurveyAgeRangesCubit extends Cubit<GetSurveyAgeRangesState> {
  GetSurveyAgeRangesCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const _Initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Get survey age range
  Future<void> getSurveyAgeRange() async {
    try {
      emit(const _Loading());
      final surveyAgeRanges = await _authRepository.getSurveyAgeRange();
      emit(_Loaded(surveyAgeRanges: surveyAgeRanges));
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
