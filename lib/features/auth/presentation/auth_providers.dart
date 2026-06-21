import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hayatuk/core/api/api_client.dart';
import 'package:hayatuk/core/api/api_exceptions.dart';
import 'package:hayatuk/core/fcm/fcm_service.dart';
import 'package:hayatuk/core/storage/secure_storage.dart';
import 'package:hayatuk/features/auth/data/auth_repository.dart';
import 'package:hayatuk/features/auth/data/models/auth_request.dart';
import 'package:hayatuk/features/auth/data/models/user.dart';
import 'package:hayatuk/features/user/presentation/user_providers.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return ApiClient(storage: storage);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    api: ref.watch(apiClientProvider),
    storage: ref.watch(secureStorageProvider),
  );
});

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? error;
  final Map<String, String>? fieldErrors;
  final bool isInitialized;

  const AuthState({
    this.isAuthenticated = false,
    this.isLoading = false,
    this.error,
    this.fieldErrors,
    this.isInitialized = false,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? error,
    Map<String, String>? fieldErrors,
    bool? isInitialized,
    bool clearError = false,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      fieldErrors: clearError ? null : (fieldErrors ?? this.fieldErrors),
      isInitialized: isInitialized ?? this.isInitialized,
    );
  }
}

class AuthController extends Notifier<AuthState> {
  late AuthRepository _repository;

  @override
  AuthState build() {
    _repository = ref.watch(authRepositoryProvider);
    final apiClient = ref.watch(apiClientProvider);

    // Retry 401
    apiClient.setAuthCallbacks(
      onRefreshToken: () => _repository.refreshAccessToken(),
      onLogout: () {
        // Clear local state + storage
        _repository.logout();
        ref.read(userControllerProvider.notifier).clearUser();
        state = state.copyWith(isAuthenticated: false, isInitialized: true);
      },
    );

    return const AuthState();
  }

  Future<void> login({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final auth = await _repository.login(
        LoginRequest(email: email, password: password),
      );
      ref.read(userControllerProvider.notifier).setUser(auth.user);
      state = state.copyWith(isAuthenticated: true, isLoading: false);
      ref.read(fcmServiceProvider).initialize();
    } on ValidationException catch (e) {
      state = state.copyWith(isLoading: false, fieldErrors: e.errors);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String bloodType,
    required String lang,
    String? phone,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final auth = await _repository.register(
        RegisterRequest(
          email: email,
          password: password,
          name: name,
          bloodType: bloodType,
          lang: lang,
          phone: phone,
        ),
      );
      ref.read(userControllerProvider.notifier).setUser(auth.user);
      state = state.copyWith(isAuthenticated: true, isLoading: false);
      ref.read(fcmServiceProvider).initialize();
    } on ValidationException catch (e) {
      state = state.copyWith(isLoading: false, fieldErrors: e.errors);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> logout() async {
    await ref.read(userControllerProvider.notifier).clearFcmToken();
    await ref.read(fcmServiceProvider).dispose();
    await _repository.logout();
    ref.read(userControllerProvider.notifier).clearUser();
    state = state.copyWith(isAuthenticated: false, clearError: true);
  }

  Future<void> restoreSession() async {
    final storage = ref.read(secureStorageProvider);
    final accessToken = await storage.getToken();
    final refreshToken = await storage.getRefreshToken();

    if (accessToken == null && refreshToken == null) {
      state = state.copyWith(isInitialized: true);
      return;
    }

    // Load cached user immediately for fast UI
    final cachedUserJson = await storage.getUser();
    if (cachedUserJson != null) {
      ref
          .read(userControllerProvider.notifier)
          .setUser(User.fromJson(cachedUserJson));
    }
    state = state.copyWith(isInitialized: true, isAuthenticated: true);

    ref.read(fcmServiceProvider).initialize();

    // Refresh user from server in background
    _refreshUserFromServer();
  }

  Future<void> _refreshUserFromServer() async {
    try {
      final user = await ref.read(userRepositoryProvider).getMe();
      await ref.read(secureStorageProvider).saveUser(user.toJson());
      ref.read(userControllerProvider.notifier).setUser(user);
    } on UnauthorizedException {
      await ref.read(secureStorageProvider).clearAll();
      ref.read(userControllerProvider.notifier).clearUser();
      state = state.copyWith(isAuthenticated: false);
    } catch (_) {
      // Network error — keep cached user
    }
  }

  Future<bool> forgotPassword(String email) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _repository.forgotPassword(email);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> resetPassword(String code, String newPassword) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      await _repository.resetPassword(code, newPassword);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);
