# Domain Layer Package - Tầng Miền Nghiệp Vụ

Package này chứa tầng miền nghiệp vụ (Domain Layer) của ứng dụng Weather theo kiến trúc Clean Architecture. Tầng này chứa logic nghiệp vụ cốt lõi, các entity, repository interface và use cases.

## Mục tiêu

Tầng Domain cung cấp:
- **Independence**: Độc lập hoàn toàn với framework và thư viện bên ngoài
- **Business Logic**: Chứa toàn bộ logic nghiệp vụ của ứng dụng
- **Data Models**: Định nghĩa các entity và model dữ liệu
- **Contracts**: Định nghĩa interface cho repository và các service

## Cấu trúc Package

```
domain/
├── lib/
│   ├── src/
│   │   ├── base/                    # Các class cơ sở
│   │   │   ├── base_input.dart      # Input cơ sở cho use cases
│   │   │   ├── base_output.dart     # Output cơ sở cho use cases
│   │   │   ├── base_usecase.dart    # Use case cơ sở
│   │   │   ├── base_bloc_event.dart # Event cơ sở cho BLoC
│   │   │   └── base_bloc_state.dart # State cơ sở cho BLoC
│   │   ├── entity/                  # Các entity nghiệp vụ
│   │   │   └── weather_entity.dart  # Entity thời tiết
│   │   ├── repository/              # Interface của repository
│   │   │   └── weather_repository.dart
│   │   └── usecase/                 # Các use case nghiệp vụ
│   │       ├── base/
│   │       │   ├── future/          # Future-based use cases
│   │       │   └── sync/            # Synchronous use cases
│   │       ├── get_weather_input.dart
│   │       ├── get_weather_output.dart
│   │       ├── get_weather_usecase.dart
│   │       └── weather_usecases.dart
│   └── domain.dart                  # Export chính của package
└── pubspec.yaml
```

## Các Thành Phần Chính

### 1. Entity (Thực thể)

#### WeatherEntity
Đại diện cho dữ liệu thời tiết trong hệ thống:

```dart
@freezed
class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required String city,           // Tên thành phố
    required double temperature,    // Nhiệt độ
    required String description,    // Mô tả thời tiết
    required DateTime date,         // Ngày giờ
  }) = _WeatherEntity;

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);
}
```

### 2. Repository Interface

#### WeatherRepository
Định nghĩa contract cho việc truy xuất dữ liệu thời tiết:

```dart
abstract class WeatherRepository {
  Future<WeatherEntity> getCurrentWeather(String city);
  Future<List<WeatherEntity>> get7DayForecast(String city);
}
```

### 3. Use Cases (Trường hợp sử dụng)

#### GetCurrentWeather
Use case để lấy thông tin thời tiết hiện tại:

```dart
class GetCurrentWeather extends BaseFutureUseCase<GetWeatherInput, GetWeatherOutput> {
  final WeatherRepository repository;
  GetCurrentWeather(this.repository);

  @override
  Future<GetWeatherOutput> buildUseCase(GetWeatherInput input) async {
    final city = input.city ?? "${input.lat},${input.lon}";
    final weather = await repository.getCurrentWeather(city);
    return GetWeatherOutput(weather: weather);
  }
}
```

#### Get7DayForecast
Use case để lấy dự báo thời tiết 7 ngày:

```dart
class Get7DayForecast extends BaseFutureUseCase<GetWeatherInput, GetWeatherOutput> {
  final WeatherRepository repository;
  Get7DayForecast(this.repository);

  @override
  Future<GetWeatherOutput> buildUseCase(GetWeatherInput input) async {
    final city = input.city ?? "${input.lat},${input.lon}";
    final forecast = await repository.get7DayForecast(city);
    final weather = forecast.isNotEmpty ? forecast.first 
        : throw Exception('No forecast data');
    return GetWeatherOutput(weather: weather);
  }
}
```

### 4. Input/Output Models

#### GetWeatherInput
```dart
@freezed
class GetWeatherInput extends BaseInput with _$GetWeatherInput {
  const factory GetWeatherInput({
    String? city,      // Tên thành phố (tùy chọn)
    double? lat,       // Vĩ độ (tùy chọn)
    double? lon,       // Kinh độ (tùy chọn)
  }) = _GetWeatherInput;
}
```

#### GetWeatherOutput
```dart
@freezed
class GetWeatherOutput extends BaseOutput with _$GetWeatherOutput {
  const factory GetWeatherOutput({
    required WeatherEntity weather,
  }) = _GetWeatherOutput;
}
```

## Sử dụng trong các tầng khác

### Trong Tầng Presentation (App)
```dart
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather getCurrentWeather;

  WeatherBloc({required this.getCurrentWeather});

  Future<void> _onWeatherFetchByCity(
    WeatherFetchByCity event,
    Emitter<WeatherState> emit,
  ) async {
    final input = GetWeatherInput(city: event.city);
    final output = await getCurrentWeather.execute(input);
    emit(WeatherState.loaded(weather: output.weather));
  }
}
```

### Trong Tầng Data
```dart
@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    // Implementation sử dụng API
    final response = await http.get(weatherApiUrl);
    return WeatherEntity.fromJson(response.data);
  }
}
```

## Nguyên tắc Clean Architecture

Domain layer tuân thủ các nguyên tắc sau:

1. **Dependency Rule**: Tầng này không phụ thuộc vào bất kỳ tầng nào khác
2. **Business Logic**: Chứa toàn bộ quy tắc nghiệp vụ
3. **Testability**: Dễ dàng unit test vì không có dependency external
4. **Abstraction**: Sử dụng interface thay vì implementation cụ thể

## Testing

### Unit Testing cho Use Cases
```dart
void main() {
  late GetCurrentWeather useCase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    useCase = GetCurrentWeather(mockRepository);
  });

  test('should return weather when repository returns data', () async {
    // Arrange
    const input = GetWeatherInput(city: 'Hanoi');
    const expectedWeather = WeatherEntity(/*...*/);
    when(() => mockRepository.getCurrentWeather('Hanoi'))
        .thenAnswer((_) async => expectedWeather);

    // Act
    final result = await useCase.execute(input);

    // Assert
    expect(result.weather, expectedWeather);
  });
}
```

## Lợi ích của Domain Layer

1. **Reusability**: Logic nghiệp vụ có thể tái sử dụng across platforms
2. **Maintainability**: Dễ bảo trì và cập nhật logic nghiệp vụ
3. **Testability**: Unit test nhanh và đáng tin cậy
4. **Independence**: Không bị ảnh hưởng bởi thay đổi framework hay database

## Đóng góp

Khi thêm tính năng mới vào domain layer:

1. Tạo entity cho data model mới
2. Định nghĩa repository interface
3. Tạo use cases cho business logic
4. Viết unit tests
5. Cập nhật exports trong `domain.dart`

## Dependencies

Package chỉ sử dụng các dependencies tối thiểu:
- `freezed`: Code generation cho immutable classes
- `json_annotation`: JSON serialization
- `injectable`: Dependency injection annotations

Không sử dụng Flutter framework hay external APIs để đảm bảo tính độc lập.
