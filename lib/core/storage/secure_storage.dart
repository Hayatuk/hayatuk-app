import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class SecureStorage {
  static const _tokenKey = 'auth_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _userKey = 'auth_user';

  final FlutterSecureStorage _storage;

  SecureStorage([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  // Access token
  Future<void> saveToken(String token) =>
      _storage.write(key: _tokenKey, value: token);
  Future<String?> getToken() => _storage.read(key: _tokenKey);
  Future<void> deleteToken() => _storage.delete(key: _tokenKey);

  // Refresh token
  Future<void> saveRefreshToken(String token) =>
      _storage.write(key: _refreshTokenKey, value: token);
  Future<String?> getRefreshToken() => _storage.read(key: _refreshTokenKey);
  Future<void> deleteRefreshToken() => _storage.delete(key: _refreshTokenKey);

  // User
  Future<void> saveUser(Map<String, dynamic> user) =>
      _storage.write(key: _userKey, value: jsonEncode(user));
  Future<Map<String, dynamic>?> getUser() async {
    final s = await _storage.read(key: _userKey);
    return s == null ? null : jsonDecode(s) as Map<String, dynamic>;
  }

  Future<void> deleteUser() => _storage.delete(key: _userKey);

  Future<void> clearAll() async {
    await Future.wait([deleteToken(), deleteRefreshToken(), deleteUser()]);
  }
}
