# 🛠️ Development Workflow - Project Weather App

## 📖 Tổng quan

Tài liệu này mô tả quy trình phát triển chuẩn cho Weather App project, từ setup môi trường đến submission code và code review process.

## 🏗️ Development Environment Setup

### 1. Initial Setup

```bash
# 1. Clone repository
git clone https://github.com/your-org/project_weather.git
cd project_weather

# 2. Setup Flutter environment
flutter doctor

# 3. Install global tools
dart pub global activate melos 4.1.0
dart pub global activate fvm 3.0.0

# 4. Setup project
make setup
make sync

# 5. Setup IDE extensions
code --install-extension dart-code.dart-code
code --install-extension dart-code.flutter
```

### 2. Environment Variables

```bash
# Copy environment templates
cp .env.example .env.develop
cp .env.example .env.staging
cp .env.example .env.production

# Fill in API keys and configurations
# .env.develop
API_KEY=your_openweather_api_key
API_BASE_URL=https://api.openweathermap.org/data/2.5
ENVIRONMENT=develop
```

### 3. IDE Configuration

#### VS Code Settings

```json
// .vscode/settings.json
{
  "dart.lineLength": 100,
  "dart.showTodos": true,
  "dart.previewLsp": true,
  "dart.analysisExcludedFolders": [
    "build",
    ".dart_tool"
  ],
  "files.associations": {
    "*.arb": "json"
  },
  "editor.rulers": [100],
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": true,
    "source.organizeImports": true
  }
}
```

#### VS Code Extensions

```json
// .vscode/extensions.json
{
  "recommendations": [
    "dart-code.dart-code",
    "dart-code.flutter",
    "ms-vscode.vscode-json",
    "bradlc.vscode-tailwindcss",
    "usernamehw.errorlens",
    "gruntfuggly.todo-tree"
  ]
}
```

## 🔄 Git Workflow

### Branch Strategy

```
📁 Git Branch Model
├── 🚀 main/master     - Production releases
├── 🔄 develop        - Integration branch
├── ✨ feature/*      - New features
├── 🐛 bugfix/*       - Bug fixes
├── 🚑 hotfix/*       - Emergency fixes
└── 🧪 experiment/*   - Experimental features
```

### Branch Naming Convention

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

# Experiment branches
experiment/new-forecast-algorithm
experiment/ml-weather-prediction
```

### Commit Message Convention

```bash
# Format: <type>(<scope>): <description>

# Types
feat: thêm tính năng mới
fix: sửa bug
docs: cập nhật documentation
style: thay đổi formatting, missing semi colons, etc
refactor: refactor code không thay đổi functionality
test: thêm missing tests hoặc correcting existing tests
chore: update grunt tasks etc; no production code change

# Examples
feat(weather): add 7-day forecast display
fix(location): resolve GPS permission crash on Android
docs(readme): update installation instructions
style(weather): format weather display components
refactor(api): extract weather service interface
test(weather): add unit tests for weather bloc
chore(deps): update flutter to 3.29.3
```

## 🧑‍💻 Daily Development Workflow

### 1. Start Development

```bash
# 1. Pull latest changes
git checkout develop
git pull origin develop

# 2. Create feature branch
git checkout -b feature/your-feature-name

# 3. Sync dependencies
make sync

# 4. Run app in development mode
make run_develop
```

### 2. Development Process

```bash
# Hot reload development
flutter run --flavor develop

# Run tests continuously
make test_watch

# Check code quality
make lint
make format
make analyze

# Generate code when needed
make generate
```

### 3. Pre-commit Checklist

```bash
# 1. Format code
make format

# 2. Fix linting issues
make lint_fix

# 3. Run all tests
make test

# 4. Check for unused dependencies
make deps_check

# 5. Verify build
make build_develop
```

## 🔍 Code Quality Standards

### Linting Configuration

```yaml
# analysis_options.yaml
include: package:nals_lints/analysis_options.yaml

analyzer:
  plugins:
    - custom_lint
  strong-mode:
    implicit-casts: false
    implicit-dynamic: false
  errors:
    invalid_annotation_target: ignore
    missing_required_param: error
    missing_return: error

