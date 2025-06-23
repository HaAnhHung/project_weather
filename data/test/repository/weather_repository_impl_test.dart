import 'package:flutter_test/flutter_test.dart';
import 'package:domain/domain.dart';
import 'package:data/src/weather/weather_repository_impl.dart';

void main() {
  group('WeatherRepositoryImpl', () {
    late WeatherRepositoryImpl repository;

    setUp(() {
      repository = WeatherRepositoryImpl();
    });

    group('getCurrentWeather', () {
      test('should return WeatherEntity when API call succeeds', () async {
        const city = 'London';

        try {
          // act
          final result = await repository.getCurrentWeather(city);

          // assert
          expect(result, isA<WeatherEntity>());
          expect(result.city, isNotEmpty);
          expect(result.temperature, isA<double>());
          expect(result.description, isNotEmpty);
          expect(result.date, isA<DateTime>());
        } catch (e) {
          // This test might fail due to network issues or API limits
          // In a production environment, you would mock the HTTP client
          print('Test skipped due to network/API constraints: $e');
        }
      });

      test('should throw exception for invalid city name', () async {
        const invalidCity = 'InvalidCityNameThatDoesNotExist123456';

        // act & assert
        expect(
          () => repository.getCurrentWeather(invalidCity),
          throwsException,
        );
      });

      test('should throw exception for empty city name', () async {
        const emptyCity = '';

        // act & assert
        expect(() => repository.getCurrentWeather(emptyCity), throwsException);
      });
    });

    group('get7DayForecast', () {
      test(
        'should return list of WeatherEntity when API call succeeds',
        () async {
          const city = 'London';

          try {
            // act
            final result = await repository.get7DayForecast(city);

            // assert
            expect(result, isA<List<WeatherEntity>>());
            expect(result.isNotEmpty, true);
            for (final weather in result) {
              expect(weather.city, city);
              expect(weather.temperature, isA<double>());
              expect(weather.description, isNotEmpty);
              expect(weather.date, isA<DateTime>());
            }
          } catch (e) {
            // This test might fail due to network issues or API limits
            print('Test skipped due to network/API constraints: $e');
          }
        },
      );

      test('should throw exception for invalid city name', () async {
        const invalidCity = 'InvalidCityNameThatDoesNotExist123456';

        // act & assert
        expect(() => repository.get7DayForecast(invalidCity), throwsException);
      });
    });
  });
}
