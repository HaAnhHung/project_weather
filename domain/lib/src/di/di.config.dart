// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/src/repository/weather_repository.dart' as _i946;
import 'package:domain/src/usecase/get_weather_usecase.dart' as _i495;
import 'package:domain/src/usecase/weather_usecases.dart' as _i821;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i495.GetWeatherUseCase>(
      () => _i495.GetWeatherUseCase(gh<_i946.WeatherRepository>()),
    );
    gh.factory<_i821.GetCurrentWeather>(
      () => _i821.GetCurrentWeather(gh<_i946.WeatherRepository>()),
    );
    gh.factory<_i821.Get7DayForecast>(
      () => _i821.Get7DayForecast(gh<_i946.WeatherRepository>()),
    );
    return this;
  }
}
