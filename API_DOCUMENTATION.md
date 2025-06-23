# 🌤️ API Documentation - Project Weather

## 📖 Tổng quan

Tài liệu này mô tả chi tiết về việc tích hợp và sử dụng OpenWeatherMap API trong ứng dụng Project Weather. API này cung cấp dữ liệu thời tiết realtime và dự báo cho toàn cầu.

## 🔗 API Provider

**OpenWeatherMap API v2.5**
- **Base URL**: `https://api.openweathermap.org/data/2.5`
- **Documentation**: [OpenWeatherMap API Docs](https://openweathermap.org/api)
- **Rate Limits**: 1000 calls/day (Free tier), 60 calls/minute
- **Response Format**: JSON

## 🔑 Authentication

### API Key Configuration

```dart
// data/lib/src/repository/weather_repository_impl.dart
class WeatherRepositoryImpl implements WeatherRepository {
  final String _apiKey = 'cf5bf28c66b7ab28b77f8c38908d6d84';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';
}
```

### Environment Variables (Recommended)

```bash
# .env files
WEATHER_API_KEY=your_api_key_here
```

```dart
// Secure configuration
class DataConfig {
  static const String weatherApiKey = String.fromEnvironment(
    'WEATHER_API_KEY',
    defaultValue: 'fallback_key',
  );
}
```

## 📡 API Endpoints

### 1. Current Weather Data

#### Endpoint
```
GET /weather
```

#### Description
Lấy thông tin thời tiết hiện tại cho một địa điểm cụ thể.

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `q` | string | Yes* | Tên thành phố (e.g., "Hanoi", "Ho Chi Minh City") |
| `lat` | number | Yes* | Vĩ độ (alternative to city name) |
| `lon` | number | Yes* | Kinh độ (alternative to city name) |
| `appid` | string | Yes | API key |
| `units` | string | No | Đơn vị đo (`metric`, `imperial`, `standard`) |
| `lang` | string | No | Ngôn ngữ response (`vi`, `en`) |

*Cần có ít nhất một trong: `q` hoặc (`lat` + `lon`)

#### Request Examples

```bash
# By city name
GET https://api.openweathermap.org/data/2.5/weather?q=Hanoi&appid=API_KEY&units=metric

# By coordinates
GET https://api.openweathermap.org/data/2.5/weather?lat=21.0285&lon=105.8542&appid=API_KEY&units=metric
```

#### Response Example

```json
{
  "coord": {
    "lon": 105.8542,
    "lat": 21.0285
  },
  "weather": [
    {
      "id": 801,
      "main": "Clouds",
      "description": "few clouds",
      "icon": "02d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 28.5,
    "feels_like": 32.1,
    "temp_min": 27.0,
    "temp_max": 30.0,
    "pressure": 1013,
    "humidity": 65
  },
  "visibility": 10000,
  "wind": {
    "speed": 3.6,
    "deg": 160
  },
  "clouds": {
    "all": 20
  },
  "dt": 1735574400,
  "sys": {
    "type": 1,
    "id": 9308,
    "country": "VN",
    "sunrise": 1735516800,
    "sunset": 1735554000
  },
  "timezone": 25200,
  "id": 1581130,
  "name": "Hanoi",
  "cod": 200
}
```

### 2. 7-Day Forecast

#### Endpoint
```
GET /forecast
```

#### Description
Lấy dự báo thời tiết 7 ngày với interval 3 giờ.

#### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `q` | string | Yes* | Tên thành phố |
| `lat` | number | Yes* | Vĩ độ |
| `lon` | number | Yes* | Kinh độ |
| `appid` | string | Yes | API key |
| `units` | string | No | Đơn vị đo |
| `cnt` | number | No | Số lượng timestamps (max 40) |

#### Request Example

```bash
GET https://api.openweathermap.org/data/2.5/forecast?q=Hanoi&appid=API_KEY&units=metric
```

#### Response Example

```json
{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1735578000,
      "main": {
        "temp": 28.5,
        "feels_like": 32.1,
        "temp_min": 27.8,
        "temp_max": 28.5,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1010,
        "humidity": 65,
        "temp_kf": 0.7
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 20
      },
      "wind": {
        "speed": 3.6,
        "deg": 160,
        "gust": 4.8
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2025-05-30 15:00:00"
    }
  ],
  "city": {
    "id": 1581130,
    "name": "Hanoi",
    "coord": {
      "lat": 21.0285,
      "lon": 105.8542
    },
    "country": "VN",
    "population": 1431270,
    "timezone": 25200,
    "sunrise": 1735516800,
    "sunset": 1735554000
  }
}
```

## 🏗️ Implementation trong Project

### Repository Implementation

```dart
@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final String _apiKey = 'cf5bf28c66b7ab28b77f8c38908d6d84';
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
        temperature: data['main']['temp'].toDouble(),
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
                temperature: item['main']['temp'].toDouble(),
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

### Data Models

#### WeatherModel (Data Layer)

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

#### WeatherEntity (Domain Layer)

```dart
@freezed
class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required String city,
    required double temperature,
    required String description,
    required DateTime date,
  }) = _WeatherEntity;

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);
}
```

## 🚨 Error Handling

### HTTP Status Codes

| Code | Description | Handling |
|------|-------------|----------|
| 200 | Success | Parse response data |
| 404 | City not found | Show "City not found" message |
| 401 | Invalid API key | Check API key configuration |
| 429 | Rate limit exceeded | Implement retry with backoff |
| 500 | Server error | Show generic error message |

### Custom Exceptions

```dart
class WeatherApiException implements Exception {
  final String message;
  final int? statusCode;
  
