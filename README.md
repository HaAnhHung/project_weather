# 🌤️ Project Weather - Ứng dụng Thời tiết Flutter

## 📱 Giới thiệu

Project Weather là một ứng dụng thời tiết được phát triển bằng Flutter, tuân thủ Clean Architecture và sử dụng BLoC pattern để quản lý state. Ứng dụng cung cấp thông tin thời tiết real-time cho các thành phố trên toàn thế giới thông qua OpenWeatherMap API.

## ✨ Tính năng chính

### 🌍 **Thời tiết hiện tại**
- Lấy thông tin thời tiết theo vị trí hiện tại (GPS)
- Tìm kiếm thời tiết theo tên thành phố
- Hiển thị nhiệt độ, mô tả thời tiết, độ ẩm
- Cập nhật thời gian thực

### 📅 **Dự báo thời tiết**  
- Dự báo thời tiết 7 ngày
- Thông tin chi tiết cho từng ngày
- Biểu đồ nhiệt độ và xu hướng thời tiết

### 🎨 **Giao diện người dùng**
- Thiết kế Material Design hiện đại
- Hỗ trợ Dark Mode / Light Mode
- Responsive design cho nhiều kích thước màn hình
- Animations và transitions mượt mà

### 🌐 **Đa ngôn ngữ & Cài đặt**
- Hỗ trợ tiếng Việt và tiếng Anh
- Chuyển đổi đơn vị nhiệt độ (°C/°F)
- Cài đặt thông báo thời tiết
- Lưu trữ preferences cục bộ

### 📱 **Trải nghiệm người dùng**
- Pull-to-refresh để cập nhật dữ liệu
- Shimmer loading effect
- Error handling và retry mechanism
- Offline support với caching
- Location permission handling

### 🔧 **Tính năng kỹ thuật**
- Clean Architecture với 3 layers
- BLoC state management pattern
- Dependency Injection với Injectable
- JSON serialization với Freezed
- Custom linting rules
- Comprehensive testing suite

## 🎯 Demo Features

### 🌤️ **Weather Display**
```
📍 Current Location Weather
┌─────────────────────────┐
│    🌤️ Hanoi, Vietnam   │
│         25°C            │
│    Partly Cloudy        │
│   Updated: 10:30 AM     │
└─────────────────────────┘
```

### 🔍 **City Search**
```
🔎 Search Weather
┌─────────────────────────┐
│ [Tokyo             🔍]  │
│                         │
│ 🌤️ Tokyo, Japan        │
│ 22°C - Clear Sky        │
│ Humidity: 65%           │
│ Wind: 12 km/h           │
└─────────────────────────┘
```

### 📊 **7-Day Forecast**
```
📅 Weekly Forecast
┌─────────────────────────┐
│ Mon  🌤️  25°/18°  Cloudy│
│ Tue  ☀️  28°/20°  Sunny │
│ Wed  🌧️  23°/16°  Rain  │
│ Thu  ⛅  26°/19°  P.Cloud│
│ Fri  ☀️  29°/21°  Clear │
│ Sat  🌧️  22°/15°  Rain  │
│ Sun  🌤️  25°/17°  Cloudy│
└─────────────────────────┘
```

### ⚙️ **Settings & Preferences**
```
🛠️ Settings
┌─────────────────────────┐
│ 🌓 Dark Mode      [ON ] │
│ 🌍 Language    [Tiếng Việt]│
│ 🌡️ Temperature   [°C  ] │
│ 📍 Location     [Auto] │
│ 🔔 Notifications [ON ] │
└─────────────────────────┘
```

## 🏗️ Kiến trúc dự án

Dự án được tổ chức theo mô hình **Clean Architecture** với **Melos** để quản lý mono-repo:

```
project_weather/
├── app/              # Presentation Layer - UI và State Management
├── domain/           # Domain Layer - Business Logic và Entities  
├── data/             # Data Layer - Repositories và Data Sources
├── shared/           # Shared utilities và constants
├── resources/        # Assets, fonts, themes
├── initializer/      # Dependency Injection setup
└── nals_lints/       # Code style và linting rules
```

### 📋 Các tầng kiến trúc

#### 🎨 **App Layer (Presentation)**
- **BLoC Pattern**: Quản lý state với flutter_bloc
- **UI Components**: Screens, widgets, và navigation
- **Theme System**: Material Design với dark/light mode

