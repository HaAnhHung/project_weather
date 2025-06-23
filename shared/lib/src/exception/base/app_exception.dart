enum AppExceptionType { remote, parse, uncaught, validation, remoteConfig }

abstract class AppException implements Exception {
  const AppException(this.appExceptionType);

  final AppExceptionType appExceptionType;

  @override
  String toString() => 'AppException(appExceptionType: $appExceptionType)';
}
