# 🎨 App Package - Tầng Presentation (UI)

Tầng presentation của ứng dụng Weather App, chứa toàn bộ giao diện người dùng và logic quản lý state sử dụng BLoC pattern.

## 📖 Tổng quan

Tầng App (Presentation) là tầng cao nhất trong kiến trúc Clean Architecture, chịu trách nhiệm:
- **UI Components**: Screens, widgets, và theme system
- **State Management**: BLoC pattern với flutter_bloc
- **Navigation**: Screen navigation và routing
- **User Interaction**: Xử lý input và interaction từ người dùng

## 🏗️ Cấu trúc thư mục

```
app/
├── lib/
│   ├── base/                      # Base classes và utilities
│   │   ├── bloc/                  # Base BLoC classes
│   │   ├── exception_handler/     # Exception handling
│   │   ├── navigator/             # Navigation system
│   │   └── base_page_state.dart   # Base page state
│   ├── di/                        # Dependency injection
│   ├── ui/                        # UI screens và components
│   │   ├── weather/               # Weather screen
│   │   ├── settings/              # Settings screen
│   │   ├── splash/                # Splash screen
│   │   └── detail/                # Detail screen
│   ├── app.dart                   # Exports chính
│   └── main.dart                  # Entry point
├── test/                          # Unit tests
├── android/                       # Android specific files
├── ios/                           # iOS specific files
└── pubspec.yaml                   # Dependencies
```

## 🧩 Các thành phần chính

### 🎯 **Base Classes**

#### BaseBloc
```dart
// base/bloc/base_bloc.dart
abstract class BaseBloc<Event extends BaseBlocEvent, State extends BaseBlocState>
    extends Bloc<Event, State> with LogMixin {
  
  // Base functionality cho tất cả BLoCs
  Future<void> runBlocCatching({
    required Future<void> Function() action,
    Future<void> Function(Object)? doOnError,
  });
}
```

#### BasePageState
```dart
// base/base_page_state.dart
abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> with LogMixin {
  
  late final B bloc;
  late final AppNavigator navigator;
  
  Widget buildPage(BuildContext context);
}
```

### 🌤️ **Weather Feature**

#### WeatherBloc
```dart
// ui/weather/bloc/weather_bloc.dart
class WeatherBloc extends BaseBloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather getCurrentWeather;

  WeatherBloc({required this.getCurrentWeather});

  // Event handlers:
  // - WeatherStarted
  // - WeatherFetchCurrent
  // - WeatherFetchByCity
  // - WeatherUnitChanged
  // - WeatherRefresh
}
```

#### WeatherEvent
```dart
@freezed
class WeatherEvent extends BaseBlocEvent with _$WeatherEvent {
  const factory WeatherEvent.started() = WeatherStarted;
  const factory WeatherEvent.fetchCurrent({
    required double lat,
    required double lon,
  }) = WeatherFetchCurrent;
  const factory WeatherEvent.fetchByCity({required String city}) = WeatherFetchByCity;
  const factory WeatherEvent.unitChanged({required bool isCelsius}) = WeatherUnitChanged;
  const factory WeatherEvent.refresh() = WeatherRefresh;
}
```

#### WeatherState
```dart
@freezed
class WeatherState extends BaseBlocState with _$WeatherState {
  const factory WeatherState.initial() = WeatherInitial;
  const factory WeatherState.loading() = WeatherLoading;
  const factory WeatherState.loaded({required WeatherEntity weather}) = WeatherLoaded;
  const factory WeatherState.error({required String message}) = WeatherError;
}
```

#### WeatherScreen
```dart
// ui/weather/weather_screen.dart
class WeatherScreen extends StatefulWidget {
  final Future<WeatherEntity> Function(String) getWeather;
  
  // Hiển thị:
  // - Search field để nhập tên thành phố
  // - Weather information display
  // - Loading và error states
}
```

### ⚙️ **Settings Feature**

#### SettingsBloc
```dart
// ui/settings/bloc/settings_bloc.dart
class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  // Quản lý:
  // - Dark/Light theme
  // - Temperature unit (Celsius/Fahrenheit)
  // - Language locale
  // - SharedPreferences storage
}
```

### 🚀 **Splash Feature**

#### SplashScreen
```dart
// ui/splash/splash_screen.dart
class SplashScreen extends StatefulWidget {
  // Chức năng:
  // - Request location permission
  // - Get current position
  // - Initialize app data
}
```

## 📱 Luồng hoạt động

### 1. **App Initialization**
```dart
// main.dart
void main() {
  runApp(MyApp(flavor: _flavor));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WeatherBloc(...)),
        BlocProvider(create: (_) => SettingsBloc()),
        BlocProvider(create: (_) => SplashBloc()),
      ],
      child: const _AppView(),
    );
  }
}
```

### 2. **Screen Flow**
```
SplashScreen → Request Location → WeatherScreen
     ↓
Get User Position → Fetch Weather Data → Display UI
```

### 3. **State Management Flow**
```
User Action → Event → BLoC → Use Case → Repository → API
     ↑                                                  ↓
UI Update ← State ← BLoC ← Output ← Use Case ← Data
```

## 🎨 UI Components

### Shared Widgets (từ package shared)
```dart
// Được sử dụng từ shared package
- LoadingWidget
- ErrorWidgetCustom
- AppButton
- AppTextField
```

