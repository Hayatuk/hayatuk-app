class ValidationException implements Exception {
  final Map<String, String> errors;

  ValidationException(this.errors);

  @override
  String toString() => 'ValidationException(${errors.toString()})';
}

class UnauthorizedException implements Exception {
  @override
  String toString() => 'UnauthorizedException';
}
