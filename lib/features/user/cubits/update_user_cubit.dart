import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'update_user_state.dart';
part 'update_user_cubit.freezed.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit({
    UserRepository? userRepository,
    required AuthBloc authBloc,
    required UserCubit userCubit,
  })  : _userRepository = userRepository ?? locator<UserRepository>(),
        _authBloc = authBloc,
        _userCubit = userCubit,
        super(const UpdateUserState.initial());

  /// User repository.
  final UserRepository _userRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// User cubit.
  final UserCubit _userCubit;

  /// Update user
  Future<void> updateUser({
    String? firstName,
    String? middleName,
    String? lastName,
    String? dob,
    String? address,
    String? city,
    String? postalCode,
    String? country,
    String? verificationDocumentType,
    String? verificationDocument,
  }) async {
    try {
      emit(const _Updating());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      await _userRepository.completeOnboarding(
        token: user.token,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        dob: dob,
        address: address,
        city: city,
        postalCode: postalCode,
        country: country,
        verificationDocumentType: verificationDocumentType,
        verificationDocument: verificationDocument,
      );
      emit(const _Updated());
      await _userCubit.getUser();
    } on UserException catch (e) {
      emit(
        _Error(
          error: e.message,
        ),
      );
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
