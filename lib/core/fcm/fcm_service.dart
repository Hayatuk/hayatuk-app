import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/core/permissions/permission_gate.dart';
import 'package:hayatuk/core/router/app_router.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';
import 'package:hayatuk/l10n/generated/app_localizations.dart';
import 'package:hayatuk/main.dart';

class FcmService {
  final Ref ref;

  bool _initialized = false;
  StreamSubscription<String>? _onTokenRefreshSub;
  StreamSubscription<RemoteMessage>? _onMessageSub;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSub;

  FcmService(this.ref);

  Future<void> initialize() async {
    if (_initialized) return;
    _initialized = true;

    final messaging = FirebaseMessaging.instance;
    final result = await PermissionGate.serialize(() async {
      final before = await messaging.getNotificationSettings();
      final after = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      return (before: before, after: after);
    });

    final userController = ref.read(userControllerProvider.notifier);

    if (!_isGranted(result.after.authorizationStatus)) {
      _initialized = false;
      await userController.disableDonorStatusIfActive();
      return;
    }

    // Get the token and send to backend
    final token = await messaging.getToken();
    if (token != null) {
      userController.updateFcmToken(token);
    }

    // Listen for token refresh
    _onTokenRefreshSub = messaging.onTokenRefresh.listen((newToken) {
      ref.read(userControllerProvider.notifier).updateFcmToken(newToken);
    });

    // Foreground messages — app is open
    _onMessageSub = FirebaseMessaging.onMessage.listen(
      _handleForegroundMessage,
    );

    // App opened from a notification tap (was in background)
    _onMessageOpenedAppSub = FirebaseMessaging.onMessageOpenedApp.listen(
      _handleNotificationTap,
    );

    // App was launched by tapping a notification (was killed)
    final initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      // Defer until after the first frame so the router is ready
      Future.delayed(
        Duration.zero,
        () => _handleNotificationTap(initialMessage),
      );
    }
  }

  Future<bool> ensureEnabled() async {
    final messaging = FirebaseMessaging.instance;
    final settings = await PermissionGate.serialize(() async {
      final current = await messaging.getNotificationSettings();
      if (current.authorizationStatus != AuthorizationStatus.notDetermined) {
        return current;
      }
      return messaging.requestPermission(alert: true, badge: true, sound: true);
    });

    if (!_isGranted(settings.authorizationStatus)) return false;

    await initialize();
    return _initialized;
  }

  bool _isGranted(AuthorizationStatus status) {
    return status == AuthorizationStatus.authorized ||
        status == AuthorizationStatus.provisional;
  }

  Future<void> dispose() async {
    await _onTokenRefreshSub?.cancel();
    await _onMessageSub?.cancel();
    await _onMessageOpenedAppSub?.cancel();
    _onTokenRefreshSub = null;
    _onMessageSub = null;
    _onMessageOpenedAppSub = null;
    _initialized = false;
  }

  void _handleForegroundMessage(RemoteMessage message) {
    final messenger = scaffoldMessengerKey.currentState;
    if (messenger == null) return;

    final l10n = AppLocalizations.of(messenger.context)!;
    final requestId = message.data['request_id'];
    final title = message.notification?.title ?? l10n.newBloodRequest;
    final body = message.notification?.body ?? '';

    messenger.showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (body.isNotEmpty) Text(body),
          ],
        ),
        action: requestId != null
            ? SnackBarAction(
                label: l10n.view,
                onPressed: () {
                  ref.read(routerProvider).push('/requests/$requestId/detail');
                },
              )
            : null,
        duration: const Duration(seconds: 8),
      ),
    );
  }

  void _handleNotificationTap(RemoteMessage message) {
    final requestId = message.data['request_id'];
    if (requestId == null) return;
    ref.read(routerProvider).push('/requests/$requestId/detail');
  }
}

final fcmServiceProvider = Provider<FcmService>((ref) {
  return FcmService(ref);
});
