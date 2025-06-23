mixin LogMixin {
  void logD(String message, {String? name}) {
    print('[${name ?? runtimeType}] DEBUG: $message');
  }

  void logE(String message, {String? name}) {
    print('[${name ?? runtimeType}] ERROR: $message');
  }

  void logI(String message, {String? name}) {
    print('[${name ?? runtimeType}] INFO: $message');
  }

  void logW(String message, {String? name}) {
    print('[${name ?? runtimeType}] WARNING: $message');
  }
}
