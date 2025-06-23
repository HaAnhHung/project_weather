import 'package:injectable/injectable.dart';
import 'get_weather_input.dart';
import 'get_weather_output.dart';
import '../repository/weather_repository.dart';

@injectable
class GetWeatherUseCase {
  final WeatherRepository _repository;
  GetWeatherUseCase(this._repository);

  Future<GetWeatherOutput> call(GetWeatherInput input) async {
    final weather = await _repository.getCurrentWeather(input.city ?? '');
    return GetWeatherOutput(weather: weather);
  }
}
