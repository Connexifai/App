import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/models/response_wrapper.dart';
import '../../core/router/app_router.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/loading_widget.dart';
import 'auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _tenantController = TextEditingController();
  final _clientIdController = TextEditingController();
  final _clientSecretController = TextEditingController();

  bool _obscureSecret = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _tenantController.dispose();
    _clientIdController.dispose();
    _clientSecretController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await ref.read(authNotifierProvider.notifier).login(
          tenantIdentity: _tenantController.text.trim(),
          clientId: _clientIdController.text.trim(),
          clientSecret: _clientSecretController.text,
        );

    if (!mounted) return;

    result.when(
      success: (_) => context.go(AppRoutes.dashboard),
      failure: (error) {
        setState(() {
          _errorMessage = error.message;
          _isLoading = false;
        });
      },
    );
  }

  Future<void> _showForgotPasswordDialog(BuildContext context) async {
    final emailController = TextEditingController();
    final tenantValue = _tenantController.text.trim();

    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Wachtwoord resetten'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Voer je e-mailadres in. Je ontvangt een code om je wachtwoord te resetten.',
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mailadres',
                prefixIcon: Icon(Icons.email_rounded),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Annuleren'),
          ),
          FilledButton(
            onPressed: () async {
              final email = emailController.text.trim();
              if (email.isEmpty) return;
              Navigator.of(ctx).pop();
              await ref.read(authServiceProvider).requestPasswordReset(
                    email: email,
                    tenant: tenantValue.isNotEmpty
                        ? tenantValue
                        : _tenantController.text.trim(),
                  );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        'Als dit account bestaat, ontvang je een reset-e-mail.'),
                  ),
                );
              }
            },
            child: const Text('Versturen'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const _DecorativeCircles(),
          LoadingOverlay(
            isLoading: _isLoading,
            message: 'Inloggen...',
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: _LoginCard(
                      formKey: _formKey,
                      tenantController: _tenantController,
                      clientIdController: _clientIdController,
                      clientSecretController: _clientSecretController,
                      obscureSecret: _obscureSecret,
                      onToggleSecret: () =>
                          setState(() => _obscureSecret = !_obscureSecret),
                      errorMessage: _errorMessage,
                      isLoading: _isLoading,
                      onSubmit: _submit,
                      onForgotPassword: () =>
                          _showForgotPasswordDialog(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Decorative circles background
// ---------------------------------------------------------------------------

class _DecorativeCircles extends StatelessWidget {
  const _DecorativeCircles();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return Stack(
          children: [
            Positioned(
              top: -h * 0.15,
              right: -w * 0.2,
              child: _Circle(size: w * 0.7),
            ),
            Positioned(
              top: -h * 0.05,
              right: -w * 0.3,
              child: _Circle(size: w * 0.5),
            ),
            Positioned(
              bottom: -h * 0.1,
              left: -w * 0.25,
              child: _Circle(size: w * 0.6),
            ),
          ],
        );
      },
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary.withValues(alpha: 0.05),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Login card
// ---------------------------------------------------------------------------

class _LoginCard extends StatelessWidget {
  const _LoginCard({
    required this.formKey,
    required this.tenantController,
    required this.clientIdController,
    required this.clientSecretController,
    required this.obscureSecret,
    required this.onToggleSecret,
    required this.errorMessage,
    required this.isLoading,
    required this.onSubmit,
    required this.onForgotPassword,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController tenantController;
  final TextEditingController clientIdController;
  final TextEditingController clientSecretController;
  final bool obscureSecret;
  final VoidCallback onToggleSecret;
  final String? errorMessage;
  final bool isLoading;
  final VoidCallback onSubmit;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo + title
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.fingerprint,
                      color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'StaffApp',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Jouw planning, altijd bij de hand',
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Divider(color: AppColors.border),
            const SizedBox(height: 20),

            const Text(
              'Inloggen',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Voer je organisatiecode en inloggegevens in.',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: tenantController,
              validator: (v) =>
                  (v?.trim().isEmpty ?? true) ? 'Vul je organisatiecode in' : null,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Organisatiecode',
                hintText: 'bijv. mijn-bedrijf',
                prefixIcon: Icon(Icons.business_rounded),
              ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: clientIdController,
              validator: (v) =>
                  (v?.trim().isEmpty ?? true) ? 'Vul je gebruikersnaam in' : null,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              decoration: const InputDecoration(
                labelText: 'Gebruikersnaam / Client ID',
                hintText: 'jouw gebruikersnaam',
                prefixIcon: Icon(Icons.person_rounded),
              ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: clientSecretController,
              obscureText: obscureSecret,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => onSubmit(),
              validator: (v) =>
                  (v?.isEmpty ?? true) ? 'Vul je wachtwoord in' : null,
              decoration: InputDecoration(
                labelText: 'Wachtwoord / Client Secret',
                hintText: '••••••••',
                prefixIcon: const Icon(Icons.lock_rounded),
                suffixIcon: IconButton(
                  icon: Icon(obscureSecret
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  onPressed: onToggleSecret,
                ),
              ),
            ),

            if (errorMessage != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.destructive.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: AppColors.destructive.withValues(alpha: 0.2)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline,
                        color: AppColors.destructive, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.destructive,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            FilledButton(
              onPressed: isLoading ? null : onSubmit,
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
              ),
              child: const Text('Inloggen'),
            ),

            const SizedBox(height: 8),

            Center(
              child: TextButton(
                onPressed: onForgotPassword,
                child: const Text(
                  'Wachtwoord vergeten?',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
