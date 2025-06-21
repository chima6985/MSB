import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';

part 'all_modules_state.dart';
part 'all_modules_cubit.freezed.dart';

class AllModulesCubit extends Cubit<AllModulesState> {
  AllModulesCubit({
    LearnRepository? learnRepository,
    required AuthBloc authBloc,
  })  : _learnRepository = learnRepository ?? locator<LearnRepository>(),
        _authBloc = authBloc,
        super(const _Initial());

  /// Learn repository.
  final LearnRepository _learnRepository;

  /// Auth Bloc.
  final AuthBloc _authBloc;

  /// Get all modules
  Future<void> getAllModules({required String difficultyId}) async {
    try {
      emit(const _Loading());
      final user = UserHelper.fetchUser(authBloc: _authBloc);
      if (user == null) return;
      final modules = await _learnRepository.getAllModules(
        difficultyId: difficultyId,
        token: user.token,
      );
      emit(_Loaded(modules: modules));
    } on GameException catch (e) {
      emit(_Error(error: e.message));
    } on AuthException catch (e) {
      _authBloc.add(AuthEvent.authSignOut(message: e.message));
    }
  }
}
