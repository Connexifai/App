import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/models/access_rights.dart';
import 'app_router.dart';

/// A navigation destination entry.
class _NavDestination {
  const _NavDestination({
    required this.route,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    this.requiredFeature,
  });

  final String route;
  final Widget icon;
  final Widget selectedIcon;
  final String label;

  /// When set, this destination only shows when the flag is true.
  final bool Function(AccessRights)? requiredFeature;
}

/// The main shell widget that wraps all authenticated screens with a
/// [NavigationBar] at the bottom.
///
/// Destinations are shown/hidden based on [AccessRights] feature flags.
class MainShell extends StatelessWidget {
  const MainShell({
    super.key,
    required this.accessRights,
    required this.child,
  });

  final AccessRights accessRights;
  final Widget child;

  static const List<_NavDestination> _allDestinations = [
    _NavDestination(
      route: AppRoutes.dashboard,
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    _NavDestination(
      route: AppRoutes.calendar,
      icon: Icon(Icons.calendar_month_outlined),
      selectedIcon: Icon(Icons.calendar_month_rounded),
      label: 'Rooster',
    ),
    _NavDestination(
      route: AppRoutes.messages,
      icon: Icon(Icons.notifications_outlined),
      selectedIcon: Icon(Icons.notifications_rounded),
      label: 'Berichten',
    ),
    _NavDestination(
      route: AppRoutes.absence,
      icon: Icon(Icons.beach_access_outlined),
      selectedIcon: Icon(Icons.beach_access_rounded),
      label: 'Verlof',
      requiredFeature: _absenceEnabled,
    ),
    _NavDestination(
      route: AppRoutes.availability,
      icon: Icon(Icons.event_available_outlined),
      selectedIcon: Icon(Icons.event_available_rounded),
      label: 'Beschikbaar',
      requiredFeature: _availabilityEnabled,
    ),
    _NavDestination(
      route: AppRoutes.marketplace,
      icon: Icon(Icons.storefront_outlined),
      selectedIcon: Icon(Icons.storefront_rounded),
      label: 'Marktplaats',
      requiredFeature: _marketplaceEnabled,
    ),
    _NavDestination(
      route: AppRoutes.timesheet,
      icon: Icon(Icons.access_time_outlined),
      selectedIcon: Icon(Icons.access_time_filled_rounded),
      label: 'Uren',
      requiredFeature: _timesheetsEnabled,
    ),
    _NavDestination(
      route: AppRoutes.profile,
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded),
      label: 'Profiel',
    ),
  ];

  // Feature flag helpers (top-level to allow use as tear-off).
  static bool _absenceEnabled(AccessRights r) => r.featureRequestAbsenceEnabled;
  static bool _availabilityEnabled(AccessRights r) =>
      r.hasAvailabilityFeature;
  static bool _marketplaceEnabled(AccessRights r) => r.featureMarketplaceEnabled;
  static bool _timesheetsEnabled(AccessRights r) => r.featureTimesheetsEnabled;

  List<_NavDestination> get _visibleDestinations => _allDestinations
      .where(
        (d) => d.requiredFeature == null || d.requiredFeature!(accessRights),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final visible = _visibleDestinations;

    // Find which tab index corresponds to the current route.
    int selectedIndex =
        visible.indexWhere((d) => location.startsWith(d.route));
    if (selectedIndex < 0) selectedIndex = 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          context.go(visible[index].route);
        },
        destinations: visible
            .map(
              (d) => NavigationDestination(
                icon: d.icon,
                selectedIcon: d.selectedIcon,
                label: d.label,
              ),
            )
            .toList(),
      ),
    );
  }
}
