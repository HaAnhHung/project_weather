# 🔧 Shared Package - Tiện ích dùng chung

## 📖 Mô tả

Package `shared` chứa các tiện ích, constants, extensions và helper functions được sử dụng chung across toàn bộ dự án Weather App. Đây là nơi tập trung các utility functions và configuration để tránh code duplication.

## ✨ Tính năng

- 🔤 **Constants**: Định nghĩa các hằng số dùng chung
- 🛠️ **Extensions**: Mở rộng functionality cho các class có sẵn
- 📦 **Utils**: Các utility functions tiện ích
- 🎨 **Widgets**: Shared UI components
- 📝 **Mixins**: Reusable mixins cho logging, validation, etc.
- ⚙️ **Configuration**: App configuration và settings

## 🏗️ Cấu trúc thư mục

```
lib/
├── src/
│   ├── constants/       # Các hằng số dùng chung
│   ├── extensions/      # Extension methods
│   ├── utils/          # Utility functions
│   ├── widgets/        # Shared UI components
│   ├── mixins/         # Reusable mixins
│   └── config/         # Configuration classes
└── shared.dart         # Export file
```

## 🚀 Sử dụng

### Constants

```dart
import 'package:shared/shared.dart';

// API constants
final apiUrl = ApiConstants.baseUrl;
final timeout = NetworkConstants.timeout;

// UI constants
final padding = UIConstants.defaultPadding;
final borderRadius = UIConstants.defaultBorderRadius;
```

### Extensions

```dart
import 'package:shared/shared.dart';

// String extensions
String text = "hello world";
String capitalized = text.capitalize(); // "Hello world"
bool isEmpty = text.isNullOrEmpty;

// DateTime extensions
DateTime now = DateTime.now();
String formatted = now.toFormattedString(); // "2025-05-29 10:30"
bool isToday = now.isToday;

// Number extensions
double temp = 25.5;
String rounded = temp.toPrecision(1); // "25.5"
```

### Widgets

```dart
import 'package:shared/shared.dart';

// Loading widget
LoadingWidget()

// Error widget
ErrorWidgetCustom(
  message: "Có lỗi xảy ra",
  onRetry: () => _retry(),
)

// Empty state
EmptyStateWidget(
  message: "Không có dữ liệu",
  icon: Icons.cloud_off,
)
```

### Mixins

```dart
import 'package:shared/shared.dart';

class WeatherBloc extends BaseBloc with LogMixin {
  void fetchWeather() {
    logI("Đang tải thời tiết..."); // Info log
    logE("Lỗi khi tải thời tiết", error: e); // Error log
  }
}
```

## 📋 Các components chính

### 🔤 Constants

```dart
// API Configuration
class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org';
  static const Duration timeout = Duration(seconds: 30);
}

// UI Configuration  
class UIConstants {
  static const EdgeInsets defaultPadding = EdgeInsets.all(16.0);
  static const double defaultBorderRadius = 8.0;
  static const Duration animationDuration = Duration(milliseconds: 300);
}
```

### 🛠️ Extensions

```dart
// String Extensions
extension StringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  String capitalize() => this!.isEmpty ? this! : 
    this![0].toUpperCase() + this!.substring(1);
}

// DateTime Extensions
extension DateTimeExtensions on DateTime {
  bool get isToday => isSameDay(DateTime.now());
  String toFormattedString() => DateFormat('yyyy-MM-dd HH:mm').format(this);
}
```

### 📦 Utils

```dart
// Network Utils
class NetworkUtils {
  static bool isConnected() async {
    // Check internet connectivity
  }
  
  static String getErrorMessage(Exception e) {
    // Parse error messages
  }
}

// Validation Utils
class ValidationUtils {
  static bool isValidEmail(String email) {
    // Email validation logic
  }
  
  static bool isValidCity(String city) {
    // City name validation
  }
}
```

## 🧪 Testing

```bash
# Run tests cho shared package
melos run test_shared

# Hoặc từ thư mục shared
cd shared
flutter test
```

## 📝 Thêm utility mới

1. **Tạo file** trong thư mục `lib/src/` tương ứng
2. **Implement** functionality
3. **Export** trong `lib/shared.dart`
4. **Viết tests** trong `test/`
5. **Update** documentation

### Ví dụ thêm extension mới:

```dart
// lib/src/extensions/list_extensions.dart
extension ListExtensions<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  T? get firstOrNull => isNullOrEmpty ? null : this!.first;
}

// lib/shared.dart
export 'src/extensions/list_extensions.dart';
```

## 🤝 Đóng góp

Khi thêm utility mới vào shared package:

1. Đảm bảo utility **thực sự được dùng chung** >= 2 modules
2. Viết **documentation** rõ ràng
3. Thêm **unit tests** đầy đủ
4. **Export** trong file `shared.dart`
5. **Update** README nếu cần

## 📄 Dependencies

Package này sử dụng các dependencies cơ bản:
- `flutter/material.dart` - UI components
- `intl` - Internationalization  
- `logging` - Logging utilities

---

*Package này là core foundation cho toàn bộ Weather App project.*
