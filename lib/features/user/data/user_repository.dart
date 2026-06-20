import 'package:dio/dio.dart';
import 'package:hayatuk/core/api/api_client.dart';
import 'package:hayatuk/core/api/api_error_handler.dart';
import 'package:hayatuk/features/auth/data/models/user.dart';

class UserRepository {
  final ApiClient _api;

  UserRepository({required ApiClient api}) : _api = api;

  Future<User> getMe() async {
    try {
      final response = await _api.dio.get('/users/me');
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<User> updateProfile({
    required String name,
    String? region,
    required String bloodType,
    String? phone,
  }) async {
    try {
      final response = await _api.dio.put(
        '/users/me',
        data: {
          'name': name,
          'region': region,
          'blood_type': bloodType,
          'phone': phone,
        },
      );
      return User.fromJson(response.data);
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> deleteAccount() async {
    try {
      await _api.dio.delete('/users/me');
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<bool> toggleDonorStatus(bool active) async {
    try {
      final response = await _api.dio.put(
        '/users/me/donor-status',
        data: {'is_donor_active': active},
      );
      return response.data['is_donor_active'] as bool;
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> updateFcmToken(String token) async {
    try {
      await _api.dio.put('/users/me/fcm-token', data: {'fcm_token': token});
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> clearFcmToken() async {
    try {
      await _api.dio.put('/users/me/fcm-token', data: {'fcm_token': null});
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> updateLocation({
    required double lat,
    required double lng,
  }) async {
    try {
      await _api.dio.put('/users/me/location', data: {'lat': lat, 'lng': lng});
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _api.dio.put(
        '/users/me/password',
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }
}
