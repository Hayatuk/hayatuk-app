import 'package:flutter/material.dart';
import 'package:hayatuk/core/blood/blood_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/core/config/app_config.dart';
import 'package:hayatuk/core/fcm/fcm_service.dart';
import 'package:hayatuk/core/locale/locale_provider.dart';
import 'package:hayatuk/core/utils/date_format.dart';
import 'package:hayatuk/features/auth/data/models/user.dart';
import 'package:hayatuk/features/auth/presentation/auth_providers.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final user = ref.watch(userControllerProvider).user;

    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 24),
            _ProfileHeader(
              name: user.name,
              email: user.email,
              bloodType: user.bloodType,
              region: user.region,
            ),
            const SizedBox(height: 24),
            _DonorToggle(user: user),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: Text(l10n.editProfile),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/profile/edit'),
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: Text(l10n.changePassword),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/profile/password'),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(l10n.language),
              subtitle: Text(_languageLabel(ref.watch(localeProvider), l10n)),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _showLanguagePicker(context, ref),
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: Text(l10n.contactSupport),
              subtitle: const Text('WhatsApp'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => launchUrl(
                Uri.parse(AppConfig.supportWhatsAppUrl),
                mode: LaunchMode.externalApplication,
              ),
            ),
            const Divider(height: 32),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(l10n.logout),
              onTap: () => _confirmLogout(l10n, context, ref),
            ),
            ListTile(
              leading: Icon(
                Icons.delete_forever,
                color: Theme.of(context).colorScheme.error,
              ),
              title: Text(
                l10n.deleteAccount,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
              onTap: () => _confirmDelete(l10n, context, ref),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmLogout(
    AppLocalizations l10n,
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.logoutConfirmTitle),
        content: Text(l10n.logoutConfirmContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.logout),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(authControllerProvider.notifier).logout();
    }
  }

  Future<void> _confirmDelete(
    AppLocalizations l10n,
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.deleteAccountConfirmTitle),
        content: Text(l10n.deleteAccountConfirmContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(userControllerProvider.notifier).deleteAccount();
      await ref.read(authControllerProvider.notifier).logout();
    }
  }

  String _languageLabel(Locale? locale, AppLocalizations l10n) {
    if (locale == null) return l10n.systemDefault;
    return switch (locale.languageCode) {
      'en' => 'English',
      'fr' => 'Français',
      'ar' => 'العربية',
      _ => locale.languageCode,
    };
  }

  Future<void> _showLanguagePicker(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final current = ref.read(localeProvider);

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => SimpleDialog(
        title: Text(l10n.language),
        children: [
          _langOption(
            dialogContext,
            ref,
            'English',
            const Locale('en'),
            current,
          ),
          _langOption(
            dialogContext,
            ref,
            'Français',
            const Locale('fr'),
            current,
          ),
          _langOption(
            dialogContext,
            ref,
            'العربية',
            const Locale('ar'),
            current,
          ),
        ],
      ),
    );
  }

  SimpleDialogOption _langOption(
    BuildContext dialogContext,
    WidgetRef ref,
    String label,
    Locale? value,
    Locale? current,
  ) {
    return SimpleDialogOption(
      onPressed: () {
        ref.read(localeProvider.notifier).setLocale(value);
        ref
            .read(userControllerProvider.notifier)
            .updateLang(value!.languageCode);
        Navigator.pop(dialogContext);
      },
      child: Row(
        children: [
          Text(label),
          const Spacer(),
          if (value?.languageCode == current?.languageCode)
            const Icon(Icons.check),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String bloodType;
  final String? region;

  const _ProfileHeader({
    required this.name,
    required this.email,
    required this.bloodType,
    this.region,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            bloodTypeLabel(bloodType),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(name, style: Theme.of(context).textTheme.headlineSmall),
        if (region != null && region!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            region!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
        const SizedBox(height: 4),
        Text(
          email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _DonorToggle extends ConsumerWidget {
  final User user;

  const _DonorToggle({required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final onCooldown = _isOnCooldown(user.cooldownUntil);
    final cooldownEnd = _cooldownEnd(user.cooldownUntil);

    return Column(
      children: [
        if (onCooldown && cooldownEnd != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.schedule,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.onCooldownTitle,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          l10n.availableAgainOn(
                            formatDate(context, cooldownEnd),
                          ),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        SwitchListTile(
          title: Text(l10n.availableToDonate),
          subtitle: Text(
            user.isDonorActive ? l10n.mayReceiveRequests : l10n.wontBeNotified,
          ),
          value: user.isDonorActive,
          onChanged: (v) async {
            if (v && !await ref.read(fcmServiceProvider).ensureEnabled()) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.notificationsRequiredForDonor)),
              );
              return;
            }
            await ref
                .read(userControllerProvider.notifier)
                .toggleDonorStatus(v);
          },
        ),
      ],
    );
  }

  bool _isOnCooldown(DateTime? cooldownUntil) {
    if (cooldownUntil == null) return false;
    return cooldownUntil.isAfter(DateTime.now());
  }

  DateTime? _cooldownEnd(DateTime? cooldownUntil) {
    if (cooldownUntil == null || cooldownUntil.isBefore(DateTime.now())) {
      return null;
    }
    return cooldownUntil;
  }
}
