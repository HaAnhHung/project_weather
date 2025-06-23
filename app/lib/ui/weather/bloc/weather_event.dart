import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'weather_event.freezed.dart';

@freezed
class WeatherEvent extends BaseBlocEvent with _$WeatherEvent {
  const factory WeatherEvent.started() = WeatherStarted;
  const factory WeatherEvent.fetchCurrent({
    required double lat,
    required double lon,
  }) = WeatherFetchCurrent;
  const factory WeatherEvent.fetchByCity({required String city}) =
      WeatherFetchByCity;
  const factory WeatherEvent.unitChanged({required bool isCelsius}) =
      WeatherUnitChanged;
  const factory WeatherEvent.refresh() = WeatherRefresh;

  // Forecast events
  const factory WeatherEvent.fetchForecast({required String city}) =
      WeatherFetchForecast;
  const factory WeatherEvent.fetchForecastByLatLon({
    required double lat,
    required double lon,
  }) = WeatherFetchForecastByLatLon;
}