  WeatherApiException(this.message, [this.statusCode]);
  
  @override
  String toString() => 'WeatherApiException: $message (Code: $statusCode)';
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  
  @override
  String toString() => 'NetworkException: $message';
}
```

### Error Handling Implementation

```dart
@override
Future<WeatherEntity> getCurrentWeather(String city) async {
  try {
    final response = await http.get(
      Uri.parse('$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric'),
      headers: {'Content-Type': 'application/json'},
    ).timeout(Duration(seconds: 30));
    
    switch (response.statusCode) {
      case 200:
        return _parseWeatherData(response.body);
      case 404:
        throw WeatherApiException('City not found: $city', 404);
      case 401:
        throw WeatherApiException('Invalid API key', 401);
      case 429:
        throw WeatherApiException('Rate limit exceeded', 429);
      default:
        throw WeatherApiException(
          'Failed to fetch weather data', 
          response.statusCode
        );
    }
  } on SocketException {
    throw NetworkException('No internet connection');
  } on TimeoutException {
    throw NetworkException('Request timeout');
  } on FormatException {
    throw WeatherApiException('Invalid response format');
  } catch (e) {
    throw WeatherApiException('Unexpected error: $e');
  }
}
```

## 🔄 Retry Logic

### Exponential Backoff

```dart
Future<http.Response> _makeRequestWithRetry(Uri url, {int maxRetries = 3}) async {
  int attempt = 0;
  
  while (attempt < maxRetries) {
    try {
      final response = await http.get(url).timeout(Duration(seconds: 30));
      
      if (response.statusCode == 429) {
        // Rate limited, wait and retry
        await Future.delayed(Duration(seconds: pow(2, attempt).toInt()));
        attempt++;
        continue;
      }
      
      return response;
    } catch (e) {
      if (attempt == maxRetries - 1) rethrow;
      
      await Future.delayed(Duration(seconds: pow(2, attempt).toInt()));
      attempt++;
    }
  }
  
  throw Exception('Max retries exceeded');
}
```

## 🗄️ Caching Strategy

### Memory Cache Implementation

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

## 📊 Rate Limiting

### API Limits

- **Free Tier**: 1,000 calls/day, 60 calls/minute
- **Paid Plans**: Higher limits available

### Client-Side Rate Limiting

```dart
class RateLimiter {
  final int maxCalls;
  final Duration window;
  final List<DateTime> _calls = [];
  
  RateLimiter({required this.maxCalls, required this.window});
  
