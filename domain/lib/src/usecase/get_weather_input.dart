import 'package:freezed_annotation/freezed_annotation.dart';
import '../base/base_input.dart';

part 'get_weather_input.freezed.dart';

@freezed
class GetWeatherInput extends BaseInput with _$GetWeatherInput {
  const factory GetWeatherInput({String? city, double? lat, double? lon}) =
      _GetWeatherInput;
}
