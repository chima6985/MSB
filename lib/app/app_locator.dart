// ignore_for_file: unused_local_variable

import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/env/env.dart';
import 'package:masoyinbo_mobile/utils/utils.dart';

/// Global [GetIt.instance].
final locator = GetIt.instance;

/// Set up [GetIt] locator.
Future<void> setUpLocator() async {
  final baseUrl = Env().apiBaseUrl;

  locator.allowReassignment = true;
  locator
    ..registerSingleton<AuthRepository>(
      AuthRepository(baseUrl: baseUrl),
    )
    ..registerSingleton<UserRepository>(
      UserRepository(baseUrl: baseUrl),
    )
    ..registerSingleton<BiometricSupport>(
      await isBiometricSupported(),
    )
    ..registerLazySingleton<LocalAuthentication>(LocalAuthentication.new);
}

Future<BiometricSupport> isBiometricSupported() async {
  final auth = LocalAuthentication();
  if (await auth.isDeviceSupported()) {
    final availableBiometrics = await auth.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) {
      return BiometricSupport.notSupported;
    } else {
      return BiometricSupport.supported;
    }
  } else {
    return BiometricSupport.notSupported;
  }
}