#### 🧠 **Domain Layer (Business Logic)**
- **Entities**: Các model nghiệp vụ (WeatherEntity)
- **Use Cases**: Logic nghiệp vụ (GetCurrentWeather, Get7DayForecast)
- **Repository Interfaces**: Abstractions cho data layer

#### 💾 **Data Layer**
- **Repository Implementations**: Triển khai các interface từ domain
- **Data Sources**: API calls, local storage
- **Models**: Data transfer objects với JSON serialization

## 🛠️ Công nghệ sử dụng

### 📚 Framework & Libraries chính

| Danh mục | Package | Mô tả |
|----------|---------|--------|
| **Framework** | Flutter 3.7+ | Cross-platform mobile framework |
| **State Management** | flutter_bloc | Predictable state management |
| **Architecture** | Clean Architecture | Separation of concerns |
| **Mono-repo** | Melos | Multi-package management |
| **Code Generation** | freezed, json_annotation | Immutable classes & JSON |
| **DI** | injectable, get_it | Dependency injection |
| **HTTP** | http | API communication |
| **Location** | geolocator | GPS location services |

### 🔧 Development Tools

- **Build Runner**: Code generation
- **Dart Code Metrics**: Code quality analysis
- **Flutter Lints**: Code style enforcement

## 🚀 Hướng dẫn cài đặt

### 📋 Yêu cầu hệ thống

- **Dart**: >=3.0.0 <4.0.0
- **Flutter**: 3.7.2+
- **Melos**: ^4.1.0
- **IDE**: Android Studio, VS Code hoặc IntelliJ IDEA

### ⚡ Cài đặt nhanh

1. **Clone repository**
```bash
git clone <your-repo-url>
cd project_weather
```

2. **Cài đặt Melos globally**
```bash
dart pub global activate melos
```

3. **Cài đặt dependencies**
```bash
melos bootstrap
```

4. **Generate code**
```bash
melos run sync
```

5. **Chạy ứng dụng**
```bash
cd app
flutter run
```

## 📱 Hướng dẫn sử dụng

### 🏠 Màn hình chính

1. **Khởi động**: Ứng dụng tự động yêu cầu quyền truy cập vị trí
2. **Vị trí hiện tại**: Hiển thị thời tiết tại vị trí GPS
3. **Tìm kiếm**: Nhập tên thành phố vào ô tìm kiếm
4. **Làm mới**: Kéo xuống để làm mới dữ liệu

### 🔍 Tìm kiếm thời tiết

```dart
// Ví dụ tìm kiếm
TextField(
  controller: _controller,
  decoration: InputDecoration(
    labelText: 'Tên thành phố',
    suffixIcon: IconButton(
      icon: Icon(Icons.search),
      onPressed: _search,
    ),
  ),
)
```

## 🧑‍💻 Hướng dẫn phát triển

### 📁 Cấu trúc code chính

#### 🎯 Weather Use Cases
```dart
// domain/lib/src/usecase/weather_usecases.dart
class GetCurrentWeather extends BaseFutureUseCase<GetWeatherInput, GetWeatherOutput> {
  @override
  Future<GetWeatherOutput> buildUseCase(GetWeatherInput input) async {
    final city = input.city ?? "${input.lat},${input.lon}";
    final weather = await repository.getCurrentWeather(city);
    return GetWeatherOutput(weather: weather);
  }
}
```

#### 🏛️ Weather Entity
```dart
// domain/lib/src/entity/weather_entity.dart
@freezed
class WeatherEntity with _$WeatherEntity {
  const factory WeatherEntity({
    required String city,
    required double temperature,
    required String description,
    required DateTime date,
  }) = _WeatherEntity;
}
```

#### 🔄 Weather BLoC
```dart
// app/lib/ui/weather/bloc/weather_bloc.dart
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  // Events: started, fetchCurrent, fetchByCity, unitChanged, refresh
  // States: initial, loading, loaded, error
}
```

### 🎨 Thêm tính năng mới

1. **Tạo Entity** trong `domain/lib/src/entity/`
2. **Tạo Use Case** trong `domain/lib/src/usecase/`
3. **Tạo Repository Interface** trong `domain/lib/src/repository/`
4. **Implement Repository** trong `data/lib/src/repository/`
5. **Tạo BLoC** trong `app/lib/ui/feature/bloc/`
6. **Tạo UI** trong `app/lib/ui/feature/`

### 🔧 Melos Commands

