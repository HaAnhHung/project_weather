import 'package:domain/domain.dart';
import 'weather_model.dart';

class WeatherModelMapper {
  WeatherEntity mapToEntity(WeatherModel model) {
    return WeatherEntity(
      city: model.city,
      temperature: model.temperature,
      description: model.description,
      date: DateTime.parse(model.date),
    );
  }
}
