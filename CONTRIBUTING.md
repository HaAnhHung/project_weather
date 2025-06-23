# 🤝 Contributing Guide - Project Weather App

## 📖 Tổng quan

Chúng tôi hoan nghênh mọi đóng góp để cải thiện Project Weather App! Hướng dẫn này sẽ giúp bạn hiểu cách đóng góp hiệu quả cho dự án.

## 🚀 Bắt đầu đóng góp

### 1. **Setup Development Environment**

```bash
# 1. Fork repository trên GitHub
# 2. Clone your fork
git clone https://github.com/YOUR_USERNAME/project_weather.git
cd project_weather

# 3. Add upstream remote
git remote add upstream https://github.com/ORIGINAL_OWNER/project_weather.git

# 4. Setup development environment
make setup
make sync

# 5. Verify setup
make doctor
flutter doctor
```

### 2. **Development Workflow**

```bash
# 1. Create feature branch
git checkout develop
git pull upstream develop
git checkout -b feature/your-feature-name

# 2. Make your changes
# ... develop your feature ...

# 3. Run quality checks
make format
make analyze
make test

# 4. Commit and push
git add .
git commit -m "feat: add your feature description"
git push origin feature/your-feature-name

# 5. Create Pull Request on GitHub
```

## 📋 Contribution Types

### 🐛 **Bug Reports**

Khi báo cáo bug, vui lòng include:

```markdown
## Bug Description
Clear và concise description của bug.

## Steps to Reproduce
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

## Expected Behavior
Mô tả behavior mong đợi.

## Actual Behavior  
Mô tả điều gì thực sự xảy ra.

## Screenshots
Nếu có, add screenshots để giải thích problem.

## Environment
- OS: [e.g. iOS 17.0, Android 14]
- Device: [e.g. iPhone 15, Samsung Galaxy S24]
- App version: [e.g. 1.2.3]
- Flutter version: [e.g. 3.29.3]

## Additional Context
Any other context về problem.
```

### ✨ **Feature Requests**

```markdown
## Feature Description
Clear và concise description của feature bạn muốn.

## Problem Solved
Mô tả problem mà feature này sẽ solve.

## Proposed Solution
Detailed description of your proposed solution.

## Alternatives Considered
Alternative solutions bạn đã consider.

## Additional Context
Screenshots, mockups, hoặc additional context.
```

### 🔧 **Code Contributions**

#### Loại contributions được hoan nghênh:

- **Bug fixes**: Sửa các issues đã được report
- **Feature implementation**: Implement các features đã được approve
- **Performance improvements**: Optimization code
- **Documentation updates**: Cải thiện documentation
- **Tests**: Thêm hoặc improve test coverage
- **Refactoring**: Clean up code while maintaining functionality

## 🎯 Code Quality Standards

### 1. **Architecture Compliance**

```dart
// ✅ Follow Clean Architecture
// Domain layer - Pure business logic
class GetCurrentWeatherUseCase {
  final WeatherRepository _repository;
  
  GetCurrentWeatherUseCase(this._repository);
  
  Future<WeatherEntity> execute(String city) async {
    // Business logic here
    return await _repository.getCurrentWeather(city);
  }
}

// ❌ Don't mix layers
class GetCurrentWeatherUseCase {
  final http.Client _client; // Don't depend on implementation details
}
```

### 2. **Code Style Guidelines**

```dart
// ✅ Good: Descriptive names
class WeatherForecastRepository {
  Future<List<WeatherEntity>> getSevenDayForecast(String cityId) async {
    // Implementation
  }
}

// ❌ Bad: Unclear names  
class WFRepo {
  Future<List<dynamic>> get7d(String id) async {
    // Implementation
  }
}

// ✅ Good: Proper error handling
Future<WeatherEntity> getCurrentWeather(String city) async {
  try {
    final response = await _apiService.getCurrentWeather(city);
    return WeatherMapper.toEntity(response);
  } on NetworkException catch (e) {
    throw NetworkException('Failed to fetch weather: ${e.message}');
  } catch (e) {
    throw UnknownException('Unexpected error: $e');
  }
}

// ❌ Bad: Poor error handling
Future<WeatherEntity> getCurrentWeather(String city) async {
  final response = await _apiService.getCurrentWeather(city);
  return WeatherMapper.toEntity(response);
}
```

