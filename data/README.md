# Data Layer Package - Tầng Dữ Liệu

Package này chứa tầng dữ liệu (Data Layer) của ứng dụng Weather theo kiến trúc Clean Architecture. Tầng này chịu trách nhiệm cung cấp dữ liệu từ các nguồn bên ngoài như API, database, hoặc local storage.

## Mục tiêu

Tầng Data thực hiện:
- **Data Sources**: Kết nối với API, database, và local storage
- **Repository Implementation**: Triển khai các interface từ domain layer
- **Data Mapping**: Chuyển đổi dữ liệu giữa các format khác nhau
- **Caching**: Lưu cache dữ liệu để tối ưu hiệu suất

## Cấu trúc Package

```
data/
├── lib/
│   ├── src/
│   │   ├── di/                           # Dependency Injection
│   │   │   └── di.dart                   # Cấu hình DI
│   │   ├── model/                        # Data models
│   │   │   ├── weather_model.dart        # Model API thời tiết
│   │   │   └── weather_model_mapper.dart # Mapper Entity <-> Model
│   │   └── repository/                   # Repository implementations
│   │       └── weather_repository_impl.dart
│   └── data.dart                         # Export chính của package
└── pubspec.yaml
```

## Các Thành Phần Chính

### 1. Data Models

#### WeatherModel
Model dữ liệu từ API, mapping với JSON response:

```dart
@freezed
class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    @JsonKey(name: 'city_name') required String city,
    @JsonKey(name: 'temp') required double temperature,
    @JsonKey(name: 'weather') required String description,
    @JsonKey(name: 'date') required String date,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
}
```

#### WeatherModelMapper
Chuyển đổi giữa WeatherModel (Data) và WeatherEntity (Domain):

```dart
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
```

### 2. Repository Implementation

#### WeatherRepositoryImpl
Triển khai interface WeatherRepository từ domain layer:

```dart
@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final String _apiKey = 'your_openweather_api_key';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric'),
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherEntity(
        city: data['name'],
        temperature: data['main']['temp'],
        description: data['weather'][0]['description'],
        date: DateTime.now(),
      );
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }

  @override
  Future<List<WeatherEntity>> get7DayForecast(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric'),
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['list'] as List)
          .map((item) => WeatherEntity(
                city: city,
                temperature: item['main']['temp'],
                description: item['weather'][0]['description'],
                date: DateTime.parse(item['dt_txt']),
              ))
          .toList();
    } else {
      throw Exception('Failed to fetch forecast data');
    }
  }
}
```

### 3. Dependency Injection

#### DI Configuration
Cấu hình dependency injection cho data layer:

```dart
@module
abstract class DataModule {
  @LazySingleton()
  WeatherModelMapper get weatherModelMapper => WeatherModelMapper();
}
```

## API Integration

### OpenWeatherMap API

Ứng dụng sử dụng OpenWeatherMap API để lấy dữ liệu thời tiết:

#### Current Weather Endpoint
```
GET https://api.openweathermap.org/data/2.5/weather
Parameters:
- q: city name (string)
- appid: API key (string)
- units: metric (for Celsius)
```

#### 7-Day Forecast Endpoint
```
GET https://api.openweathermap.org/data/2.5/forecast
Parameters:
- q: city name (string)
- appid: API key (string)
- units: metric (for Celsius)
```

### Response Format

#### Current Weather Response
```json
{
  "name": "Hanoi",
  "main": {
    "temp": 25.5,
    "humidity": 70
  },
  "weather": [
    {
      "description": "partly cloudy"
    }
  ]
}
```

#### Forecast Response
```json
{
  "list": [
    {
      "dt_txt": "2024-01-01 12:00:00",
      "main": {
        "temp": 25.5
      },
      "weather": [
        {
          "description": "sunny"
        }
      ]
    }
  ]
}
```

## Error Handling

### Exception Types
```dart
class WeatherApiException implements Exception {
  final String message;
  final int? statusCode;
  
  WeatherApiException(this.message, [this.statusCode]);
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}
```

### Error Handling trong Repository
```dart
@override
Future<WeatherEntity> getCurrentWeather(String city) async {
  try {
    final response = await http.get(weatherUrl);
    
    if (response.statusCode == 200) {
      return _parseWeatherData(response.body);
    } else if (response.statusCode == 404) {
      throw WeatherApiException('City not found', 404);
    } else {
      throw WeatherApiException('Failed to fetch weather', response.statusCode);
    }
  } on SocketException {
    throw NetworkException('No internet connection');
  } catch (e) {
    throw WeatherApiException('Unexpected error: $e');
  }
}
```

