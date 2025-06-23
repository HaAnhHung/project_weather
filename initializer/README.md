# 🚀 Initializer Package - App Initialization & Bootstrap

Package khởi tạo ứng dụng cho project_weather, chịu trách nhiệm khởi tạo và cấu hình tất cả các dependencies và services cần thiết trước khi ứng dụng chạy.

## 📖 Tổng quan

Initializer package là thành phần khởi tạo ứng dụng trong Clean Architecture, đảm bảo:
- **Configuration Loading**: Load app config và environment variables  
- **Module Initialization**: Khởi tạo các module shared, data, domain theo thứ tự
- **Application Bootstrap**: Điều phối quá trình khởi động app

## 🏗️ Cấu trúc hiện tại

```
initializer/
├── lib/
│   ├── src/
│   │   └── app_initializer.dart       # Main initializer class
│   └── initializer.dart               # Public exports
├── test/                              # Unit tests
└── pubspec.yaml                       # Dependencies
```

## 🔧 Chức năng chính

### 1. **App Initialization Flow**

```dart
// Luồng khởi tạo ứng dụng theo Clean Architecture
class AppInitializer {
  Future<void> init() async {
    // 1. Initialize environment constants
    EnvConstants.init();
    
    // 2. Initialize shared module
    await SharedConfig.getInstance().init();
    
    // 3. Initialize data layer
    await DataConfig.getInstance().init();
    
    // 4. Initialize domain layer  
    await DomainConfig.getInstance().init();
    
    // 5. Initialize application config
    await _applicationConfig.init();
  }
}
    
    // 4. Bootstrap external services
    await _bootstrapExternalServices();
    
    // 5. Verify initialization
    await _verifyInitialization();
  }
}
```

### 2. **Dependency Injection Setup**

```dart
// DI container configuration
class DIContainer {
  static Future<void> setup() async {
    // Register Shared layer dependencies
    GetIt.instance.registerLazySingleton<LogService>(() => LogService());
    
    // Register Data layer dependencies
    GetIt.instance.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(),
    );
    
    // Register Domain layer dependencies
    GetIt.instance.registerLazySingleton<GetCurrentWeather>(
      () => GetCurrentWeather(GetIt.instance<WeatherRepository>()),
    );
    
    // Register App layer dependencies
    GetIt.instance.registerFactory<WeatherBloc>(
      () => WeatherBloc(getCurrentWeather: GetIt.instance<GetCurrentWeather>()),
    );
  }
}
```

### 3. **Configuration Management**

```dart
// App configuration
class AppConfig {
  static late final AppConfig _instance;
  
  final String apiKey;
  final String baseUrl;
  final bool enableLogging;
  
  const AppConfig._({
    required this.apiKey,
    required this.baseUrl,
    required this.enableLogging,
  });
  
  static Future<void> initialize() async {
    _instance = AppConfig._(
      apiKey: EnvConfig.get('WEATHER_API_KEY'),
      baseUrl: EnvConfig.get('API_BASE_URL'),
      enableLogging: EnvConfig.getBool('ENABLE_LOGGING'),
    );
  }
  
  static AppConfig get instance => _instance;
}
```

### 4. **Environment Configuration**

```dart
// Environment variables handling
class EnvConfig {
  static late final Map<String, String> _env;
  
  static Future<void> load() async {
    _env = {
      'WEATHER_API_KEY': const String.fromEnvironment('WEATHER_API_KEY'),
      'API_BASE_URL': const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'https://api.openweathermap.org/data/2.5',
      ),
      'ENABLE_LOGGING': const String.fromEnvironment(
        'ENABLE_LOGGING',
        defaultValue: 'true',
      ),
    };
  }
  
  static String get(String key) => _env[key] ?? '';
  static bool getBool(String key) => _env[key]?.toLowerCase() == 'true';
}
```

## 🚀 Sử dụng trong Main App

### 1. **Main Entry Point**

```dart
// main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize app before running
  await AppInitializer.initialize();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BLoCs đã được configure trong DI
        BlocProvider(create: (_) => GetIt.instance<WeatherBloc>()),
        BlocProvider(create: (_) => GetIt.instance<SettingsBloc>()),
      ],
      child: MaterialApp(
        title: 'Weather App',
        home: WeatherScreen(),
      ),
    );
  }
}
```

### 2. **Service Bootstrap**

