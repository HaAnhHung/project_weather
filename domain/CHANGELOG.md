# Changelog - Domain Package

Tất cả các thay đổi quan trọng của package domain sẽ được ghi lại trong file này.

Định dạng dựa trên [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
và project này tuân thủ [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2025-05-30

### ✨ Added (Thêm mới)
- **Entities (Thực thể)**: Triển khai `WeatherEntity` với Freezed để đại diện cho dữ liệu thời tiết
- **Repository Interfaces**: Định nghĩa `WeatherRepository` abstract class cho Clean Architecture
- **Use Cases**: 
  - `GetCurrentWeather` - Lấy thông tin thời tiết hiện tại
  - `Get7DayForecast` - Lấy dự báo thời tiết 7 ngày
- **Base Classes**: 
  - `BaseFutureUseCase` - Use case cơ sở cho async operations
  - `BaseSyncUseCase` - Use case cơ sở cho sync operations
  - `BaseInput/BaseOutput` - Models cho input/output của use cases
  - `BaseBlocEvent/BaseBlocState` - Base classes cho BLoC pattern
- **Input/Output Models**:
  - `GetWeatherInput` - Input model với hỗ trợ city name, lat/lon
  - `GetWeatherOutput` - Output model chứa WeatherEntity
- **JSON Serialization**: Hỗ trợ serialization cho tất cả entities
- **Dependency Injection**: Cấu hình Injectable cho use cases và repositories

### 🏗️ Architecture (Kiến trúc)
- Tuân thủ Clean Architecture principles
- Độc lập hoàn toàn với framework và UI
- Chứa toàn bộ business logic của ứng dụng
- Interface-based design để loose coupling

### 📚 Documentation (Tài liệu)
- README.md comprehensive với Vietnamese documentation
- Hướng dẫn sử dụng và best practices
- Code examples và testing strategies
- Dependency và export specifications

### 🧪 Testing (Testing)
- Unit test structure được thiết lập
- Mock repository examples
- Test cases cho use cases

### 🔧 Technical Details (Chi tiết kỹ thuật)
- **Language**: Dart 3.7+
- **Dependencies**: 
  - `freezed` cho immutable classes
  - `injectable` cho dependency injection
  - `json_annotation` cho JSON serialization
- **Code Generation**: Build runner support cho Freezed và Injectable
