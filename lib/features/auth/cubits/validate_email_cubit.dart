import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';

part 'validate_email_state.dart';
part 'validate_email_cubit.freezed.dart';

class ValidateEmailCubit extends Cubit<ValidateEmailState> {
  ValidateEmailCubit({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? locator<AuthRepository>(),
        super(const ValidateEmailState.initial());

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Validate email
  Future<void> validateEmail({
    required String email,
  }) async {
    try {
      emit(const _Validating());
      final apiResponse = await _authRepository.validateEmail(email: email);
      emit(_Validated(data: apiResponse));
    } on AuthException catch (e) {
      emit(_Error(error: e.message));
    }
  }
}
