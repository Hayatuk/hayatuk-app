class PermissionGate {
  PermissionGate._();

  static Future<void> _tail = Future<void>.value();

  static Future<T> serialize<T>(Future<T> Function() action) {
    final result = _tail.then((_) => action());
    _tail = result.then((_) {}, onError: (_) {});
    return result;
  }
}
