import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';

String statusLabel(AppLocalizations l10n, String status) {
  return switch (status) {
    'searching' => l10n.statusSearching,
    'in_progress' => l10n.statusInProgress,
    'fulfilled' => l10n.statusFulfilled,
    'cancelled' => l10n.statusCancelled,
    'unfulfilled' => l10n.statusUnfulfilled,
    _ => status,
  };
}

Color statusColor(BuildContext context, String status) {
  return switch (status) {
    'searching' => Colors.orange,
    'in_progress' => Colors.blue,
    'fulfilled' => Colors.green,
    'cancelled' => Colors.grey,
    'unfulfilled' => Colors.grey,
    _ => Theme.of(context).colorScheme.primary,
  };
}
