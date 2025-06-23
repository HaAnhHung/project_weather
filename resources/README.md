# 📦 Resources Package - Tài nguyên và Assets

## 📖 Mô tả

Package resources chứa tất cả các tài nguyên tĩnh, assets và cấu hình localization cho ứng dụng Weather App. Đây là nơi tập trung quản lý fonts, hình ảnh, icons, và các file đa ngôn ngữ.

## ✨ Tính năng

- 🖼️ **Asset Management** - Quản lý hình ảnh, icons và media files
- 🔤 **Font Management** - Fonts tùy chỉnh và typography
- 🌐 **Internationalization** - Hỗ trợ đa ngôn ngữ (i18n)
- 🎨 **Generated Assets** - Code generation cho type-safe asset access
- 📱 **Responsive Assets** - Assets tối ưu cho nhiều màn hình

## 🏗️ Cấu trúc thư mục

```
resources/
├── lib/
│   ├── resources.dart           # Main export file
│   └── src/
│       ├── fonts/              # Font assets
│       ├── images/             # Image assets  
│       ├── l10n/               # Localization files
│       └── generated/          # Generated asset classes
├── assets/                     # Asset files (dự kiến)
│   ├── images/
│   │   ├── icons/
│   │   ├── weather/
│   │   └── backgrounds/
│   └── fonts/
└── test/                       # Tests cho resources
```

## 🚀 Sử dụng

### 1. Import package

```dart
import 'package:resources/resources.dart';
```

### 2. Sử dụng Assets (Dự kiến)

```dart
// Generated asset classes
class AppImages {
  static const String weatherSunny = 'assets/images/weather/sunny.png';
  static const String weatherRainy = 'assets/images/weather/rainy.png';
  static const String iconLocation = 'assets/images/icons/location.svg';
}

// Sử dụng trong widget
Image.asset(AppImages.weatherSunny)
```

### 3. Sử dụng Fonts (Dự kiến)

```dart
// Font constants
class AppFonts {
  static const String primary = 'Roboto';
  static const String secondary = 'OpenSans';
}

// Text styles
const TextStyle titleStyle = TextStyle(
  fontFamily: AppFonts.primary,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
```

### 4. Localization Support

```dart
// Generated l10n classes
class AppLocalizations {
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('vi', 'VN'),
  ];
}
```

## 📋 Components dự kiến

### 🖼️ Asset Classes

```dart
// lib/src/generated/app_images.dart
class AppImages {
  // Weather icons
  static const String sunny = 'assets/images/weather/sunny.png';
  static const String cloudy = 'assets/images/weather/cloudy.png';
  static const String rainy = 'assets/images/weather/rainy.png';
  
  // App icons
  static const String appLogo = 'assets/images/app_logo.png';
  static const String locationIcon = 'assets/images/icons/location.svg';
  
  // Backgrounds
  static const String dayBackground = 'assets/images/bg_day.jpg';
  static const String nightBackground = 'assets/images/bg_night.jpg';
}
```

### 🔤 Typography

```dart
// lib/src/generated/app_fonts.dart
class AppFonts {
  static const String primary = 'Inter';
  static const String secondary = 'Roboto';
  
  // Font weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}
```

### 🌐 Localization

```dart
// lib/src/l10n/app_localizations.dart
abstract class AppLocalizations {
  String get appTitle;
  String get weatherTitle;
  String get loading;
  String get error;
  
  // Weather descriptions
  String get sunny;
  String get cloudy;
  String get rainy;
  
  // Static methods
  static AppLocalizations of(BuildContext context);
  static const LocalizationsDelegate<AppLocalizations> delegate;
}
```

## 🛠️ Setup và Configuration

### 1. Thêm Assets vào pubspec.yaml

```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/images/
    - assets/images/weather/
    - assets/images/icons/
    - assets/fonts/
  
  fonts:
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
```

### 2. Generate Asset Classes

```bash
# Tạo asset classes từ files
flutter packages pub run build_runner build

# Hoặc sử dụng melos command
melos run generate
```

### 3. Setup Localization

```yaml
# l10n.yaml (ở app level)
arb-dir: lib/resource/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
output-class: AppLocalizations
```

## 🎯 Best Practices

### 📱 Asset Optimization

```dart
// Sử dụng asset variants cho different densities
assets/
├── images/
│   ├── 1.5x/
│   │   └── weather_icon.png
│   ├── 2.0x/
│   │   └── weather_icon.png
│   ├── 3.0x/
│   │   └── weather_icon.png
│   └── weather_icon.png  // 1x
```

### 🔄 Asset Generation

```dart
// build.yaml cho asset generation
targets:
  $default:
    builders:
      flutter_gen|flutter_gen_loader:
        options:
          assets:
            enabled: true
            class_name: Assets
            package_name: resources
```

### 🌍 Localization Best Practices

```dart
// Organize keys by feature
{
  "weather": {
    "title": "Weather",
    "loading": "Loading weather data...",
    "error": "Failed to load weather"
  },
  "settings": {
    "title": "Settings",
    "language": "Language",
    "theme": "Theme"
  }
}
```

## 🧪 Testing

```dart
// test/resources_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:resources/resources.dart';

void main() {
  group('AppImages', () {
    test('should have valid asset paths', () {
      expect(AppImages.weatherSunny, isNotEmpty);
      expect(AppImages.weatherSunny.endsWith('.png'), isTrue);
    });
  });
  
  group('AppFonts', () {
    test('should have valid font families', () {
      expect(AppFonts.primary, isNotEmpty);
      expect(AppFonts.secondary, isNotEmpty);
    });
  });
  
  group('Localization', () {
    testWidgets('should load localizations', (tester) async {
      // Test localization loading
    });
  });
}
```

## 🔧 Development Workflow

### 1. Thêm Asset mới

```bash
# 1. Copy asset files vào thư mục assets/
cp new_image.png assets/images/

# 2. Update pubspec.yaml nếu cần
# 3. Regenerate asset classes
flutter packages pub run build_runner build

# 4. Import vào code
import 'package:resources/resources.dart';
```

### 2. Thêm Localization mới

```bash
# 1. Update ARB files
# vi: app_vi.arb
# en: app_en.arb

# 2. Generate localization classes
flutter gen-l10n

# 3. Export trong resources.dart
```

### 3. Optimize Assets

```bash
# Optimize images
flutter_launcher_icons:main
flutter_native_splash:create

# Check asset sizes
flutter build apk --analyze-size
```

## 📦 Dependencies cần thiết

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.19.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.12
  flutter_gen_runner: ^5.7.0
  flutter_launcher_icons: ^0.14.1
  flutter_native_splash: ^2.4.1
```

## 🤝 Đóng góp

Khi thêm resources mới:

1. **Organize properly** - Đặt files vào đúng thư mục
2. **Optimize size** - Nén và tối ưu assets
3. **Generate classes** - Chạy code generation
4. **Update exports** - Export trong `resources.dart`
5. **Write tests** - Test asset loading và paths
6. **Document usage** - Update README với examples

## 📚 Tài liệu tham khảo

- [Flutter Assets Documentation](https://docs.flutter.dev/ui/assets/assets-and-images)
- [Flutter Gen Package](https://pub.dev/packages/flutter_gen)
- [Internationalization Guide](https://docs.flutter.dev/ui/accessibility/internationalization)
- [Asset Generation Best Practices](https://flutter.dev/docs/ui/assets/assets-and-images)

---

*Package này quản lý tất cả tài nguyên tĩnh cho Weather App project. Hiện tại package chỉ chứa structure cơ bản và cần implement đầy đủ asset management system.*