linter:
  rules:
    # Dart Style
    prefer_single_quotes: true
    prefer_relative_imports: true
    
    # Documentation
    public_member_api_docs: false
    
    # Design
    prefer_const_constructors: true
    prefer_const_literals_to_create_immutables: true
```

### Code Review Criteria

#### ✅ Must Have

- [ ] **Tests written** and passing
- [ ] **Documentation** updated
- [ ] **Linting** rules satisfied
- [ ] **Performance** considerations
- [ ] **Security** review completed
- [ ] **Clean Architecture** principles followed

#### 🎯 Code Quality Checks

- [ ] **Single Responsibility** - Classes have single purpose
- [ ] **Dependency Injection** - Proper DI usage
- [ ] **Error Handling** - Comprehensive error management
- [ ] **Null Safety** - Proper null safety implementation
- [ ] **Immutability** - Use immutable data structures
- [ ] **Async Patterns** - Proper async/await usage

## 🧪 Testing Strategy

### Test Structure

```
📁 Testing Hierarchy
├── 🏃‍♂️ Unit Tests        - Business logic testing
├── 🧩 Widget Tests      - UI component testing  
├── 🔄 Integration Tests - E2E workflow testing
└── 📱 Device Tests      - Real device testing
```

### Testing Commands

```bash
# Run all tests
make test

# Run specific test suites
make test_unit
make test_widget
make test_integration

# Run tests with coverage
make test_coverage

# Generate coverage report
make coverage_report

# Test specific package
melos run test --scope=domain
melos run test --scope=data
melos run test --scope=app
```

### Test Conventions

```dart
// test/weather/weather_bloc_test.dart
void main() {
  group('WeatherBloc', () {
    late WeatherBloc weatherBloc;
    late MockWeatherRepository mockRepository;
    
    setUp(() {
      mockRepository = MockWeatherRepository();
      weatherBloc = WeatherBloc(mockRepository);
    });
    
    tearDown(() {
      weatherBloc.close();
    });
    
    group('WeatherRequested', () {
      blocTest<WeatherBloc, WeatherState>(
        'emits [loading, success] when weather is fetched successfully',
        build: () {
          when(() => mockRepository.getCurrentWeather(any()))
              .thenAnswer((_) async => mockWeatherEntity);
          return weatherBloc;
        },
        act: (bloc) => bloc.add(const WeatherRequested('London')),
        expect: () => [
          const WeatherState.loading(),
          WeatherState.success(mockWeatherEntity),
        ],
        verify: (bloc) {
          verify(() => mockRepository.getCurrentWeather('London')).called(1);
        },
      );
    });
  });
}
```

## 📦 Package Management

### Adding Dependencies

```bash
# Add to specific package
cd domain
flutter pub add freezed
flutter pub add --dev build_runner

# Add using melos (recommended)
melos add freezed --scope=domain
melos add build_runner --dev --scope=domain

# Sync all packages
melos clean
melos bootstrap
```

### Version Management

```yaml
# pubspec.yaml version constraints
dependencies:
  flutter:
    sdk: flutter
  bloc: ^8.1.4
  dio: ^5.4.0
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.3
  bloc_test: ^9.1.5
```

## 🏗️ Build and Release Process

### Development Builds

```bash
# Debug builds
flutter run --flavor develop --debug
flutter build apk --flavor develop --debug

# Profile builds (performance testing)
flutter run --flavor develop --profile
flutter build apk --flavor develop --profile

# Release builds (testing)
flutter build apk --flavor develop --release
```

### Code Generation

```bash
# Generate all packages
make generate

# Generate specific types
make json_annotation    # JSON serialization
make injectable        # Dependency injection
make auto_route        # Navigation routes
make l10n             # Internationalization
```

### Build Verification

```bash
# Verify builds work
make verify_build_develop
make verify_build_staging
make verify_build_production

# Check app size
make analyze_size

# Performance profiling
make profile_performance
```

## 🚀 Feature Development Lifecycle

### 1. Planning Phase

```markdown
## Feature: Weather Alerts

