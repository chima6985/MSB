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
    GoRoute(
      name: DiveInScreen.id,
      path: '/diveInScreen',
      builder: (context, state) => const DiveInScreen(),
    ),
    GoRoute(
      name: SignUpScreen.id,
      path: '/signUpScreen',
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: PersonalizeSignUpScreen.id,
      path: '/personalizeSignUpScreen',
      builder: (context, state) => const PersonalizeSignUpScreen(),
    ),
    GoRoute(
      name: AllSetScreen.id,
      path: '/allSetScreen',
      builder: (context, state) => const AllSetScreen(),
    ),
    GoRoute(
      name: LoginScreen.id,
      path: '/loginScreen',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: DashboardIndexScreen.id,
      path: '/dashboardIndexScreen',
      builder: (context, state) => const DashboardIndexScreen(),
    ),
  ],
  // errorBuilder: (context, state) => const PageNotFound(),
);