## Caching Strategy

### Memory Caching
```dart
class WeatherRepositoryImpl implements WeatherRepository {
  final Map<String, CachedWeather> _cache = {};
  final Duration _cacheTimeout = Duration(minutes: 10);

  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    // Check cache first
    final cached = _cache[city];
    if (cached != null && !cached.isExpired) {
      return cached.weather;
    }

    // Fetch from API
    final weather = await _fetchFromApi(city);
    
    // Update cache
    _cache[city] = CachedWeather(weather, DateTime.now());
    
    return weather;
  }
}

class CachedWeather {
  final WeatherEntity weather;
  final DateTime timestamp;
  
  CachedWeather(this.weather, this.timestamp);
  
  bool get isExpired => 
      DateTime.now().difference(timestamp) > Duration(minutes: 10);
}
```

## Data Validation

### Input Validation
```dart
class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    if (city.isEmpty) {
      throw ArgumentError('City name cannot be empty');
    }
    
    if (city.length < 2) {
      throw ArgumentError('City name must be at least 2 characters');
    }
    
    // Proceed with API call
    return _fetchWeatherData(city);
  }
}
```

### Response Validation
```dart
WeatherEntity _parseWeatherResponse(Map<String, dynamic> json) {
  final name = json['name'] as String?;
  final temp = json['main']?['temp'] as double?;
  final description = json['weather']?[0]?['description'] as String?;
  
  if (name == null || temp == null || description == null) {
    throw WeatherApiException('Invalid response format');
  }
  
  return WeatherEntity(
    city: name,
    temperature: temp,
    description: description,
    date: DateTime.now(),
  );
}
```

## Testing

### Unit Testing Repository
```dart
void main() {
  late WeatherRepositoryImpl repository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = WeatherRepositoryImpl(httpClient: mockHttpClient);
  });

  group('getCurrentWeather', () {
    test('should return weather entity when API call succeeds', () async {
      // Arrange
      const city = 'Hanoi';
      final mockResponse = http.Response(
        json.encode({
          'name': 'Hanoi',
          'main': {'temp': 25.5},
          'weather': [{'description': 'sunny'}]
        }),
        200,
      );
      
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await repository.getCurrentWeather(city);

      // Assert
      expect(result.city, 'Hanoi');
      expect(result.temperature, 25.5);
      expect(result.description, 'sunny');
    });

    test('should throw exception when API call fails', () async {
      // Arrange
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response('Error', 404));

      // Act & Assert
      expect(
        () => repository.getCurrentWeather('InvalidCity'),
        throwsA(isA<WeatherApiException>()),
      );
    });
  });
}
```

### Integration Testing
```dart
void main() {
  late WeatherRepositoryImpl repository;

  setUp(() {
    repository = WeatherRepositoryImpl();
  });

  group('Integration Tests', () {
    test('should fetch real weather data', () async {
      // Requires actual API key and internet connection
      final weather = await repository.getCurrentWeather('London');
      
      expect(weather.city, isNotEmpty);
      expect(weather.temperature, isNotNull);
      expect(weather.description, isNotEmpty);
    }, skip: 'Requires API key and internet');
  });
}
```

## Best Practices

### 1. Separation of Concerns
- Model classes chỉ chứa data structure
- Mapper classes xử lý data transformation
- Repository classes chứa business logic cho data access

### 2. Error Handling
- Sử dụng typed exceptions
- Xử lý network errors gracefully
- Validate input parameters

### 3. Performance
- Implement caching appropriately
- Use connection pooling
- Minimize API calls

### 4. Security
- Không hardcode API keys
- Sử dụng HTTPS cho API calls
- Validate và sanitize input data

## Configuration

### API Key Setup
```dart
// In data_config.dart
class DataConfig {
  static const String weatherApiKey = String.fromEnvironment(
    'WEATHER_API_KEY',
    defaultValue: 'your_default_api_key_here',
  );
}
```

### Environment Variables
```bash
# .env file
WEATHER_API_KEY=your_actual_api_key_here
```

## Dependencies

Các dependencies chính của data layer:
- `http`: HTTP client cho API calls
- `injectable`: Dependency injection
- `freezed`: Code generation cho data models
- `json_annotation`: JSON serialization

## Đóng góp

Khi thêm data source mới:

1. Tạo model classes với proper JSON mapping
2. Implement mapper để convert sang domain entities
3. Tạo repository implementation
4. Viết unit tests và integration tests
5. Cập nhật DI configuration
6. Cập nhật exports trong `data.dart`
