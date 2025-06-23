// Base use case for domain layer
abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

class NoParams {}
