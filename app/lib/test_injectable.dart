import 'package:injectable/injectable.dart';

@Injectable()
class TestService {
  void doSomething() {
    // Test service logic here
  }
}

@LazySingleton()
class TestRepository {
  final TestService _testService;

  TestRepository(this._testService);

  void test() {
    _testService.doSomething();
  }
}
