import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api/api_client.dart';
import '../../shared/theme/app_theme.dart';
import '../login/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final accessRights = ref.watch(accessRightsProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiel'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: colorScheme.primaryContainer,
                    child: Icon(
                      Icons.person,
                      size: 32,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authState.maybeWhen(
                            authenticated: (session, _) =>
                                session.tenantIdentity,
                            orElse: () => 'Gebruiker',
                          ),
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          authState.maybeWhen(
                            authenticated: (session, _) =>
                                'Client ID: ${session.clientId}',
                            orElse: () => '',
                          ),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const _SectionHeader(title: 'Functionaliteiten'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: authState.maybeWhen(
              authenticated: (_, __) {
                final features = <String, bool>{
                  'Verlof aanvragen': accessRights.featureRequestAbsenceEnabled,
                  'Beschikbaarheid': accessRights.featureRequestAvailabilityEnabled,
                  'Marktplaats': accessRights.featureMarketplaceEnabled,
                  'Uren': accessRights.featureTimesheetsEnabled,
                  'QR Badge': accessRights.featureQrCodeEnabled,
                  'Geofencing': accessRights.featureGeofencingEnabled,
                  'Bevestiging': accessRights.featureConfirmationEnabled,
                };
                return Column(
                  children: features.entries.map((e) {
                    final isActive = e.value;
                    return ListTile(
                      dense: true,
                      title: Text(e.key),
                      trailing: Icon(
                        isActive
                            ? Icons.check_circle
                            : Icons.remove_circle_outline,
                        color: isActive
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                        size: 20,
                      ),
                    );
                  }).toList(),
                );
              },
              orElse: () => const SizedBox(
                height: 64,
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (accessRights.featureQrCodeEnabled) ...[
            const _SectionHeader(title: 'QR Badge'),
            const SizedBox(height: AppSpacing.sm),
            const _QrBadgeCard(),
            const SizedBox(height: AppSpacing.lg),
          ],
          const _SectionHeader(title: 'Account'),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: ListTile(
              leading: Icon(Icons.logout, color: colorScheme.error),
              title: Text(
                'Uitloggen',
                style: TextStyle(color: colorScheme.error),
              ),
              onTap: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Uitloggen'),
                    content: const Text(
                        'Weet je zeker dat je wilt uitloggen?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: const Text('Annuleren'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: const Text('Uitloggen'),
                      ),
                    ],
                  ),
                );
                if (confirmed == true) {
                  await ref
                      .read(authNotifierProvider.notifier)
                      .logout();
                }
              },
            ),
          ),
          const SizedBox(height: AppSpacing.xxl),
          Center(
            child: Text(
              'Planbition v1.0.0',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}

class _QrBadgeCard extends ConsumerStatefulWidget {
  const _QrBadgeCard();

  @override
  ConsumerState<_QrBadgeCard> createState() => _QrBadgeCardState();
}

class _QrBadgeCardState extends ConsumerState<_QrBadgeCard> {
  bool _loading = false;
  String? _qrData;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadQr();
  }

  Future<void> _loadQr() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final dio = ref.read(dioProvider);
      final response = await dio.get<dynamic>('/Qr/badge');
      setState(() => _qrData = response.data?.toString());
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: _loading
            ? const SizedBox(
                height: 120,
                child: Center(child: CircularProgressIndicator()),
              )
            : _error != null
                ? Column(
                    children: [
                      Icon(Icons.error_outline,
                          color: colorScheme.error, size: 40),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        _error!,
                        style: TextStyle(color: colorScheme.error),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      TextButton(
                        onPressed: _loadQr,
                        child: const Text('Opnieuw proberen'),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          border: Border.all(
                              color: colorScheme.outline, width: 1),
                        ),
                        child: Center(
                          child: _qrData != null
                              ? const Icon(Icons.qr_code,
                                  size: 140, color: Colors.black87)
                              : const Text('Geen QR data'),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Toon deze QR code bij de receptie',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
    );
  }
}