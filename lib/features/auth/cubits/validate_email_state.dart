part of 'validate_email_cubit.dart';

@freezed
class ValidateEmailState with _$ValidateEmailState {
  const factory ValidateEmailState.initial() = _Initial;
  const factory ValidateEmailState.validating() = _Validating;
  const factory ValidateEmailState.validated({
    required Map<String, dynamic> data,
  }) = _Validated;
  const factory ValidateEmailState.error({
    String? error,
  }) = _Error;
}
