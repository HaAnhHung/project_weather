import 'dart:developer';

abstract class BaseUseCase<Input, Output> {
  const BaseUseCase();

  Output call(Input input);
}

abstract class BaseFutureUseCase<Input, Output>
    extends BaseUseCase<Input, Future<Output>> {
  const BaseFutureUseCase();

  @override
  Future<Output> call(Input input) async {
    try {
      log('FutureUseCase Input: $input');
      final output = await buildUseCase(input);
      log('FutureUseCase Output: $output');
      return output;
    } catch (e) {
      log('FutureUseCase Error: $e', error: e);
      throw e;
    }
  }

  Future<Output> buildUseCase(Input input);
}

abstract class BaseSyncUseCase<Input, Output>
    extends BaseUseCase<Input, Output> {
  const BaseSyncUseCase();

  @override
  Output call(Input input) {
    try {
      log('SyncUseCase Input: $input');
      final output = buildUseCase(input);
      log('SyncUseCase Output: $output');
      return output;
    } catch (e) {
      log('SyncUseCase Error: $e', error: e);
      throw e;
    }
  }

  Output buildUseCase(Input input);
}
