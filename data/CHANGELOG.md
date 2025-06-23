# Changelog - Data Package

Tất cả các thay đổi quan trọng của package data sẽ được ghi lại trong file này.

Định dạng dựa trên [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
và project này tuân thủ [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2025-05-30

### ✨ Added (Thêm mới)
- **Repository Implementation**: Triển khai `WeatherRepositoryImpl` từ domain interface
- **Data Models**: 
  - `WeatherModel` với JSON serialization cho API response
  - Freezed integration cho immutable data models
- **Data Mappers**: 
  - `WeatherModelMapper` chuyển đổi giữa Data và Domain models
  - Type-safe mapping với validation
- **API Integration**:
  - OpenWeatherMap API integration
  - HTTP client với error handling
  - Support cho current weather và 7-day forecast
  - Query parameters cho city name và coordinates
- **Error Handling**:
  - Custom exception types (`WeatherApiException`, `NetworkException`)
  - HTTP status code handling
  - Network connectivity checks
- **Dependency Injection**: Injectable configuration cho repositories và mappers

### 🌐 API Features (Tính năng API)
- **Current Weather**: Lấy thời tiết hiện tại theo tên thành phố
- **7-Day Forecast**: Dự báo thời tiết 7 ngày
- **Geolocation Support**: Truy vấn theo latitude/longitude
- **Unit System**: Metric units (Celsius) support
- **Response Parsing**: Safe JSON parsing với validation

### 🔒 Security (Bảo mật)
- Environment variable configuration cho API keys
- No hardcoded sensitive information
- HTTPS-only API calls
- Input validation và sanitization

### 📈 Performance (Hiệu năng)
- Memory caching strategy với TTL
- Connection pooling support
- Efficient HTTP request handling
- Error recovery mechanisms

### 🧪 Testing (Testing)
- Unit tests cho repository implementation
- Mock HTTP client integration
- Integration tests với real API
- Error scenario testing

### 🔧 Technical Details (Chi tiết kỹ thuật)
- **Language**: Dart 3.7+
- **Dependencies**:
  - `http` cho API calls
  - `freezed` cho data models
  - `json_annotation` cho serialization
  - `injectable` cho DI
- **API Provider**: OpenWeatherMap API v2.5
- **Data Format**: JSON REST API

### 📚 Documentation (Tài liệu)
- README.md comprehensive với Vietnamese documentation
- API integration examples
- Error handling strategies
- Caching và performance guidelines
