import 'package:freezed_annotation/freezed_annotation.dart';
import 'weather_entity.dart';

part 'daily_forecast_entity.freezed.dart';
part 'daily_forecast_entity.g.dart';

@freezed
class DailyForecastEntity with _$DailyForecastEntity {
  const factory DailyForecastEntity({
    required DateTime date,
    required List<WeatherEntity> hourlyForecasts,
  }) = _DailyForecastEntity;

  factory DailyForecastEntity.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastEntityFromJson(json);
}