### Requirements
- [ ] Push notifications for severe weather
- [ ] User preference settings
- [ ] Location-based alerts
- [ ] Alert history

### Technical Design
- [ ] Add notification service to domain layer
- [ ] Implement push notification data source
- [ ] Create alert settings UI
- [ ] Update weather repository

### Definition of Done
- [ ] Unit tests ≥ 80% coverage
- [ ] Widget tests for new components
- [ ] Integration test for full flow
- [ ] Documentation updated
- [ ] Performance tested
```

### 2. Implementation Phase

```bash
# Create feature branch
git checkout -b feature/weather-alerts

# Implement domain layer first
cd domain
# Add entities, use cases, repositories

# Implement data layer
cd ../data  
# Add models, API services, repositories

# Implement presentation layer
cd ../app
# Add UI, BLoCs, widgets

# Add tests throughout
# Update documentation
```

### 3. Review and Integration

```bash
# Self-review checklist
make pre_commit_check

# Create pull request
git push origin feature/weather-alerts

# Address review feedback
git commit --amend
git push --force-with-lease

# Merge after approval
git checkout develop
git merge feature/weather-alerts
git push origin develop
```

## 🛠️ Debugging and Troubleshooting

### Common Issues

#### Build Issues

```bash
# Clean and rebuild
make clean
make sync
flutter clean
flutter pub get

# Clear caches
dart pub cache clean
flutter pub cache clean

# Regenerate code
make generate

# Check Flutter installation
flutter doctor -v
```

#### Dependency Conflicts

```bash
# Check dependency tree
flutter pub deps

# Override specific versions
# pubspec_overrides.yaml
dependency_overrides:
  collection: ^1.18.0
  
# Force resolution
melos clean && melos bootstrap
```

#### Performance Issues

```bash
# Run in profile mode
flutter run --profile

# Analyze performance
flutter analyze --flutter-repo

# Memory analysis
flutter run --enable-dart-profiling

# Use Flutter Inspector
flutter inspector
```

### Debug Tools

```dart
// Debug utilities
class DebugUtils {
  static void logApiCall(String endpoint, dynamic data) {
    if (kDebugMode) {
      print('🌐 API Call: $endpoint');
      print('📤 Request: $data');
    }
  }
  
  static void logBlocEvent(String bloc, dynamic event) {
    if (kDebugMode) {
      print('🔄 $bloc: $event');
    }
  }
}
```

## 📊 Performance Monitoring

### Development Metrics

```bash
# Build time tracking
time make sync
time flutter build apk --flavor develop

# Test execution time
time make test

# Bundle size analysis
flutter build apk --analyze-size
```

### Performance Targets

```yaml
Performance Targets:
  App Startup: < 3 seconds
  API Response: < 2 seconds  
  Memory Usage: < 100MB
  APK Size: < 50MB
  Test Suite: < 2 minutes
  Build Time: < 5 minutes
```

## 🤝 Team Collaboration

### Code Review Process

```markdown
1. **Create PR** with descriptive title and description
2. **Self-review** using checklist
3. **Assign reviewers** (minimum 2)
4. **Address feedback** promptly
5. **Re-request review** after changes
6. **Merge** after approval
7. **Delete branch** after merge
```

### Review Guidelines

#### For Authors
- [ ] Test changes locally
- [ ] Add comprehensive description
- [ ] Include screenshots for UI changes
- [ ] Reference related issues
- [ ] Keep PRs focused and small

#### For Reviewers
- [ ] Check for architectural compliance
- [ ] Verify test coverage
- [ ] Review performance impact
- [ ] Check error handling
- [ ] Validate security considerations

### Communication

```markdown
Daily Standup Format:
✅ **Yesterday**: What did you complete?
🔄 **Today**: What will you work on?
🚫 **Blockers**: Any impediments?
📋 **Notes**: Additional context
```

---

**💡 Pro Tips**:
- Use `make help` to see all available commands
- Keep commits small and focused
- Write tests first (TDD approach)
- Document complex business logic
- Use debugger instead of print statements
- Profile performance regularly
