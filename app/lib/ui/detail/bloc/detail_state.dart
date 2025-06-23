import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.initial() = DetailInitial;
  const factory DetailState.loading() = DetailLoading;
  const factory DetailState.loaded({required WeatherEntity detail}) =
      DetailLoaded;
  const factory DetailState.error({required String message}) = DetailError;
}
