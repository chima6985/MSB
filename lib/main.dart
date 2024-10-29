import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/app/app_route.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Masoyinbo',
          theme: AppTheme.themeData,
          routerConfig: router,
        );
      },
    );
  }
}
