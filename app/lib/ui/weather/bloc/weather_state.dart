import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState extends BaseBlocState with _$WeatherState {
  const factory WeatherState.initial() = WeatherInitial;
  const factory WeatherState.loading() = WeatherLoading;
  const factory WeatherState.loaded({
    required WeatherEntity weather,
    List<WeatherEntity>? forecast,
    bool? isForecastLoading,
    String? forecastError,
  }) = WeatherLoaded;
  const factory WeatherState.error({required String message}) = WeatherError;
}
