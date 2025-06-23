// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherModelImpl _$$WeatherModelImplFromJson(Map<String, dynamic> json) =>
    _$WeatherModelImpl(
      city: json['city_name'] as String,
      temperature: (json['temp'] as num).toInt(),
      description: json['weather'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$WeatherModelImplToJson(_$WeatherModelImpl instance) =>
    <String, dynamic>{
      'city_name': instance.city,
      'temp': instance.temperature,
      'weather': instance.description,
      'date': instance.date,
    };