```bash
# Cài đặt dependencies cho tất cả packages
melos bootstrap

# Build code generation cho tất cả packages  
melos run sync

# Build riêng từng package
melos run build_app
melos run build_domain
melos run build_data

# Watch mode (tự động build khi có thay đổi)
melos run watch_all

# Testing
melos run test           # Test tất cả
melos run test_app       # Test app layer
melos run test_coverage  # Test với coverage

# Code quality
melos run analyze        # Phân tích code
melos run format         # Format code
melos run format_fix     # Tự động fix format
```

## 🧪 Testing

### 🔍 Chạy tests

```bash
# Test tất cả modules
melos run test

# Test với coverage
melos run test_coverage

# Test từng layer riêng
melos run test_app
melos run test_domain  
melos run test_data
```

### ✅ Test Structure
```
test/
├── unit_tests/         # Unit tests cho business logic
├── widget_tests/       # Widget tests cho UI components
└── integration_tests/  # End-to-end tests
```

## 🌐 API Configuration

### 🔑 OpenWeatherMap API

Dự án sử dụng OpenWeatherMap API để lấy dữ liệu thời tiết:

```dart
// data/lib/src/repository/weather_repository_impl.dart
class WeatherRepositoryImpl implements WeatherRepository {
  final String _apiKey = 'your-api-key-here';
  final String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  
  @override
  Future<WeatherEntity> getCurrentWeather(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric'),
    );
    // Handle response...
  }
}
```

### 🔐 Environment Setup

1. Đăng ký tài khoản tại [OpenWeatherMap](https://openweathermap.org/api)
2. Lấy API key miễn phí
3. Thay thế `_apiKey` trong `WeatherRepositoryImpl`

## 🐛 Troubleshooting

### ❗ Các vấn đề thường gặp

#### 🔧 Build issues
```bash
# Clear cache và rebuild
flutter clean
melos clean
melos bootstrap
melos run sync
```

#### 📍 Location permission
- **iOS**: Thêm quyền trong `ios/Runner/Info.plist`
- **Android**: Thêm quyền trong `android/app/src/main/AndroidManifest.xml`

#### 🌐 Network issues
- Kiểm tra API key hợp lệ
- Kiểm tra kết nối internet
- Xem logs trong debug console

### 📋 Logs quan trọng

```bash
# Xem logs chi tiết
flutter run --verbose

# Logs cho từng platform
flutter logs                    # All platforms
flutter logs --device-id=xxx    # Specific device
```

## 🤝 Đóng góp

### 🔀 Git Workflow

1. **Fork** repository
2. **Tạo branch** cho tính năng mới
```bash
git checkout -b feature/ten-tinh-nang
```
3. **Commit** với message rõ ràng
```bash
git commit -m "feat: thêm tính năng dự báo theo giờ"
```
4. **Push** và tạo **Pull Request**

### 📝 Code Style

- Tuân thủ **Dart Style Guide**
- Sử dụng **dart format** trước khi commit
- Pass tất cả **linting rules**
- Viết **tests** cho code mới

### 🏷️ Commit Convention

```
feat: thêm tính năng mới
fix: sửa bug
docs: cập nhật documentation  
style: thay đổi code style
refactor: refactor code
test: thêm hoặc sửa tests
```

## 🚀 Deployment

Tham khảo [DEPLOYMENT.md](DEPLOYMENT.md) để có hướng dẫn chi tiết về:

- 🏗️ **Build Configuration** - Setup environments và flavors
- 🔄 **CI/CD Pipeline** - GitHub Actions workflow  
- 📱 **Platform Setup** - Android/iOS configuration
- 🌐 **Environment Variables** - API keys và configuration
- 📦 **Release Management** - Version control và release process
- 🏪 **Store Deployment** - Google Play Store và App Store
- 🔍 **Monitoring** - Crash reporting và analytics
- 🛡️ **Security** - API security và code obfuscation

## 📄 License

Dự án này được phát hành dưới [MIT License](LICENSE).

## 👥 Contributors

- **Team Leader**: [Tên của bạn]
- **Developers**: [Danh sách team members]

## 📞 Liên hệ

- **Email**: contact@yourcompany.com
- **Slack**: #project-weather
- **GitHub Issues**: [Link to issues](https://github.com/your-repo/issues)

---

## 📚 Tài liệu tham khảo

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Melos Documentation](https://melos.invertase.dev/)
- [Freezed Package](https://pub.dev/packages/freezed)

---

**Happy Coding! 🚀**

> 💡 **Tip**: Luôn nhớ chạy `melos run sync` sau khi thay đổi các model hoặc freezed classes!
