import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';
import 'package:domain/domain.dart';

part 'common_state.freezed.dart';

@freezed
class CommonState extends BaseBlocState with _$CommonState {
  const factory CommonState({
    @Default(false) bool isLoading,
    @Default(0) int loadingCount,
    AppExceptionWrapper? appExceptionWrapper,
  }) = _CommonState;
}
