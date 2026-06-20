import 'package:dio/dio.dart';
import 'package:hayatuk/core/api/api_client.dart';
import 'package:hayatuk/core/api/api_error_handler.dart';
import 'package:hayatuk/core/storage/secure_storage.dart';
import 'package:hayatuk/features/auth/data/models/auth_request.dart';
import 'package:hayatuk/features/auth/data/models/auth_response.dart';

class AuthRepository {
  final ApiClient _api;
  final SecureStorage _storage;

  AuthRepository({required ApiClient api, required SecureStorage storage})
    : _api = api,
      _storage = storage;

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await _api.dio.post(
        '/auth/register',
        data: request.toJson(),
      );
      final auth = AuthResponse.fromJson(response.data);
      await _storage.saveToken(auth.accessToken);
      await _storage.saveRefreshToken(auth.refreshToken);
      await _storage.saveUser(auth.user.toJson());
      return auth;
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final response = await _api.dio.post(
        '/auth/login',
        data: request.toJson(),
      );
      final auth = AuthResponse.fromJson(response.data);
      await _storage.saveToken(auth.accessToken);
      await _storage.saveRefreshToken(auth.refreshToken);
      await _storage.saveUser(auth.user.toJson());
      return auth;
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> logout() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken != null) {
      try {
        await _api.dio.post(
          '/auth/logout',
          data: {'refresh_token': refreshToken},
        );
      } catch (_) {
        // Best-effort; clear local even if server unreachable
      }
    }
    await _storage.clearAll();
  }

  /// Refresh the access token. Returns the new access token, or null on failure.
  Future<String?> refreshAccessToken() async {
    final refreshToken = await _storage.getRefreshToken();
    if (refreshToken == null) return null;

    try {
      final response = await _api.dio.post(
        '/auth/refresh',
        data: {'refresh_token': refreshToken},
        options: Options(extra: {'skipAuthRefresh': true}),
      );
      final newAccess = response.data['access_token'] as String;
      await _storage.saveToken(newAccess);
      return newAccess;
    } catch (_) {
      return null;
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _api.dio.post('/auth/forgot-password', data: {'email': email});
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> resetPassword(String code, String newPassword) async {
    try {
      await _api.dio.post(
        '/auth/reset-password',
        data: {'code': code, 'new_password': newPassword},
      );
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }
}