### 3. **Testing Requirements**

```dart
// ✅ Comprehensive test coverage
group('GetCurrentWeatherUseCase', () {
  late GetCurrentWeatherUseCase useCase;
  late MockWeatherRepository mockRepository;
  
  setUp(() {
    mockRepository = MockWeatherRepository();
    useCase = GetCurrentWeatherUseCase(mockRepository);
  });
  
  test('should return weather entity when repository call succeeds', () async {
    // Arrange
    const city = 'London';
    final expectedWeather = WeatherEntity(/* ... */);
    when(() => mockRepository.getCurrentWeather(city))
        .thenAnswer((_) async => expectedWeather);
    
    // Act
    final result = await useCase.execute(city);
    
    // Assert
    expect(result, equals(expectedWeather));
    verify(() => mockRepository.getCurrentWeather(city)).called(1);
  });
  
  test('should throw exception when repository call fails', () async {
    // Arrange
    const city = 'London';
    when(() => mockRepository.getCurrentWeather(city))
        .thenThrow(NetworkException('Connection failed'));
    
    // Act & Assert
    expect(
      () => useCase.execute(city),
      throwsA(isA<NetworkException>()),
    );
  });
});
```

## 📝 Git Workflow

### **Branch Naming Convention**

```bash
# Feature branches
feature/weather-ui-redesign
feature/offline-support
feature/push-notifications

# Bug fix branches
bugfix/location-permission-crash
bugfix/api-timeout-handling

# Hotfix branches
hotfix/critical-crash-fix
hotfix/security-patch

# Documentation branches
docs/api-documentation
docs/architecture-guide

# Chore branches
chore/dependency-updates
chore/ci-improvements
```

### **Commit Message Convention**

