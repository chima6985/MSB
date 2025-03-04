import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'user_survey_state.dart';
part 'user_survey_cubit.freezed.dart';

class UserSurveyCubit extends Cubit<UserSurveyState> {
  UserSurveyCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        super(const _Initial());

  /// User repository.
  final UserRepository _userRepository;

  /// Update password
  Future<void> answerUserSurvey({
    required String email,
    required List<String> surveyReason,
    required List<String> surveyUsage,
    required String surveyCommitment,
    required String surveyAge,
  }) async {
    try {
      emit(const _Loading());
      await _userRepository.answerUserSurvey(
        email: email,
        surveyReason: surveyReason,
        surveyUsage: surveyUsage,
        surveyCommitment: surveyCommitment,
        surveyAge: surveyAge,
      );
      emit(const _Loaded());
    } on UserException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