  Future<void> checkLimit() async {
    final now = DateTime.now();
    
    // Remove old calls outside window
    _calls.removeWhere((call) => now.difference(call) > window);
    
    if (_calls.length >= maxCalls) {
      final oldestCall = _calls.first;
      final waitTime = window - now.difference(oldestCall);
      await Future.delayed(waitTime);
    }
    
    _calls.add(now);
  }
}
```

## 🧪 Testing

### Unit Tests

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

    test('should throw exception when city not found', () async {
      // Arrange
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(
        () => repository.getCurrentWeather('InvalidCity'),
        throwsA(isA<WeatherApiException>()),
      );
    });
  });
}
```

### Integration Tests

```dart
void main() {
  group('Weather API Integration Tests', () {
    test('should fetch real weather data', () async {
      // Requires actual API key and internet connection
      final repository = WeatherRepositoryImpl();
      
      final weather = await repository.getCurrentWeather('London');
      
      expect(weather.city, isNotEmpty);
      expect(weather.temperature, isNotNull);
      expect(weather.description, isNotEmpty);
      expect(weather.date, isNotNull);
    }, skip: 'Requires API key and internet connection');
  });
}
```

## 📈 Performance Optimization

### Best Practices

1. **Caching**: Implement memory cache với reasonable TTL
2. **Compression**: Enable GZIP compression
3. **Connection Pooling**: Reuse HTTP connections
4. **Minimize Requests**: Batch requests khi possible
5. **Background Refresh**: Update cache in background

### Performance Monitoring

```dart
class PerformanceTracker {
  static void trackApiCall(String endpoint, Duration duration) {
    print('API Call: $endpoint took ${duration.inMilliseconds}ms');
    
    // Send to analytics service
    Analytics.track('api_performance', {
      'endpoint': endpoint,
      'duration_ms': duration.inMilliseconds,
    });
  }
}

// Usage
final stopwatch = Stopwatch()..start();
try {
  final weather = await repository.getCurrentWeather(city);
  PerformanceTracker.trackApiCall('/weather', stopwatch.elapsed);
  return weather;
} finally {
  stopwatch.stop();
}
```

## 🔒 Security Considerations

### API Key Protection

1. **Environment Variables**: Store API keys in environment files
2. **Never Commit**: Add .env files to .gitignore
3. **Rotation**: Regularly rotate API keys
4. **Monitoring**: Monitor API usage for anomalies

### HTTPS Only

```dart
// Always use HTTPS
final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
  'q': city,
  'appid': apiKey,
  'units': 'metric',
});
```

### Input Validation

```dart
Future<WeatherEntity> getCurrentWeather(String city) async {
  // Validate input
  if (city.isEmpty) {
    throw ArgumentError('City name cannot be empty');
  }
  
  if (city.length < 2) {
    throw ArgumentError('City name must be at least 2 characters');
  }
  
  // Sanitize input
  final sanitizedCity = city.trim().replaceAll(RegExp(r'[^\w\s-]'), '');
  
  return _fetchWeatherData(sanitizedCity);
}
```

## 📋 API Response Examples

### Success Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `name` | string | Tên thành phố |
| `main.temp` | number | Nhiệt độ (°C khi units=metric) |
| `main.humidity` | number | Độ ẩm (%) |
| `weather[0].description` | string | Mô tả thời tiết |
| `weather[0].icon` | string | Icon code |
| `wind.speed` | number | Tốc độ gió (m/s) |
| `clouds.all` | number | Cloudiness (%) |
| `dt` | number | Unix timestamp |

### Error Response Examples

#### 404 - City Not Found
```json
{
  "cod": "404",
  "message": "city not found"
}
```

#### 401 - Invalid API Key
```json
{
  "cod": 401,
  "message": "Invalid API key. Please see http://openweathermap.org/faq#error401 for more info."
}
```

#### 429 - Rate Limit Exceeded
```json
{
  "cod": 429,
  "message": "Your account is temporary blocked due to exceeding of requests limitation of your subscription type."
}
```

---

*Tài liệu này được cập nhật lần cuối: 30/05/2025*
*API Version: OpenWeatherMap v2.5*
