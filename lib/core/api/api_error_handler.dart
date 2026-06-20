import 'package:dio/dio.dart';
import 'package:hayatuk/core/api/api_exceptions.dart';

Exception handleApiError(DioException e) {
  final response = e.response;
  if (response == null) {
    return Exception('Network error. Check your connection.');
  }

  final data = response.data;
  final message = data is Map<String, dynamic>
      ? (data['error'] as String? ?? 'Something went wrong')
      : 'Something went wrong';

  return switch (response.statusCode) {
    400 => Exception(message),
    401 => UnauthorizedException(),
    404 => Exception(message),
    409 => Exception(message),
    422 => ValidationException(_parseValidationErrors(data)),
    _ => Exception(message),
  };
}

Map<String, String> _parseValidationErrors(dynamic data) {
  if (data is! Map<String, dynamic>) return {};
  final details = data['details'];
  if (details is! Map<String, dynamic>) return {};
  return details.map((k, v) => MapEntry(k, v.toString()));
}
