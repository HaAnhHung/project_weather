import '../entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getCurrentWeather(String city);
  Future<List<WeatherEntity>> get7DayForecast(String city);
}
