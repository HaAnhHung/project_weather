/// 🌐 Weather Repository Implementation - Data layer
///
/// Chức năng:
/// - Implement WeatherRepository interface từ domain layer
/// - Call OpenWeatherMap API để lấy data thời tiết theo ngôn ngữ
/// - Transform raw API response thành domain entities
/// - Error handling và data validation

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import '../service/weather_localization_service.dart';

/// Repository implementation với dependency injection
@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  /// OpenWeatherMap API key
  final String _apiKey = 'cf5bf28c66b7ab28b77f8c38908d6d84';

  /// Base URL cho OpenWeatherMap API
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  /// Localization service cho weather data
  final WeatherLocalizationService _localizationService;

  WeatherRepositoryImpl(this._localizationService);

  /// Map Flutter locale codes to OpenWeatherMap supported languages
  String get _weatherApiLang => _localizationService.weatherApiLang;

  /// Lấy thời tiết hiện tại theo tên thành phố với localization
  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric&lang=$_weatherApiLang',
        ),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final originalDescription = data['weather'][0]['description'] as String;
        final translatedDescription = _localizationService.translateDescription(
          originalDescription,
        );

        return WeatherEntity(
          city: data['name'],
          temperature: (data['main']['temp'] as num).round(),
          description: translatedDescription,
          date: DateTime.now(),
        );
      } else {
        throw Exception('Failed to fetch weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }

  @override
  Future<List<WeatherEntity>> get7DayForecast(String city) async {
    try {
      final url =
          '$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric&lang=$_weatherApiLang';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final forecastList = data['list'] as List;

        // Convert to WeatherEntity list và translate descriptions
        final entities =
            forecastList.map((item) {
              final originalDescription =
                  item['weather'][0]['description'] as String;
              final translatedDescription = _localizationService
                  .translateDescription(originalDescription);

              return WeatherEntity(
                city: city,
                temperature: (item['main']['temp'] as num).round(),
                description: translatedDescription,
                date: DateTime.parse(item['dt_txt']),
              );
            }).toList();

        // Sort by date to ensure correct order
        entities.sort((a, b) => a.date.compareTo(b.date));

        return entities;
      } else {
        throw Exception(
          'Failed to fetch forecast data: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