```dart
// Bootstrap các services cần thiết
class ServiceBootstrap {
  static Future<void> initializeCoreServices() async {
    // Khởi tạo logging
    await LoggingBootstrap.initialize();
    
    // Khởi tạo database
    await DatabaseBootstrap.initialize();
    
    // Khởi tạo network client
    await NetworkBootstrap.initialize();
  }
  
  static Future<void> bootstrapExternalServices() async {
    // Khởi tạo location services
    await LocationService.initialize();
    
    // Khởi tạo permission handling
    await PermissionService.initialize();
    
    // Khởi tạo crash reporting
    await CrashReportingService.initialize();
  }
}
```

## 🔧 Implementation Checklist

### ✅ **Core Features** (Chưa implement)
- [ ] App initialization orchestration
- [ ] Dependency injection setup
- [ ] Configuration management
- [ ] Environment variable handling
- [ ] Service bootstrap coordination

### ✅ **Advanced Features** (Tương lai)
- [ ] Feature flag management
- [ ] A/B testing setup
- [ ] Remote configuration
- [ ] App performance monitoring
- [ ] Crash reporting integration

## 📦 Dependencies cần thiết

```yaml
# pubspec.yaml
dependencies:
  flutter:
    sdk: flutter
  
  # Dependency injection
  get_it: ^7.6.7
  injectable: ^2.3.2
  
  # Configuration
  flutter_dotenv: ^5.1.0
  
  # Logging
  logger: ^2.0.2
  
  # Error handling
  sentry_flutter: ^7.18.0
  
  # Performance monitoring
  firebase_performance: ^0.9.3
  
  # Feature flags
  firebase_remote_config: ^4.3.17
  
  # Clean Architecture dependencies
  shared:
    path: ../shared
  domain:
    path: ../domain
  data:
    path: ../data

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Code generation
  injectable_generator: ^2.4.1
  build_runner: ^2.4.6
```

## 🎯 Best Practices

### 1. **Initialization Order**
```dart
// Đúng thứ tự khởi tạo
1. Environment Configuration
2. Logging Setup
3. Dependency Injection
4. Core Services (Database, Network)
5. External Services (Location, Permissions)
6. App-specific Configuration
7. Verification & Health Checks
```

### 2. **Error Handling**
```dart
// Robust error handling during initialization
class AppInitializer {
  static Future<void> initialize() async {
    try {
      await _initializeSteps();
    } catch (error, stackTrace) {
      // Log initialization error
      logger.error('App initialization failed', error, stackTrace);
      
      // Report to crash analytics
      await CrashReporting.reportError(error, stackTrace);
      
      // Fallback to safe mode
      await _initializeSafeMode();
    }
  }
}
```

### 3. **Performance Monitoring**
```dart
// Monitor initialization performance
class InitializationMetrics {
  static Future<T> measureStep<T>(
    String stepName,
    Future<T> Function() step,
  ) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      final result = await step();
      logger.info('$stepName completed in ${stopwatch.elapsedMilliseconds}ms');
      return result;
    } finally {
      stopwatch.stop();
    }
  }
}
```

## 🧪 Testing

### Unit Tests
```dart
// test/app_initializer_test.dart
void main() {
  group('AppInitializer', () {
    test('should initialize all services in correct order', () async {
      // Arrange
      final initOrder = <String>[];
      
      // Act
      await AppInitializer.initialize();
      
      // Assert
      expect(initOrder, equals([
        'EnvConfig',
        'DIContainer',
        'CoreServices',
        'ExternalServices',
      ]));
    });
    
    test('should handle initialization failures gracefully', () async {
      // Test error scenarios
    });
  });
}
```

## 📚 Tài liệu tham khảo

- [GetIt Dependency Injection](https://pub.dev/packages/get_it)
- [Injectable Code Generation](https://pub.dev/packages/injectable)
- [Flutter Environment Configuration](https://flutter.dev/docs/deployment/flavors)
- [Clean Architecture Initialization Patterns](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## 🤝 Đóng góp

1. Implement AppInitializer class theo mẫu above
2. Add proper error handling và logging
3. Setup dependency injection cho tất cả layers
4. Viết comprehensive tests
5. Document initialization flow

---

**Lưu ý**: Package này hiện tại chỉ chứa template code. Cần implement đầy đủ các features listed above để có một app initialization system hoàn chỉnh theo Clean Architecture principles.
