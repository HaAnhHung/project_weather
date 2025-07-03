/// 🌤️ Weather BLoC - Quản lý state thời tiết
///
/// Chức năng:
/// - Fetch thời tiết hiện tại theo tọa độ/tên thành phố
/// - Fetch dự báo 7 ngày
/// - Quản lý loading states và error handling
/// - Cache data để tối ưu performance

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:domain/domain.dart';
import '../../../base/bloc/base_bloc.dart';
import 'weather_event.dart';
import 'weather_state.dart';

/// Weather BLoC với dependency injection
@Injectable()
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  /// Use case để lấy thời tiết hiện tại
  final GetCurrentWeather getCurrentWeather;

  /// Use case để lấy dự báo 7 ngày
  final Get7DayForecast get7DayForecast;

  WeatherBloc({required this.getCurrentWeather, required this.get7DayForecast})
    : super(const WeatherState.initial()) {
    on<WeatherStarted>(_onWeatherStarted);
    on<WeatherFetchCurrent>(_onWeatherFetchCurrent);
    on<WeatherFetchByCity>(_onWeatherFetchByCity);
    on<WeatherUnitChanged>(_onWeatherUnitChanged);
    on<WeatherRefresh>(_onWeatherRefresh);
    on<WeatherFetchForecast>(_onWeatherFetchForecast);
    on<WeatherFetchForecastByLatLon>(_onWeatherFetchForecastByLatLon);
    on<WeatherLanguageChanged>(_onWeatherLanguageChanged);
  }

  Future<void> _onWeatherStarted(
    WeatherStarted event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherState.initial());
  }

  Future<void> _onWeatherFetchCurrent(
    WeatherFetchCurrent event,
    Emitter<WeatherState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final input = GetWeatherInput(lat: event.lat, lon: event.lon);
        final output = await getCurrentWeather.execute(input);
        emit(WeatherState.loaded(weather: output.weather));
      },
      doOnError: (error) async {
        emit(WeatherState.error(message: error.toString()));
      },
    );
  }

  Future<void> _onWeatherFetchByCity(
    WeatherFetchByCity event,
    Emitter<WeatherState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final input = GetWeatherInput(city: event.city);
        final output = await getCurrentWeather.execute(input);
        emit(WeatherState.loaded(weather: output.weather));

        // Automatically fetch forecast after loading weather
        add(WeatherEvent.fetchForecast(city: event.city));
      },
      doOnError: (error) async {
        emit(WeatherState.error(message: error.toString()));
      },
    );
  }

  Future<void> _onWeatherFetchForecast(
    WeatherFetchForecast event,
    Emitter<WeatherState> emit,
  ) async {
    final currentState = state;
    if (currentState is WeatherLoaded) {
      // Update state to show forecast loading
      emit(currentState.copyWith(isForecastLoading: true, forecastError: null));

      try {
        final forecast = await get7DayForecast.repository.get7DayForecast(
          event.city,
        );
        emit(
          currentState.copyWith(
            forecast: forecast,
            isForecastLoading: false,
            forecastError: null,
          ),
        );
      } catch (e) {
        emit(
          currentState.copyWith(
            isForecastLoading: false,
            forecastError: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> _onWeatherFetchForecastByLatLon(
    WeatherFetchForecastByLatLon event,
    Emitter<WeatherState> emit,
  ) async {
    final currentState = state;
    if (currentState is WeatherLoaded) {
      // Update state to show forecast loading
      emit(currentState.copyWith(isForecastLoading: true, forecastError: null));

      try {
        final city = "${event.lat},${event.lon}";
        final forecast = await get7DayForecast.repository.get7DayForecast(city);
        emit(
          currentState.copyWith(
            forecast: forecast,
            isForecastLoading: false,
            forecastError: null,
          ),
        );
      } catch (e) {
        emit(
          currentState.copyWith(
            isForecastLoading: false,
            forecastError: e.toString(),
          ),
        );
      }
    }
  }

  Future<void> _onWeatherUnitChanged(
    WeatherUnitChanged event,
    Emitter<WeatherState> emit,
  ) async {
    // Handle unit change logic
    logI(
      'Weather unit changed to ${event.isCelsius ? 'Celsius' : 'Fahrenheit'}',
    );
  }

  Future<void> _onWeatherRefresh(
    WeatherRefresh event,
    Emitter<WeatherState> emit,
  ) async {
    // Re-fetch current weather if we have previous data
    final currentState = state;
    if (currentState is WeatherLoaded) {
      // Use the city from current weather to refresh
      add(WeatherEvent.fetchByCity(city: currentState.weather.city));
    }
  }

  Future<void> _onWeatherLanguageChanged(
    WeatherLanguageChanged event,
    Emitter<WeatherState> emit,
  ) async {
    // Re-fetch current weather and forecast when language changes
    // This ensures weather descriptions are translated to the new language
    final currentState = state;
    if (currentState is WeatherLoaded) {
      // Refresh both current weather and forecast with new language
      add(WeatherEvent.fetchByCity(city: currentState.weather.city));
    }
  }
}
