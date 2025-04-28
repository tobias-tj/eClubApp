import 'package:e_club/navigation_wrapper.dart';
import 'package:e_club/screens/accounts/login_account_screen.dart';
import 'package:e_club/screens/accounts/register_account_screen.dart';
import 'package:e_club/screens/analytic/analytic_screen.dart';
import 'package:e_club/screens/home_screen.dart';
import 'package:e_club/screens/more/more_screen.dart';
import 'package:e_club/screens/qr/qr_screen.dart';
import 'package:e_club/screens/splash_screen.dart';
import 'package:e_club/screens/transfer/transfer_screen.dart';
import 'package:e_club/screens/welcome/welcome_screen.dart';
import 'package:e_club/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/splash', routes: [
  GoRoute(
      name: 'splash',
      path: '/splash',
      builder: (context, state) => const SplashScreen()),
  GoRoute(
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen()),
  GoRoute(
      name: 'register',
      path: '/register',
      pageBuilder: (context, state) =>
          NoTransitionPage(child: const RegisterAccountScreen())),
  GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) =>
          NoTransitionPage(child: const LoginAccountScreen())),
  ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
            body: child, bottomNavigationBar: const NavigationWrapper());
      },
      routes: [
        GoRoute(
            name: 'home',
            path: '/home',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const HomeScreen())),
        GoRoute(
            name: 'transfer',
            path: '/transfer',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const TransferScreen())),
        GoRoute(
            name: 'qrCode',
            path: '/qrCode',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const QrScreen())),
        GoRoute(
            name: 'analytic',
            path: '/analytic',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const AnalyticScreen())),
        GoRoute(
            name: 'more',
            path: '/more',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const MoreScreen())),
      ])
]);

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({required Widget child})
      : super(
          child: child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
}
