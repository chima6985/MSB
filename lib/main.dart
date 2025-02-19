import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masoyinbo_mobile/app/app.dart';
import 'package:masoyinbo_mobile/app/app_locator.dart';
import 'package:masoyinbo_mobile/core/core.dart';
import 'package:masoyinbo_mobile/features/features.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      await AppStorage.init();
      await setUpLocator();
      Bloc.observer = AppBlocObserver();
      runApp(MyApp(connectivity: Connectivity()));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.connectivity,
  });

  /// Connectivity
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              lazy: false,
              create: (context) => InternetCubit(
                connectivity: connectivity,
              ),
            ),
            BlocProvider(
              lazy: false,
              create: (context) =>
                  AuthBloc()..add(const AuthEvent.authAppStarted()),
            ),
          ],
          child: Unfocus(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Masoyinbo',
              theme: AppTheme.themeData,
              routerConfig: router,
            ),
          ),
        );
      },
    );
  }
}
