import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final String _apiKey = 'cf5bf28c66b7ab28b77f8c38908d6d84';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherEntity(
          city: data['name'],
          temperature: (data['main']['temp'] as num).round(),
          description: data['weather'][0]['description'],
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
      final url = '$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final forecastList = data['list'] as List;

        // Convert to WeatherEntity list and sort by date
        final entities =
            forecastList
                .map(
                  (item) => WeatherEntity(
                    city: city,
                    temperature: (item['main']['temp'] as num).round(),
                    description: item['weather'][0]['description'],
                    date: DateTime.parse(item['dt_txt']),
                  ),
                )
                .toList();

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
