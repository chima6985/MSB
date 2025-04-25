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
      name: ConfirmEmailScreen.id,
      path: '/confirmEmailScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return ConfirmEmailScreen(email: paramHandler?['email']);
      },
    ),
    GoRoute(
      name: PersonalizeSignUpScreen.id,
      path: '/personalizeSignUpScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return PersonalizeSignUpScreen(email: paramHandler?['email']);
      },
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
    GoRoute(
      name: LearnIntroScreen.id,
      path: '/learnIntroScreen',
      builder: (context, state) => const LearnIntroScreen(),
    ),
    GoRoute(
      name: ModulesScreen.id,
      path: '/modulesScreen',
      builder: (context, state) => const ModulesScreen(),
    ),
    GoRoute(
      name: ModuleIntroScreen.id,
      path: '/moduleIntroScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return ModuleIntroScreen(
          title: paramHandler?['title'] ?? 'Alphabets',
        );
      },
    ),
    GoRoute(
      name: ModuleScreen.id,
      path: '/moduleScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return ModuleScreen(
          title: paramHandler?['title'] ?? 'Alphabets',
        );
      },
    ),
    GoRoute(
      name: PlayScreen.id,
      path: '/playScreen',
      builder: (context, state) => const PlayScreen(),
    ),
    GoRoute(
      name: QuizLoaderScreen.id,
      path: '/quizLoaderScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return QuizLoaderScreen(
          navigateTo: paramHandler?['navigateTo'],
        );
      },
    ),
    GoRoute(
      name: SettingsScreen.id,
      path: '/settingsScreen',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      name: NotificationsScreen.id,
      path: '/notificationsScreen',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      name: LanguageScreen.id,
      path: '/languageScreen',
      builder: (context, state) => const LanguageScreen(),
    ),
    GoRoute(
      name: HelpScreen.id,
      path: '/helpScreen',
      builder: (context, state) => const HelpScreen(),
    ),
    GoRoute(
      name: AccountScreen.id,
      path: '/accountScreen',
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      name: PasswordScreen.id,
      path: '/passwordScreen',
      builder: (context, state) => const PasswordScreen(),
    ),
    GoRoute(
      name: ChangeAvatarScreen.id,
      path: '/changeAvatarScreen',
      builder: (context, state) => const ChangeAvatarScreen(),
    ),
    GoRoute(
      name: PaymentScreen.id,
      path: '/paymentScreen',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      name: DeleteAccountScreen.id,
      path: '/deleteAccountScreen',
      builder: (context, state) => const DeleteAccountScreen(),
    ),
    GoRoute(
      name: DeleteAccountSurveyScreen.id,
      path: '/deleteAccountSurveyScreen',
      builder: (context, state) => const DeleteAccountSurveyScreen(),
    ),
    GoRoute(
      name: ForgotPasswordScreen.id,
      path: '/forgotPasswordScreen',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      name: ForgotPasswordOtpScreen.id,
      path: '/forgotPasswordOtpScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return ForgotPasswordOtpScreen(
          email: paramHandler?['email'] ?? '',
        );
      },
    ),
    GoRoute(
      name: ChangePasswordScreen.id,
      path: '/changePasswordScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return ChangePasswordScreen(
          email: paramHandler?['email'] ?? '',
        );
      },
    ),
    GoRoute(
      name: PlayerScreen.id,
      path: '/playerScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return PlayerScreen(
          isPractice: paramHandler?['isPractice'] ?? false,
          isSinglePlayer: paramHandler?['isSinglePlayer'] ?? false,
          isMultiPlayer: paramHandler?['isMultiPlayer'] ?? false,
          section: paramHandler?['section'],
        );
      },
    ),
    GoRoute(
      name: PlayerIntroScreen.id,
      path: '/singlePlayerIntroScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return PlayerIntroScreen(
          isPractice: paramHandler?['isPractice'] ?? false,
          isTimed: paramHandler?['isTimed'] ?? false,
          isSinglePlayer: paramHandler?['isSinglePlayer'] ?? false,
          questionSection: paramHandler?['questionSection'],
        );
      },
    ),
    GoRoute(
      name: PlayQuestionScreen.id,
      path: '/playQuestionScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return PlayQuestionScreen(
          isPractice: paramHandler?['isPractice'] ?? false,
          isTimed: paramHandler?['isTimed'] ?? false,
          isSinglePlayer: paramHandler?['isSinglePlayer'] ?? false,
          isTeamLeader: paramHandler?['isTeamLeader'] ?? false,
          isMultiPlayer: paramHandler?['isMultiPlayer'] ?? false,
          isGameMaster: paramHandler?['isGameMaster'] ?? false,
          questionSection: paramHandler?['questionSection'],
          totalLives: paramHandler?['totalLives'],
        );
      },
    ),
    GoRoute(
      name: BookmarkScreen.id,
      path: '/bookmarkScreen',
      builder: (context, state) => const BookmarkScreen(),
    ),
    GoRoute(
      name: JoinGameByCodeScreen.id,
      path: '/joinGameByCodeScreen',
      builder: (context, state) => const JoinGameByCodeScreen(),
    ),
    GoRoute(
      name: GameRoomScreen.id,
      path: '/gameRoomScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return GameRoomScreen(
          isMultiplayer: paramHandler?['isMultiplayer'] ?? false,
          isTeamMode: paramHandler?['isTeamMode'] ?? false,
          isTeamFormationAutomatic:
              paramHandler?['isTeamFormationAutomatic'] ?? false,
        );
      },
    ),
    GoRoute(
      name: TeamAllSetScreen.id,
      path: '/teamAllSetScreen',
      builder: (context, state) => const TeamAllSetScreen(),
    ),
    GoRoute(
      name: ScoreBoardScreen.id,
      path: '/scoreBoardScreen',
      builder: (context, state) => const ScoreBoardScreen(),
    ),
    GoRoute(
      name: GameRoomCreatedScreen.id,
      path: '/gameRoomCreatedScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return GameRoomCreatedScreen(
          isTeamMode: paramHandler?['isTeamMode'] ?? false,
          isTeamFormationAutomatic:
              paramHandler?['isTeamFormationAutomatic'] ?? false,
        );
      },
    ),
    GoRoute(
      name: NewGameScreen.id,
      path: '/newGameScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return NewGameScreen(
          isPlayAgainWithSameSettings:
              paramHandler?['isPlayAgainWithSameSettings'] ?? false,
        );
      },
    ),
    GoRoute(
      name: TeamSetupScreen.id,
      path: '/teamSetupScreen',
      builder: (context, state) {
        final paramHandler = state.extra is Map ? state.extra as Map? : {};
        return TeamSetupScreen(
          isTeamFormationAutomatic:
              paramHandler?['isTeamFormationAutomatic'] ?? false,
        );
      },
    ),
    GoRoute(
      name: RanOutOfLivesScreen.id,
      path: '/ranOutOfLivesScreen',
      builder: (context, state) => const RanOutOfLivesScreen(),
    ),
    GoRoute(
      name: PlayerGameAnalyticsScreen.id,
      path: '/playerGameAnalyticsScreen',
      builder: (context, state) => const PlayerGameAnalyticsScreen(),
    ),
  ],
  // errorBuilder: (context, state) => const PageNotFound(),
);