### Screen Structure
```dart
class ExampleScreen extends StatefulWidget {
  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends BasePageState<ExampleScreen, ExampleBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => LoadingWidget(),
            loaded: (data) => DataWidget(data),
            error: (message) => ErrorWidgetCustom(message: message),
          );
        },
      ),
    );
  }
}
```

## 🎯 Best Practices

### 1. **BLoC Pattern**
```dart
// ✅ Đúng - Sử dụng events để trigger actions
bloc.add(WeatherEvent.fetchByCity(city: 'Hanoi'));

// ❌ Sai - Không gọi trực tiếp methods
bloc.fetchWeather('Hanoi');
```

### 2. **State Handling**
```dart
// ✅ Đúng - Sử dụng when/map cho union types
state.when(
  initial: () => InitialWidget(),
  loading: () => LoadingWidget(),
  loaded: (data) => DataWidget(data),
  error: (message) => ErrorWidget(message),
);
```

### 3. **Error Handling**
```dart
// ✅ Đúng - Handle errors trong BLoC
Future<void> _onEventHandler(Event event, Emitter<State> emit) async {
  await runBlocCatching(
    action: () async {
      final result = await useCase.execute(input);
      emit(State.loaded(result));
    },
    doOnError: (error) async {
      emit(State.error(message: error.toString()));
    },
  );
}
```

### 4. **Widget Organization**
```dart
// ✅ Đúng - Tách các widgets phức tạp
class WeatherScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _WeatherSearchBar(),
          _WeatherDisplay(),
        ],
      ),
    );
  }
}

class _WeatherSearchBar extends StatelessWidget { ... }
class _WeatherDisplay extends StatelessWidget { ... }
```

## 🧪 Testing

### Unit Tests
```dart
// test/bloc/weather_bloc_test.dart
void main() {
  late WeatherBloc weatherBloc;
  late MockGetCurrentWeather mockGetCurrentWeather;

  setUp(() {
    mockGetCurrentWeather = MockGetCurrentWeather();
    weatherBloc = WeatherBloc(getCurrentWeather: mockGetCurrentWeather);
  });

  group('WeatherBloc', () {
    test('initial state is WeatherInitial', () {
      expect(weatherBloc.state, equals(const WeatherState.initial()));
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits [loading, loaded] when fetchByCity succeeds',
      build: () {
        when(() => mockGetCurrentWeather.execute(any()))
            .thenAnswer((_) async => GetWeatherOutput(weather: testWeather));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const WeatherEvent.fetchByCity(city: 'Hanoi')),
      expect: () => [
        const WeatherState.loading(),
        WeatherState.loaded(weather: testWeather),
      ],
    );
  });
}
```

### Widget Tests
```dart
// test/ui/weather_screen_test.dart
void main() {
  testWidgets('WeatherScreen displays weather data', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WeatherScreen(
          getWeather: (city) async => testWeather,
        ),
      ),
    );

    expect(find.text('Hanoi'), findsOneWidget);
    expect(find.text('25°C'), findsOneWidget);
  });
}
```

## 🚀 Chạy ứng dụng

### Development
```bash
# Chạy app development
flutter run --flavor develop

# Chạy với device cụ thể
flutter run -d chrome

# Hot reload
r # Trong terminal đang chạy app
```

### Build
```bash
# Build APK
flutter build apk --flavor develop

# Build iOS
flutter build ios --flavor develop

# Build web
flutter build web
```

## 🔧 Configuration

### Environment Variables
```dart
// main.dart
const String _flavor = String.fromEnvironment(
  'FLAVOR',
  defaultValue: 'develop',
);
```

### App Config
```dart
// Cấu hình theo flavor
class AppConfig {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://api.openweathermap.org/data/2.5',
  );
}
```

## 🎨 Theming

### Theme Configuration
```dart
// Sử dụng theme từ settings
MaterialApp(
  theme: settingsState.isDarkMode 
    ? ThemeData.dark() 
    : ThemeData.light(),
  // ...
)
```

## 🌍 Internationalization

### Locale Support
```dart
// Hỗ trợ multiple languages
MaterialApp(
  locale: Locale(settingsState.locale),
  supportedLocales: const [
    Locale('en', ''),
    Locale('vi', ''),
  ],
  // ...
)
```

## 🐛 Debugging

### BLoC Observer
```dart
// base/bloc/app_bloc_observer.dart
class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(BlocBase bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logI('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logE('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
```

### Logging
```dart
// Sử dụng LogMixin
class WeatherBloc extends BaseBloc with LogMixin {
  void _logWeatherData(WeatherEntity weather) {
    logI('Weather data loaded for ${weather.city}: ${weather.temperature}°C');
  }
}
```

## 📚 Tài liệu tham khảo

- [Flutter BLoC Documentation](https://bloclibrary.dev/)
- [Flutter Clean Architecture](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Freezed Package](https://pub.dev/packages/freezed)
- [Injectable DI](https://pub.dev/packages/injectable)

## 🤝 Đóng góp

1. Tuân thủ Clean Architecture patterns
2. Sử dụng BLoC cho state management
3. Viết tests cho mỗi feature
4. Follow naming conventions
5. Document complex business logic

---

**Lưu ý**: Tầng App chỉ nên chứa UI logic và state management. Business logic phải được đặt trong Domain layer, và data access logic trong Data layer.
