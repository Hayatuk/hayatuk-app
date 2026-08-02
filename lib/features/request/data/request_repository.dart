import 'package:dio/dio.dart';
import 'package:hayatuk/core/api/api_client.dart';
import 'package:hayatuk/core/api/api_error_handler.dart';
import 'package:hayatuk/features/request/data/models/blood_request.dart';
import 'package:hayatuk/features/request/data/models/create_request_input.dart';

import 'models/accepted_request.dart';
import 'models/nearby_request.dart';

class RequestRepository {
  final ApiClient _api;

  RequestRepository({required ApiClient api}) : _api = api;

  Future<BloodRequest> create(CreateRequestInput input) async {
    try {
      final response = await _api.dio.post('/requests', data: input.toJson());
      return BloodRequest.fromJson(response.data);
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<List<BloodRequest>> listMine() async {
    try {
      final response = await _api.dio.get('/requests/me');
      final list = response.data as List<dynamic>;
      return list
          .map((json) => BloodRequest.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> cancel(String id) async {
    try {
      await _api.dio.delete('/requests/$id');
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<List<NearbyRequest>> listNearby({
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await _api.dio.get(
        '/requests/nearby',
        queryParameters: {'lat': lat, 'lng': lng},
      );
      final list = response.data as List<dynamic>;
      return list
          .map((json) => NearbyRequest.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<BloodRequest> accept(String id) async {
    try {
      final response = await _api.dio.post('/requests/$id/accept');
      return BloodRequest.fromJson(response.data);
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<BloodRequest> getPublicById(String id) async {
    try {
      final response = await _api.dio.get('/requests/$id/public');
      return BloodRequest.fromJson(response.data);
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<List<AcceptedRequest>> listMyAcceptances() async {
    try {
      final response = await _api.dio.get('/requests/me/acceptances');
      final list = response.data as List<dynamic>;
      return list
          .map((json) => AcceptedRequest.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }

  Future<void> cancelAcceptance(String requestId) async {
    try {
      await _api.dio.delete('/requests/me/acceptances/$requestId/cancel');
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }
}
