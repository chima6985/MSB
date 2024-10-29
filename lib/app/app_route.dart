import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:masoyinbo_mobile/ui/ui.dart';

class NavObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('route `pushed` from $previousRoute ---> $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('route `popped` from $previousRoute ---> $route');
  }
}

final router = GoRouter(
  initialLocation: '/',
  observers: [
    // NavObserver(),
  ],
  routes: [
    GoRoute(
      name: SplashScreen.id,
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: OnboardingScreen.id,
      path: '/onboardingScreen',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      name: LanguagePreferenceScreen.id,
      path: '/languagePreferenceScreen',
      builder: (context, state) => const LanguagePreferenceScreen(),
    ),
    GoRoute(
      name: SurveyScreen.id,
      path: '/surveyScreen',
      builder: (context, state) => const SurveyScreen(),
    ),
  ],
  // errorBuilder: (context, state) => const PageNotFound(),
);
