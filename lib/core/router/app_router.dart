import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/login/auth_provider.dart';
import '../../features/login/login_screen.dart';
import '../../features/dashboard/dashboard_screen.dart';
import '../../features/calendar/calendar_screen.dart';
import '../../features/messages/messages_screen.dart';
import '../../features/absence/absence_screen.dart';
import '../../features/availability/availability_screen.dart';
import '../../features/marketplace/marketplace_screen.dart';
import '../../features/timesheet/timesheet_screen.dart';
import '../../features/profile/profile_screen.dart';
import 'main_shell.dart';

part 'app_router.g.dart';

// ---------------------------------------------------------------------------
// Route names
// ---------------------------------------------------------------------------

abstract final class AppRoutes {
  static const String login = '/login';
  static const String home = '/';
  static const String dashboard = '/dashboard';
  static const String calendar = '/calendar';
  static const String messages = '/messages';
  static const String absence = '/absence';
  static const String availability = '/availability';
  static const String marketplace = '/marketplace';
  static const String timesheet = '/timesheet';
  static const String profile = '/profile';
}

// ---------------------------------------------------------------------------
// Router provider
// ---------------------------------------------------------------------------

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  final notifier = _RouterChangeNotifier(ref);

  ref.onDispose(notifier.dispose);

  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    debugLogDiagnostics: true,
    refreshListenable: notifier,
    redirect: (context, state) {
      final isLoggingIn = state.matchedLocation == AppRoutes.login;

      if (authState is AuthStateInitial || authState is AuthStateLoading) {
        return null;
      }
      if (authState is AuthStateAuthenticated) {
        return isLoggingIn ? AppRoutes.dashboard : null;
      }
      // AuthStateUnauthenticated or AuthStateError
      return isLoggingIn ? null : AppRoutes.login;
    },
    routes: [
      // Login (outside shell)
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        pageBuilder: (context, state) => NoTransitionPage(
          child: LoginScreen(),
        ),
      ),

      // Main shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          final rights = ref.read(accessRightsProvider);
          return MainShell(accessRights: rights, child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutes.dashboard,
            name: 'dashboard',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardScreen()),
          ),
          GoRoute(
            path: AppRoutes.calendar,
            name: 'calendar',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CalendarScreen()),
          ),
          GoRoute(
            path: AppRoutes.messages,
            name: 'messages',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MessagesScreen()),
          ),
          GoRoute(
            path: AppRoutes.absence,
            name: 'absence',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AbsenceScreen()),
          ),
          GoRoute(
            path: AppRoutes.availability,
            name: 'availability',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AvailabilityScreen()),
          ),
          GoRoute(
            path: AppRoutes.marketplace,
            name: 'marketplace',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: MarketplaceScreen()),
          ),
          GoRoute(
            path: AppRoutes.timesheet,
            name: 'timesheet',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TimesheetScreen()),
          ),
          GoRoute(
            path: AppRoutes.profile,
            name: 'profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
        ],
      ),
    ],
  );
}

// ---------------------------------------------------------------------------
// Router refresh helper — notifies GoRouter when auth state changes
// ---------------------------------------------------------------------------

class _RouterChangeNotifier extends ChangeNotifier {
  _RouterChangeNotifier(Ref ref) {
    _subscription = ref.listen<AuthState>(
      authNotifierProvider,
      (_, _x) => notifyListeners(),
    );
  }

  late final ProviderSubscription<AuthState> _subscription;

  @override
  void dispose() {
    _subscription.close();
    super.dispose();
  }
}

// ---------------------------------------------------------------------------
// GoRouter refresh helper (stream-based, kept for optional use)
// ---------------------------------------------------------------------------

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
