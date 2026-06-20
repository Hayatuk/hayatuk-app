import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hayatuk/core/widgets/scaffold_with_nav.dart';
import 'package:hayatuk/features/auth/presentation/auth_providers.dart';
import 'package:hayatuk/features/auth/presentation/forgot_password_screen.dart';
import 'package:hayatuk/features/auth/presentation/login_screen.dart';
import 'package:hayatuk/features/auth/presentation/register_screen.dart';
import 'package:hayatuk/features/auth/presentation/reset_password_screen.dart';
import 'package:hayatuk/features/auth/presentation/splash_screen.dart';
import 'package:hayatuk/features/home/presentation/home_screen.dart';
import 'package:hayatuk/features/donation/presentation/donations_screen.dart';
import 'package:hayatuk/features/request/presentation/create_request_screen.dart';
import 'package:hayatuk/features/request/presentation/request_detail_screen.dart';
import 'package:hayatuk/features/request/presentation/requests_screen.dart';
import 'package:hayatuk/features/user/presentation/change_password_screen.dart';
import 'package:hayatuk/features/user/presentation/edit_profile_screen.dart';
import 'package:hayatuk/features/user/presentation/profile_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: _AuthListenable(ref),
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);

      if (!auth.isInitialized) {
        return state.uri.path == '/splash' ? null : '/splash';
      }

      if (state.uri.path == '/splash') {
        return auth.isAuthenticated ? '/home' : '/login';
      }

      final isAuthenticated = auth.isAuthenticated;
      final isAuthRoute =
          state.uri.path == '/login' ||
          state.uri.path == '/register' ||
          state.uri.path == '/forgot-password' ||
          state.uri.path == '/reset-password';

      if (!isAuthenticated && !isAuthRoute) return '/login';
      if (isAuthenticated && isAuthRoute) return '/home';

      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, _) => const SplashScreen()),
      GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, _) => const RegisterScreen()),
      GoRoute(
        path: '/requests/:id/detail',
        builder: (_, state) =>
            RequestDetailScreen(requestId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (_, _) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/reset-password',
        builder: (_, state) =>
            ResetPasswordScreen(email: state.extra as String?),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) =>
            ScaffoldWithNav(navigationShell: shell),
        branches: [
          // Home tab
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (_, _) => const HomeScreen()),
            ],
          ),

          // Requests tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/requests',
                builder: (_, _) => const RequestsScreen(),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (_, _) => const CreateRequestScreen(),
                  ),
                ],
              ),
            ],
          ),
          // Donations tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/donations',
                builder: (_, _) => const DonationsScreen(),
              ),
            ],
          ),
          // Profile tab
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (_, _) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    builder: (_, _) => const EditProfileScreen(),
                  ),
                  GoRoute(
                    path: 'password',
                    builder: (_, _) => const ChangePasswordScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class _AuthListenable extends ChangeNotifier {
  _AuthListenable(this._ref) {
    _ref.listen(authControllerProvider, (_, _) => notifyListeners());
  }

  final Ref _ref;
}
