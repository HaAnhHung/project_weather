// class LogConfig {
//   static const bool enableLogUseCaseInput = true;
//   static const bool enableLogUseCaseOutput = true;
//   static const bool enableLogUseCaseError = true;
//   static const bool logOnBlocChange = true;
//   static const bool logOnBlocCreate = true;
//   static const bool logOnBlocClose = true;
//   static const bool logOnBlocError = true;
//   static const bool logOnBlocEvent = true;
//   static const bool logOnBlocTransition = true;
// }
import 'package:flutter/foundation.dart';

class LogConfig {
  const LogConfig._();

  static const enableGeneralLog = kDebugMode;
  static const isPrettyJson = kDebugMode;

  /// bloc observer
  static const logOnBlocChange = false;
  static const logOnBlocCreate = false;
  static const logOnBlocClose = false;
  static const logOnBlocError = false;
  static const logOnBlocEvent = kDebugMode;
  static const logOnBlocTransition = false;

  /// navigator observer
  static const enableNavigatorObserverLog = kDebugMode;

  /// disposeBag
  static const enableDisposeBagLog = false;

  /// stream event log
  static const logOnStreamListen = false;
  static const logOnStreamData = false;
  static const logOnStreamError = false;
  static const logOnStreamDone = false;
  static const logOnStreamCancel = false;

  /// log interceptor
  static const enableLogInterceptor = kDebugMode;
  static const enableLogRequestInfo = kDebugMode;
  static const enableLogSuccessResponse = kDebugMode;
  static const enableLogErrorResponse = kDebugMode;

  /// enable log usecase
  static const enableLogUseCaseInput = kDebugMode;
  static const enableLogUseCaseOutput = kDebugMode;
  static const enableLogUseCaseError = kDebugMode;
}
