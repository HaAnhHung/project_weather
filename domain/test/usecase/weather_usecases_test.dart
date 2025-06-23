import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:domain/domain.dart';

// Mock classes
class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('GetCurrentWeather', () {
    late GetCurrentWeather useCase;
    late MockWeatherRepository mockRepository;
    late WeatherEntity testWeather;

    setUp(() {
      mockRepository = MockWeatherRepository();
      useCase = GetCurrentWeather(mockRepository);
      testWeather = WeatherEntity(
        city: 'London',
        temperature: 25,
        description: 'Sunny',
        date: DateTime(2025, 5, 30),
      );
    });

    test(
      'should return weather entity when repository call succeeds with city',
      () async {
        // arrange
        const input = GetWeatherInput(city: 'London');
        when(
          () => mockRepository.getCurrentWeather('London'),
        ).thenAnswer((_) async => testWeather);

        // act
        final result = await useCase.execute(input);

        // assert
        expect(result.weather, equals(testWeather));
        verify(() => mockRepository.getCurrentWeather('London')).called(1);
      },
    );

    test(
      'should return weather entity when repository call succeeds with coordinates',
      () async {
        // arrange
        const input = GetWeatherInput(lat: 51.5074, lon: -0.1278);
        const coordinates = '51.5074,-0.1278';
        when(
          () => mockRepository.getCurrentWeather(coordinates),
        ).thenAnswer((_) async => testWeather);

        // act
        final result = await useCase.execute(input);

        // assert
        expect(result.weather, equals(testWeather));
        verify(() => mockRepository.getCurrentWeather(coordinates)).called(1);
      },
    );

    test(
      'should prioritize city over coordinates when both are provided',
      () async {
        // arrange
        const input = GetWeatherInput(
          city: 'London',
          lat: 51.5074,
          lon: -0.1278,
        );
        when(
          () => mockRepository.getCurrentWeather('London'),
        ).thenAnswer((_) async => testWeather);

        // act
        final result = await useCase.execute(input);

        // assert
        expect(result.weather, equals(testWeather));
        verify(() => mockRepository.getCurrentWeather('London')).called(1);
        verifyNever(() => mockRepository.getCurrentWeather('51.5074,-0.1278'));
      },
    );

    test('should throw exception when repository throws exception', () async {
      // arrange
      const input = GetWeatherInput(city: 'London');
      when(
        () => mockRepository.getCurrentWeather('London'),
      ).thenThrow(Exception('Network error'));

      // act & assert
      expect(
        () async => await useCase.execute(input),
        throwsA(isA<Exception>()),
      );
      verify(() => mockRepository.getCurrentWeather('London')).called(1);
    });

    test('should handle empty city string gracefully', () async {
      // arrange
      const input = GetWeatherInput(city: '');
      when(
        () => mockRepository.getCurrentWeather(''),
      ).thenAnswer((_) async => testWeather);

      // act
      final result = await useCase.execute(input);

      // assert
      expect(result.weather, equals(testWeather));
      verify(() => mockRepository.getCurrentWeather('')).called(1);
    });
  });

  group('Get7DayForecast', () {
    late Get7DayForecast useCase;
    late MockWeatherRepository mockRepository;
    late List<WeatherEntity> testForecast;

    setUp(() {
      mockRepository = MockWeatherRepository();
      useCase = Get7DayForecast(mockRepository);
      testForecast = [
        WeatherEntity(
          city: 'London',
          temperature: 25,
          description: 'Sunny',
          date: DateTime(2025, 5, 30),
        ),
        WeatherEntity(
          city: 'London',
          temperature: 22,
          description: 'Cloudy',
          date: DateTime(2025, 5, 31),
        ),
      ];
    });

    test(
      'should return first weather entity from forecast list when successful',
      () async {
        // arrange
        const input = GetWeatherInput(city: 'London');
        when(
          () => mockRepository.get7DayForecast('London'),
        ).thenAnswer((_) async => testForecast);

        // act
        final result = await useCase.execute(input);

        // assert
        expect(result.weather, equals(testForecast.first));
        verify(() => mockRepository.get7DayForecast('London')).called(1);
      },
    );

    test('should work with coordinates input', () async {
      // arrange
      const input = GetWeatherInput(lat: 51.5074, lon: -0.1278);
      const coordinates = '51.5074,-0.1278';
      when(
        () => mockRepository.get7DayForecast(coordinates),
      ).thenAnswer((_) async => testForecast);

      // act
      final result = await useCase.execute(input);

      // assert
      expect(result.weather, equals(testForecast.first));
      verify(() => mockRepository.get7DayForecast(coordinates)).called(1);
    });

    test('should throw exception when forecast list is empty', () async {
      // arrange
      const input = GetWeatherInput(city: 'London');
      when(
        () => mockRepository.get7DayForecast('London'),
      ).thenAnswer((_) async => <WeatherEntity>[]);

      // act & assert
      expect(
        () async => await useCase.execute(input),
        throwsA(isA<Exception>()),
      );
      verify(() => mockRepository.get7DayForecast('London')).called(1);
    });

    test('should throw exception when repository throws exception', () async {
      // arrange
      const input = GetWeatherInput(city: 'London');
      when(
        () => mockRepository.get7DayForecast('London'),
      ).thenThrow(Exception('Network error'));

      // act & assert
      expect(
        () async => await useCase.execute(input),
        throwsA(isA<Exception>()),
      );
      verify(() => mockRepository.get7DayForecast('London')).called(1);
    });

    test(
      'should prioritize city over coordinates when both provided',
      () async {
        // arrange
        const input = GetWeatherInput(
          city: 'London',
          lat: 51.5074,
          lon: -0.1278,
        );
        when(
          () => mockRepository.get7DayForecast('London'),
        ).thenAnswer((_) async => testForecast);

        // act
        final result = await useCase.execute(input);

        // assert
        expect(result.weather, equals(testForecast.first));
        verify(() => mockRepository.get7DayForecast('London')).called(1);
        verifyNever(() => mockRepository.get7DayForecast('51.5074,-0.1278'));
      },
    );

    test('should handle repository errors gracefully', () async {
      // arrange
      const input = GetWeatherInput(city: 'London');
      when(
        () => mockRepository.get7DayForecast('London'),
      ).thenThrow(Exception('API Error'));

      // act & assert
      expect(
        () async => await useCase.execute(input),
        throwsA(isA<Exception>()),
      );
      verify(() => mockRepository.get7DayForecast('London')).called(1);
    });
  });
}
