import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/router/app_router.dart';
import '../../shared/theme/app_theme.dart';
import '../../shared/widgets/loading_widget.dart';
import '../../core/models/response_wrapper.dart';
import 'auth_provider.dart';

/// The login screen where employees enter their tenant code and credentials.
///
/// Design: full-bleed gradient header, clean card-based form below.
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final isSmall = size.width < 480;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: LoadingOverlay(
        isLoading: _isLoading,
        message: 'Inloggen...',
        child: CustomScrollView(
          slivers: [
            // --- Gradient header ---
            SliverToBoxAdapter(
              child: _buildHeader(theme, size),
            ),

            // --- Login form ---
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: isSmall ? AppSpacing.md : AppSpacing.xl,
                vertical: AppSpacing.lg,
              ),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 440),
                    child: _buildForm(theme),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.tertiary,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // App icon placeholder
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: const Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Planbition',
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Jouw planning, altijd bij de hand',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(ThemeData theme) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Inloggen',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Voer je organisatiecode en inloggegevens in.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Tenant code
          _FormField(
            controller: _tenantController,
            label: 'Organisatiecode',
            hint: 'bijv. mijn-bedrijf',
            icon: Icons.business_rounded,
            validator: (v) =>
                (v?.trim().isEmpty ?? true) ? 'Vul je organisatiecode in' : null,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppSpacing.md),

          // Client ID / gebruikersnaam
          _FormField(
            controller: _clientIdController,
            label: 'Gebruikersnaam / Client ID',
            hint: 'jouw gebruikersnaam',
            icon: Icons.person_rounded,
            validator: (v) =>
                (v?.trim().isEmpty ?? true) ? 'Vul je gebruikersnaam in' : null,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSpacing.md),

          // Secret / wachtwoord
          TextFormField(
            controller: _clientSecretController,
            obscureText: _obscureSecret,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            validator: (v) =>
                (v?.isEmpty ?? true) ? 'Vul je wachtwoord in' : null,
            decoration: InputDecoration(
              labelText: 'Wachtwoord / Client Secret',
              hintText: '••••••••',
              prefixIcon: const Icon(Icons.lock_rounded),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureSecret
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () =>
                    setState(() => _obscureSecret = !_obscureSecret),
              ),
            ),
          ),

          // Error message
          if (_errorMessage != null) ...[
            const SizedBox(height: AppSpacing.md),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm + AppSpacing.xs),
              decoration: BoxDecoration(
                color: theme.colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    color: theme.colorScheme.onErrorContainer,
                    size: 20,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          const SizedBox(height: AppSpacing.lg),

          // Login button
          FilledButton(
            onPressed: _isLoading ? null : _submit,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text('Inloggen'),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          // Forgot password
          Center(
            child: TextButton(
              onPressed: () => _showForgotPasswordDialog(context),
              child: Text(
                'Wachtwoord vergeten?',
                style: TextStyle(color: theme.colorScheme.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showForgotPasswordDialog(BuildContext context) async {
    final theme = Theme.of(context);
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
            Text(
              'Voer je e-mailadres in. Je ontvangt een code om je wachtwoord te resetten.',
              style: theme.textTheme.bodyMedium,
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
              await ref
                  .read(authServiceProvider)
                  .requestPasswordReset(
                    email: email,
                    tenant: tenantValue.isNotEmpty
                        ? tenantValue
                        : _tenantController.text.trim(),
                  );
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Als dit account bestaat, ontvang je een reset-e-mail.',
                    ),
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
}

/// A reusable form field widget with consistent styling.
class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final String? Function(String?) validator;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
    );
  }
}
