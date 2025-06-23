import 'package:injectable/injectable.dart';
import '../repository/weather_repository.dart';
import 'base/future/base_future_use_case.dart';
import 'get_weather_input.dart';
import 'get_weather_output.dart';

@injectable
class GetCurrentWeather
    extends BaseFutureUseCase<GetWeatherInput, GetWeatherOutput> {
  final WeatherRepository repository;
  GetCurrentWeather(this.repository);

  @override
  Future<GetWeatherOutput> buildUseCase(GetWeatherInput input) async {
    final city = input.city ?? "${input.lat},${input.lon}";
    final weather = await repository.getCurrentWeather(city);
    return GetWeatherOutput(weather: weather);
  }
}

@injectable
class Get7DayForecast
    extends BaseFutureUseCase<GetWeatherInput, GetWeatherOutput> {
  final WeatherRepository repository;
  Get7DayForecast(this.repository);

  @override
  Future<GetWeatherOutput> buildUseCase(GetWeatherInput input) async {
    final city = input.city ?? "${input.lat},${input.lon}";
    final forecast = await repository.get7DayForecast(city);
    // For now, return the first forecast item as weather
    final weather =
        forecast.isNotEmpty
            ? forecast.first
            : throw Exception('No forecast data');
    return GetWeatherOutput(weather: weather);
  }
}