Chúng tôi sử dụng [Conventional Commits](https://www.conventionalcommits.org/):

```bash
# Format
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]

# Types
feat: A new feature
fix: A bug fix
docs: Documentation only changes
style: Changes that do not affect the meaning of code
refactor: A code change that neither fixes a bug nor adds a feature
perf: A code change that improves performance
test: Adding missing tests or correcting existing tests
chore: Changes to the build process or auxiliary tools

# Examples
feat(weather): add 7-day forecast display
fix(location): resolve GPS permission crash on Android
docs(readme): update installation instructions
style(weather): format weather display components
refactor(api): extract weather service interface
test(weather): add unit tests for weather bloc
chore(deps): update flutter to 3.29.3

# With scope and breaking change
feat(api)!: change weather API response format

BREAKING CHANGE: Weather API now returns temperature in Celsius only.
Migration guide: Convert existing Fahrenheit values using formula.
```

### **Pull Request Process**

#### 1. **PR Title**
```
feat(weather): add hourly forecast display

- Implement hourly weather forecast UI
- Add swipe navigation between hourly items  
- Include weather icons for each hour
- Add responsive design for different screen sizes

Closes #123
```

#### 2. **PR Description Template**

```markdown
## 📝 Description
Brief description of changes made.

## 🎯 Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)  
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Performance improvement
- [ ] Code refactoring

## 🧪 Testing
- [ ] Unit tests added/updated
- [ ] Widget tests added/updated  
- [ ] Integration tests added/updated
- [ ] Manual testing completed

## 📱 Screenshots/Videos
Add screenshots or videos demonstrating the changes (if applicable).

## ✅ Checklist
- [ ] Code follows the project's style guidelines
- [ ] Self-review completed
- [ ] Comments added to hard-to-understand areas
- [ ] Documentation updated (if needed)
- [ ] No new warnings introduced
- [ ] Tests added for new functionality
- [ ] All tests pass locally

## 🔗 Related Issues
Closes #issue_number
Related to #issue_number

## 🚀 Deployment Notes
Any special deployment considerations.
```

### 3. **Review Process**

#### Code Review Checklist:

**🏗️ Architecture & Design**
- [ ] Follows Clean Architecture principles
- [ ] Proper layer separation maintained
- [ ] Dependencies point inward only
- [ ] SOLID principles followed

**💻 Code Quality**
- [ ] Code is readable and well-documented
- [ ] Functions are small and focused
- [ ] Variable/function names are descriptive  
- [ ] No code duplication
- [ ] Error handling is comprehensive

**🧪 Testing**
- [ ] Unit tests cover new functionality
- [ ] Tests are independent and deterministic
- [ ] Test names are descriptive
- [ ] Edge cases are covered

**📚 Documentation**
- [ ] README updated if needed
- [ ] Code comments explain "why", not "what"
- [ ] API documentation updated
- [ ] CHANGELOG updated

**🚀 Performance**
- [ ] No performance regressions
- [ ] Efficient algorithms used
- [ ] Memory leaks avoided
- [ ] Bundle size impact minimal

## 🎯 Specific Contribution Areas

### 🧠 **Domain Layer Contributions**

```dart
// When adding new use cases:
class GetWeatherAlertsUseCase {
  final WeatherRepository _repository;
  final LocationRepository _locationRepository;
  
  GetWeatherAlertsUseCase(this._repository, this._locationRepository);
  
  Future<List<WeatherAlert>> execute() async {
    // 1. Get current location
    final location = await _locationRepository.getCurrentLocation();
    
    // 2. Fetch weather alerts for location
    final alerts = await _repository.getWeatherAlerts(
      latitude: location.latitude,
      longitude: location.longitude,
    );
    
    // 3. Filter severe alerts only
    return alerts.where((alert) => alert.severity == Severity.severe).toList();
  }
}

// Add comprehensive tests
group('GetWeatherAlertsUseCase', () {
  // ... test coverage for all scenarios
});
```

### 🗄️ **Data Layer Contributions**

```dart
// When adding new API endpoints:
@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5')
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) = _WeatherApiService;
  
  @GET('/weather')
  Future<WeatherResponse> getCurrentWeather(
    @Query('q') String city,
    @Query('appid') String apiKey,
    @Query('units') String units,
  );
  
  // New endpoint
  @GET('/alerts')
  Future<WeatherAlertsResponse> getWeatherAlerts(
    @Query('lat') double latitude,
    @Query('lon') double longitude,
    @Query('appid') String apiKey,
  );
}

// Add corresponding mappers
class WeatherAlertsMapper {
  static List<WeatherAlert> toEntities(WeatherAlertsResponse response) {
    return response.alerts.map((alert) => WeatherAlert(
      title: alert.event,
      description: alert.description,
      severity: _mapSeverity(alert.severity),
      startTime: DateTime.fromMillisecondsSinceEpoch(alert.start * 1000),
      endTime: DateTime.fromMillisecondsSinceEpoch(alert.end * 1000),
    )).toList();
  }
  
  static Severity _mapSeverity(String apiSeverity) {
    switch (apiSeverity.toLowerCase()) {
      case 'minor': return Severity.minor;
      case 'moderate': return Severity.moderate;
      case 'severe': return Severity.severe;
      case 'extreme': return Severity.extreme;
      default: return Severity.unknown;
    }
  }
}
```

### 📱 **Presentation Layer Contributions**

```dart
// When adding new UI components:
class WeatherAlertCard extends StatelessWidget {
  final WeatherAlert alert;
  final VoidCallback? onTap;
  
  const WeatherAlertCard({
    Key? key,
    required this.alert,
    this.onTap,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getAlertColor(alert.severity),
      child: ListTile(
        leading: Icon(_getAlertIcon(alert.severity)),
        title: Text(alert.title),
        subtitle: Text(alert.description),
        trailing: Text(_formatTime(alert.startTime)),
        onTap: onTap,
      ),
    );
  }
  
  // Private helper methods...
}

// Add widget tests
group('WeatherAlertCard', () {
  testWidgets('displays alert information correctly', (tester) async {
    final alert = WeatherAlert(/* test data */);
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WeatherAlertCard(alert: alert),
        ),
      ),
    );
    
    expect(find.text(alert.title), findsOneWidget);
    expect(find.text(alert.description), findsOneWidget);
  });
});
```

## 🔧 Development Tools

### **Recommended VS Code Extensions**

```json
// .vscode/extensions.json
{
  "recommendations": [
    "dart-code.dart-code",
    "dart-code.flutter", 
    "bradlc.vscode-tailwindcss",
    "usernamehw.errorlens",
    "christian-kohler.path-intellisense",
    "ms-vscode.vscode-json"
  ]
}
```

### **Code Generation Helpers**

```bash
# Useful commands for contributors
make generate          # Generate all code
make test_watch        # Run tests in watch mode
make format_fix        # Auto-fix formatting
make analyze_fix       # Auto-fix analyzer issues
make clean_build       # Clean and rebuild everything
```

## 📊 Performance Guidelines

### **Performance Targets**

```yaml
Performance Targets:
  App Startup: < 3 seconds (cold start)
  API Response: < 2 seconds (weather data)
  UI Response: < 16ms (60fps)
  Memory Usage: < 150MB (typical usage)
  APK Size: < 50MB (release build)
  Battery Impact: Minimal (background usage)
```

### **Performance Testing**

```dart
// Example performance test
void main() {
  group('Weather API Performance', () {
    test('getCurrentWeather should complete within 2 seconds', () async {
      final stopwatch = Stopwatch()..start();
      
      await weatherRepository.getCurrentWeather('London');
      
      stopwatch.stop();
      expect(stopwatch.elapsedMilliseconds, lessThan(2000));
    });
  });
}
```

## 🎨 UI/UX Guidelines

### **Design Principles**

1. **Material Design 3**: Follow latest Material Design principles
2. **Accessibility**: Support screen readers, appropriate contrast ratios
3. **Responsive**: Support different screen sizes and orientations
4. **Intuitive**: Clear navigation and user flows
5. **Consistent**: Unified design language throughout app

### **UI Components Standards**

```dart
// Follow established component patterns
class WeatherDisplay extends StatelessWidget {
  final WeatherEntity weather;
  final VoidCallback? onRefresh;
  
  const WeatherDisplay({
    Key? key,
    required this.weather,
    this.onRefresh,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Temperature display
        Text(
          '${weather.temperature.round()}°C',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        
        // Weather condition
        Text(
          weather.condition.displayName,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        
        // Refresh button
        if (onRefresh != null)
          ElevatedButton.icon(
            onPressed: onRefresh,
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
          ),
      ],
    );
  }
}
```

## 🐛 Debugging Guidelines

### **Debugging Best Practices**

```dart
// Use proper logging
import 'package:shared/shared.dart';

class WeatherRepository {
  static const _logger = Log('WeatherRepository');
  
  Future<WeatherEntity> getCurrentWeather(String city) async {
    _logger.debug('Fetching weather for city: $city');
    
    try {
      final response = await _apiService.getCurrentWeather(city);
      _logger.info('Successfully fetched weather for $city');
      return WeatherMapper.toEntity(response);
    } catch (e, stackTrace) {
      _logger.error('Failed to fetch weather for $city', e, stackTrace);
      rethrow;
    }
  }
}
```

### **Common Issues & Solutions**

```bash
# Build issues
flutter clean
make clean
make sync

# Dependency conflicts  
melos clean
melos bootstrap

# Code generation issues
make generate
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## 📞 Getting Help

### **Communication Channels**

- **GitHub Issues**: Bug reports và feature requests
- **GitHub Discussions**: General discussions và questions
- **Pull Requests**: Code review và feedback
- **Documentation**: README và architecture guides

### **Response Times**

- **Bug reports**: Phản hồi trong 24-48 hours
- **Feature requests**: Review trong 1-2 weeks
- **Pull requests**: Initial review trong 2-3 days
- **Questions**: Response trong 24 hours

## 🙏 Recognition

Chúng tôi ghi nhận mọi đóng góp! Contributors sẽ được:

- **Listed** trong CONTRIBUTORS.md file
- **Mentioned** trong release notes
- **Credited** trong app about section
- **Recognized** trong project documentation

## 📄 Code of Conduct

Dự án này tuân theo [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). Bằng cách participate, bạn được expect tuân theo code này.

### **Our Standards**

- **Be respectful** trong mọi interactions
- **Be constructive** trong feedback và criticism  
- **Be inclusive** và welcome newcomers
- **Be patient** với những người học hỏi
- **Be collaborative** trong problem solving

---

**Cảm ơn bạn đã đóng góp cho Project Weather App! 🌤️**

> 💡 **Tip**: Bắt đầu với [good first issue](https://github.com/project/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22) để familiar với codebase!
