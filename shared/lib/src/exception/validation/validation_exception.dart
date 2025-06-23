import '../base/app_exception.dart';

enum ValidationExceptionKind {
  emptyEmail,
  invalidEmail,
  invalidPassword,
  invalidUserName,
  invalidPhoneNumber,
  invalidDateTime,
  passwordsAreNotMatch,
}

class ValidationException extends AppException {
  const ValidationException({required this.kind, this.message})
    : super(AppExceptionType.validation);

  final ValidationExceptionKind kind;
  final String? message;

  @override
  String toString() => 'ValidationException(kind: $kind, message: $message)';
}
