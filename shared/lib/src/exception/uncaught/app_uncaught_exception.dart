import '../base/app_exception.dart';

class AppUncaughtException extends AppException {
  const AppUncaughtException(this.rootException)
    : super(AppExceptionType.uncaught);

  final Object rootException;

  @override
  String toString() => 'AppUncaughtException(rootException: $rootException)';
}
