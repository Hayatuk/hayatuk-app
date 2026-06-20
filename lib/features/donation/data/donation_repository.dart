import 'package:dio/dio.dart';
import 'package:hayatuk/core/api/api_client.dart';
import 'package:hayatuk/core/api/api_error_handler.dart';
import 'package:hayatuk/features/donation/data/models/donation.dart';

class DonationRepository {
  final ApiClient _api;

  DonationRepository({required ApiClient api}) : _api = api;

  Future<Donation> recordDonation(String requestId) async {
    try {
      final response = await _api.dio.post(
        '/donations',
        data: {'request_id': requestId},
      );
      return Donation.fromJson(response.data);
    } on DioException catch (e) {
      throw handleApiError(e);
    }
  }
}
