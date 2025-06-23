import 'package:freezed_annotation/freezed_annotation.dart';
import '../entity/weather_entity.dart';
import '../base/base_output.dart';

part 'get_weather_output.freezed.dart';

@freezed
class GetWeatherOutput extends BaseOutput with _$GetWeatherOutput {
  const factory GetWeatherOutput({required WeatherEntity weather}) =
      _GetWeatherOutput;
}
