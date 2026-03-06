import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_router.dart';

/// Shell widget that wraps the 4-tab authenticated screens.
///
/// Bottom nav shows only for the 4 primary tab routes:
/// Kalender, Beschikbaarheid, Verlof, Uren.
/// Dashboard and detail screens (Profile, Messages, etc.) hide the nav bar.
class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  static const _tabRoutes = [
    AppRoutes.calendar,
    AppRoutes.availability,
    AppRoutes.absence,
    AppRoutes.timesheet,
  ];

  static const _destinations = [
    _NavItem(
      icon: Icon(Icons.calendar_month_outlined),
      selectedIcon: Icon(Icons.calendar_month_rounded),
      label: 'Kalender',
    ),
    _NavItem(
      icon: Icon(Icons.event_available_outlined),
      selectedIcon: Icon(Icons.event_available_rounded),
      label: 'Beschikbaar',
    ),
    _NavItem(
      icon: Icon(Icons.beach_access_outlined),
      selectedIcon: Icon(Icons.beach_access_rounded),
      label: 'Verlof',
    ),
    _NavItem(
      icon: Icon(Icons.access_time_outlined),
      selectedIcon: Icon(Icons.access_time_filled_rounded),
      label: 'Uren',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final tabIndex = _tabRoutes.indexWhere((r) => location.startsWith(r));
    final showNav = tabIndex >= 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: showNav
          ? NavigationBar(
              selectedIndex: tabIndex,
              onDestinationSelected: (i) => context.go(_tabRoutes[i]),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              destinations: _destinations
                  .map(
                    (d) => NavigationDestination(
                      icon: d.icon,
                      selectedIcon: d.selectedIcon,
                      label: d.label,
                    ),
                  )
                  .toList(),
            )
          : null,
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final Widget icon;
  final Widget selectedIcon;
  final String label;
}
