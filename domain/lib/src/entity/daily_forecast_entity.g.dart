// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyForecastEntityImpl _$$DailyForecastEntityImplFromJson(
  Map<String, dynamic> json,
) => _$DailyForecastEntityImpl(
  date: DateTime.parse(json['date'] as String),
  hourlyForecasts:
      (json['hourlyForecasts'] as List<dynamic>)
          .map((e) => WeatherEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$DailyForecastEntityImplToJson(
  _$DailyForecastEntityImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'hourlyForecasts': instance.hourlyForecasts,
};
