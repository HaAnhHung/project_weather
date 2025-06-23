import 'package:shared/shared.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    return switch (appException.appExceptionType) {
      AppExceptionType.remote => switch ((appException as RemoteException)
          .kind) {
        RemoteExceptionKind.badCertificate => 'Bad certificate error (UE-01)',
        RemoteExceptionKind.noInternet => 'No internet connection',
        RemoteExceptionKind.network => 'Cannot connect to host',
        RemoteExceptionKind.serverDefined =>
          appException.generalServerMessage ?? 'Server error (UE-02)',
        RemoteExceptionKind.serverUndefined =>
          appException.generalServerMessage ?? 'Unknown server error (UE-03)',
        RemoteExceptionKind.timeout => 'Connection timeout',
        RemoteExceptionKind.cancellation => 'Request cancelled (UE-04)',
        RemoteExceptionKind.unknown => 'Unknown error (UE-05)',
        RemoteExceptionKind.refreshTokenFailed => 'Token expired',
        RemoteExceptionKind.decodeError => 'Data format error (UE-06)',
      },
      AppExceptionType.parse => 'Data parsing error (UE-10)',
      AppExceptionType.uncaught => 'Unexpected error (UE-00)',
      AppExceptionType.validation =>
        switch ((appException as ValidationException).kind) {
          ValidationExceptionKind.emptyEmail => 'Email is required',
          ValidationExceptionKind.invalidEmail => 'Invalid email format',
          ValidationExceptionKind.invalidPassword => 'Invalid password',
          ValidationExceptionKind.invalidUserName => 'Invalid username',
          ValidationExceptionKind.invalidPhoneNumber => 'Invalid phone number',
          ValidationExceptionKind.invalidDateTime => 'Invalid date/time',
          ValidationExceptionKind.passwordsAreNotMatch =>
            'Passwords do not match',
        },
      AppExceptionType.remoteConfig => 'Configuration error (UE-100)',
    };
  }
}
