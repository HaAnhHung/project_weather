import '../base/app_exception.dart';

enum RemoteExceptionKind {
  badCertificate,
  noInternet,
  network,
  serverDefined,
  serverUndefined,
  timeout,
  cancellation,
  unknown,
  refreshTokenFailed,
  decodeError,
}

class RemoteException extends AppException {
  const RemoteException({
    required this.kind,
    this.httpErrorCode,
    this.serverError,
    this.rootException,
  }) : super(AppExceptionType.remote);

  final RemoteExceptionKind kind;
  final int? httpErrorCode;
  final dynamic serverError;
  final Object? rootException;

  String? get generalServerMessage => serverError?.toString();

  @override
  String toString() {
    return '''RemoteException: {
      kind: $kind
      httpErrorCode: $httpErrorCode,
      serverError: $serverError,
      rootException: $rootException,
      generalServerMessage: $generalServerMessage,
    }''';
  }
}
