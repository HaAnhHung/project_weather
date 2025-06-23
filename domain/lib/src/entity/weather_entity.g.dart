// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherEntityImpl _$$WeatherEntityImplFromJson(Map<String, dynamic> json) =>
    _$WeatherEntityImpl(
      city: json['city'] as String,
      temperature: (json['temperature'] as num).toInt(),
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$WeatherEntityImplToJson(_$WeatherEntityImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'temperature': instance.temperature,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
    };
