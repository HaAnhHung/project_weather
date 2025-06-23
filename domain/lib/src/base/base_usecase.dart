import 'package:shared/shared.dart';
import 'base_input.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> with LogMixin {
  const BaseUseCase();

  Output buildUseCase(Input input);
}
