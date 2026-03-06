/// Demo entry point — bypasses authentication and injects mock data so all
/// screens can be visually inspected without a live API.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/auth/session_model.dart';
import 'core/models/access_rights.dart';
import 'core/router/app_router.dart';
import 'features/login/auth_provider.dart';
import 'shared/theme/app_theme.dart';

// ---------------------------------------------------------------------------
// Mock session — valid for 30 days, all feature flags enabled
// ---------------------------------------------------------------------------

final _demoSession = SessionModel(
  tenantIdentity: 'demo-bedrijf',
  clientId: 'demo-gebruiker',
  clientSecret: 'demo-secret',
  accessToken: 'demo-access-token',
  refreshToken: 'demo-refresh-token',
  accessTokenExpiresAt: DateTime.now().toUtc().add(const Duration(hours: 1)),
  refreshTokenExpiresAt: DateTime.now().toUtc().add(const Duration(days: 30)),
  userIdentity: 'demo-user-001',
);

const _demoRights = AccessRights(
  featureRequestAbsenceEnabled: true,
  featureConfirmationEnabled: true,
  featureConfirmationDeclineEnabled: true,
  featureConfirmationDeclineRemarkRequired: false,
  featureRequestAvailabilityEnabled: true,
  featureRequestAvailablityBlockEnabled: true,
  featureMarketplaceEnabled: true,
  featureTimesheetsEnabled: true,
  featureQrCodeEnabled: true,
  featureGeofencingEnabled: false,
);

// ---------------------------------------------------------------------------
// Provider overrides
// ---------------------------------------------------------------------------

/// Override that immediately returns an authenticated state with demo data.
class _DemoAuthNotifier extends AuthNotifier {
  @override
  AuthState build() => AuthState.authenticated(
        session: _demoSession,
        accessRights: _demoRights,
      );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('nl', null);
  runApp(
    ProviderScope(
      overrides: [
        authNotifierProvider.overrideWith(_DemoAuthNotifier.new),
      ],
      child: const _DemoApp(),
    ),
  );
}

class _DemoApp extends ConsumerWidget {
  const _DemoApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    // Toggle between brand themes by changing the `adecco` flag:
    //   false → Planbition (primary blue #2563EB)
    //   true  → Adecco (primary orange #EE7203 + dark blue #003DA5)
    // Toggle: false → Planbition (blue), true → Adecco (orange + dark blue)
    const adecco = false;

    return MaterialApp.router(
      title: 'Planbition — Demo',
      theme: AppTheme.light(adecco: adecco),
      darkTheme: AppTheme.dark(adecco: adecco),
      themeMode: ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
