import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/core/permissions/permission_gate.dart';
import 'package:hayatuk/core/router/app_router.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';
import 'package:hayatuk/main.dart';

class FcmService {
  final Ref ref;

  FcmService(this.ref);

  Future<void> initialize() async {
    final messaging = FirebaseMessaging.instance;
    final settings = await PermissionGate.serialize(
      () => messaging.requestPermission(alert: true, badge: true, sound: true),
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }

    // Get the token and send to backend
    final token = await messaging.getToken();
    if (token != null) {
      ref.read(userControllerProvider.notifier).updateFcmToken(token);
    }

    // Listen for token refresh
    messaging.onTokenRefresh.listen((newToken) {
      ref.read(userControllerProvider.notifier).updateFcmToken(newToken);
    });

    // Foreground messages — app is open
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // App opened from a notification tap (was in background)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

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

  void _handleForegroundMessage(RemoteMessage message) {
    final requestId = message.data['request_id'];
    final title = message.notification?.title ?? 'New blood request';
    final body = message.notification?.body ?? '';

    scaffoldMessengerKey.currentState?.showSnackBar(
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
                label: 'View',
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
