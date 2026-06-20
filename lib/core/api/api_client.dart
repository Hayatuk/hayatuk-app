import 'package:dio/dio.dart';
import 'package:hayatuk/core/config/app_config.dart';

import '../storage/secure_storage.dart';

class ApiClient {
  late final Dio dio;
  final SecureStorage _storage;

  /// Callback to refresh the access token. Set after auth repository is constructed.
  Future<String?> Function()? _onRefreshToken;

  /// Callback when refresh fails (user must re-login).
  void Function()? _onLogout;

  ApiClient({required SecureStorage storage}) : _storage = storage {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (e, handler) async {
          final response = e.response;
          final skip = e.requestOptions.extra['skipAuthRefresh'] == true;

          if (response?.statusCode == 401 && !skip && _onRefreshToken != null) {
            final newToken = await _onRefreshToken!();
            if (newToken != null) {
              // Retry the original request with the new token
              final original = e.requestOptions;
              original.headers['Authorization'] = 'Bearer $newToken';
              try {
                final retried = await dio.fetch(original);
                return handler.resolve(retried);
              } catch (retryErr) {
                return handler.next(retryErr is DioException ? retryErr : e);
              }
            } else {
              // Refresh failed → user must re-login
              _onLogout?.call();
            }
          }

          handler.next(e);
        },
      ),
    );
  }

  void setAuthCallbacks({
    required Future<String?> Function() onRefreshToken,
    required void Function() onLogout,
  }) {
    _onRefreshToken = onRefreshToken;
    _onLogout = onLogout;
  }
}
