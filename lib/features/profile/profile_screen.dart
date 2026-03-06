import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api/api_client.dart';
import '../../core/router/app_router.dart';
import '../../shared/theme/app_theme.dart';
import '../login/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final accessRights = ref.watch(accessRightsProvider);

    final tenantName = authState.maybeWhen(
      authenticated: (session, _) => session.tenantIdentity,
      orElse: () => 'Gebruiker',
    );
    final clientId = authState.maybeWhen(
      authenticated: (session, _) => session.clientId,
      orElse: () => '',
    );
    final initials = tenantName.isNotEmpty
        ? tenantName.substring(0, 1).toUpperCase()
        : 'G';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _ProfileHeader(onBack: () => context.go(AppRoutes.dashboard)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Avatar + name
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            initials,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(tenantName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                )),
                            if (clientId.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(clientId,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColors.textSecondary)),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                const _SectionLabel(label: 'Communicatie'),
                const SizedBox(height: 8),
                _MenuCard(items: [
                  _MenuItem(
                    icon: Icons.notifications_outlined,
                    label: 'Berichten',
                    onTap: () => context.go(AppRoutes.messages),
                  ),
                ]),

                const SizedBox(height: 16),
                const _SectionLabel(label: 'Functionaliteiten'),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    children: [
                      _FeatureTile(
                          label: 'Verlof aanvragen',
                          enabled: accessRights.featureRequestAbsenceEnabled),
                      const Divider(height: 1, color: AppColors.border),
                      _FeatureTile(
                          label: 'Beschikbaarheid',
                          enabled:
                              accessRights.featureRequestAvailabilityEnabled),
                      const Divider(height: 1, color: AppColors.border),
                      _FeatureTile(
                          label: 'Marktplaats',
                          enabled: accessRights.featureMarketplaceEnabled),
                      const Divider(height: 1, color: AppColors.border),
                      _FeatureTile(
                          label: 'Uren',
                          enabled: accessRights.featureTimesheetsEnabled),
                      const Divider(height: 1, color: AppColors.border),
                      _FeatureTile(
                          label: 'QR Badge',
                          enabled: accessRights.featureQrCodeEnabled),
                      const Divider(height: 1, color: AppColors.border),
                      _FeatureTile(
                          label: 'Diensten bevestigen',
                          enabled: accessRights.featureConfirmationEnabled),
                    ],
                  ),
                ),

                if (accessRights.featureQrCodeEnabled) ...[
                  const SizedBox(height: 16),
                  const _SectionLabel(label: 'QR Badge'),
                  const SizedBox(height: 8),
                  const _QrBadgeCard(),
                ],

                const SizedBox(height: 16),
                const _SectionLabel(label: 'Account'),
                const SizedBox(height: 8),
                _MenuCard(items: [
                  _MenuItem(
                    icon: Icons.logout_rounded,
                    label: 'Uitloggen',
                    destructive: true,
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
                ]),

                const SizedBox(height: 24),
                const Center(
                  child: Text('Planbition v1.0.0',
                      style: TextStyle(
                          fontSize: 12, color: AppColors.mutedForeground)),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.onBack});
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.paddingOf(context).top;
    return Container(
      padding: EdgeInsets.only(top: safeTop, left: 4, right: 16, bottom: 0),
      decoration: const BoxDecoration(
        color: AppColors.card,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_rounded,
                size: 22, color: AppColors.textPrimary),
            onPressed: onBack,
          ),
          const Text('Profiel',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.mutedForeground,
          letterSpacing: 0.8),
    );
  }
}

class _MenuCard extends StatelessWidget {
  const _MenuCard({required this.items});
  final List<_MenuItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) const Divider(height: 1, color: AppColors.border),
            items[i],
          ],
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.destructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final color =
        destructive ? AppColors.destructive : AppColors.textPrimary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: color)),
            ),
            const Icon(Icons.chevron_right_rounded,
                size: 18, color: AppColors.mutedForeground),
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({required this.label, required this.enabled});
  final String label;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
              child: Text(label,
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.textPrimary))),
          Icon(
            enabled
                ? Icons.check_circle_rounded
                : Icons.remove_circle_outline_rounded,
            size: 18,
            color: enabled ? AppColors.success : AppColors.mutedForeground,
          ),
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
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: _loading
          ? const SizedBox(
              height: 120,
              child: Center(child: CircularProgressIndicator()))
          : _error != null
              ? Column(
                  children: [
                    const Icon(Icons.error_outline,
                        color: AppColors.destructive, size: 40),
                    const SizedBox(height: 8),
                    Text(_error!,
                        style: const TextStyle(color: AppColors.destructive),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 8),
                    TextButton(
                        onPressed: _loadQr,
                        child: const Text('Opnieuw proberen')),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Center(
                        child: _qrData != null
                            ? const Icon(Icons.qr_code,
                                size: 140, color: Colors.black87)
                            : const Text('Geen QR data'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Toon deze QR code bij de receptie',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
    );
  }
}
