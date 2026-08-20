class AppConfig {
  static const apiUrl = String.fromEnvironment('API_URL');
  static const env = String.fromEnvironment('ENV');

  static void assertValid() {
    if (env != 'dev' && env != 'prod') {
      throw StateError(
        "ENV must be 'dev' or 'prod'. Build with --dart-define=ENV=...",
      );
    }
    if (apiUrl.isEmpty) {
      throw StateError('API_URL not set. Build with --dart-define=API_URL=...');
    }
  }

  /// GPS coordinates are rounded to this grid before sending to the server.
  /// 0.01 degrees ≈ 1km at our latitude.
  static const locationFuzzDegrees = 0.01;

  /// WhatsApp username link for contacting support.
  static const supportWhatsAppUrl = 'https://wa.me/qr/DYXM5VBMV2WQJ1';
}
