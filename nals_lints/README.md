# 🔍 NALS Lints Package - Custom Dart Linting Rules

## 📖 Mô tả

NALS Lints là package chứa các custom linting rules được thiết kế riêng cho dự án Flutter theo Clean Architecture. Package này cung cấp các quy tắc phân tích code tự động để đảm bảo chất lượng code và tuân thủ best practices của team.

## ✨ Tính năng

- 🎯 **Custom Lint Rules** - 13 custom rules cho Flutter/Dart
- 🔧 **Auto Fix Support** - Tự động sửa lỗi cho hầu hết các rules
- 🏗️ **Architecture Focused** - Tập trung vào Clean Architecture và BLoC pattern
- 📏 **Code Style Enforcement** - Đảm bảo consistency trong code style
- 🚀 **Performance Optimized** - Rules được tối ưu cho performance
- ⚡ **IDE Integration** - Tích hợp với VS Code và Android Studio

## 🏗️ Available Lint Rules

### 1. 🏗️ Architecture Rules

#### `missing_run_bloc_catching`
- **Mô tả**: Use cases phải được execute trong `runBlocCatching` hoặc `runCatching`
- **Auto Fix**: Wrap với `runBlocCatching`
```dart
// ❌ Sai
final result = await useCase.execute(input);

// ✅ Đúng  
runBlocCatching(action: () async {
  final result = await useCase.execute(input);
});
```

#### `missing_build_when`
- **Mô tả**: `BlocBuilder` phải khai báo parameter `buildWhen`
- **Auto Fix**: Thêm `buildWhen` template
```dart
// ❌ Sai
BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) => Widget(),
)

// ✅ Đúng
BlocBuilder<WeatherBloc, WeatherState>(
  buildWhen: (previous, current) => previous.status != current.status,
  builder: (context, state) => Widget(),
)
```

#### `missing_listen_when` 
- **Mô tả**: `BlocListener` phải khai báo parameter `listenWhen`
- **Auto Fix**: Thêm `listenWhen` template

#### `missing_build_when_or_listen_when`
- **Mô tả**: `BlocConsumer` phải khai báo cả `buildWhen` và `listenWhen`
- **Auto Fix**: Thêm cả 2 parameters

### 2. 🎨 UI/UX Rules

#### `avoid_hard_coded_colors`
- **Mô tả**: Tránh hard-code màu sắc, sử dụng `AppColors` thay thế
- **Exception**: `Colors.transparent` được cho phép
```dart
// ❌ Sai
Container(color: Colors.red)
Container(color: Color(0xFF123456))

// ✅ Đúng
Container(color: AppColors.primary)
Container(color: Colors.transparent) // OK
```

#### `avoid_hard_coded_text_style`
- **Mô tả**: Tránh hard-code text styles, sử dụng `AppTextStyles`
```dart
// ❌ Sai
Text('Hello', style: TextStyle(fontSize: 16))

// ✅ Đúng
Text('Hello', style: AppTextStyles.body)
```

#### `missing_calling_responsive`
- **Mô tả**: Dimensions phải sử dụng `responsive()` function
- **Auto Fix**: Thêm `.responsive()`
```dart
// ❌ Sai
width: Dimens.d16

// ✅ Đúng
width: Dimens.d16.responsive()
```

### 3. 📝 Code Quality Rules

#### `avoid_unnecessary_async_function`
- **Mô tả**: Loại bỏ `async` keyword không cần thiết
- **Auto Fix**: Xóa `async` và chuyển return type
```dart
// ❌ Sai
Future<String> getData() async {
  return 'data';
}

// ✅ Đúng
String getData() {
  return 'data';
}
```

#### `prefer_named_parameters`
- **Mô tả**: Functions/constructors >1 parameter nên dùng named parameters
- **Auto Fix**: Convert sang named parameters
- **Exceptions**: 
  - Methods trong Bloc classes (`_onEvent`)
  - `fromJson` constructors
  - Injectable constructors

#### `lines_longer_than_100_chars`
- **Mô tả**: Giới hạn độ dài dòng code <= 100 ký tự
- **Auto Fix**: Format code
- **Exceptions**: Comments, imports, exports, strings

### 4. 🔤 String Utilities

#### `prefer_is_empty_string`
- **Mô tả**: Dùng `isEmpty` thay vì `== ''`
- **Auto Fix**: Replace với `.isEmpty`
```dart
// ❌ Sai
if (text == '') 

// ✅ Đúng  
if (text.isEmpty)
```

#### `prefer_is_not_empty_string`
- **Mô tả**: Dùng `isNotEmpty` thay vì `!= ''`
- **Auto Fix**: Replace với `.isNotEmpty`

### 5. 📝 Documentation Rules

#### `incorrect_todo_comment`
- **Mô tả**: TODO comments phải có format chuẩn
- **Format**: `// TODO(username): description #issue_number`
```dart
// ❌ Sai
// TODO fix this

// ✅ Đúng
// TODO(john_doe): Fix weather API integration #123
```

## 🚀 Cài đặt và Sử dụng

### 1. Thêm vào pubspec.yaml

```yaml
dev_dependencies:
  nals_lints:
    path: ../nals_lints
  custom_lint: ^0.7.0
```

### 2. Cấu hình analysis_options.yaml

```yaml
include: package:nals_lints/analysis_options.yaml

analyzer:
  plugins:
    - custom_lint

linter:
  rules:
    # Disable conflicting rules
    prefer_single_quotes: false
    lines_longer_than_80_chars: false
```

### 3. Chạy analysis

```bash
# Run custom lints
dart run custom_lint

# Run với auto-fix
dart run custom_lint --fix

# Analyze toàn project với Melos
melos run analyze
```

## 🔧 Configuration

### Tùy chỉnh Rules

```yaml
# analysis_options.yaml
custom_lint:
  rules:
    # Disable specific rules
    - avoid_hard_coded_colors: false
    - lines_longer_than_100_chars: false
    
    # Configure rules
    - missing_run_bloc_catching:
        severity: error
    - prefer_named_parameters:
        severity: warning
```

### IDE Integration

#### VS Code
```json
// .vscode/settings.json
{
  "dart.analysisExcludedFolders": [
    "build",
    ".dart_tool"
  ],
  "dart.showTodos": true,
  "dart.lineLength": 100
}
```

#### Android Studio
```xml
<!-- .idea/codeStyles/Project.xml -->
<code_scheme>
  <Dart>
    <option name="RIGHT_MARGIN" value="100" />
    <option name="ALIGN_NAMED_ARGUMENTS" value="true" />
  </Dart>
</code_scheme>
```

## 🧪 Testing

```bash
# Test các lint rules
cd nals_lints
flutter test

# Test với code samples
dart run custom_lint --test-inputs
```

### Test Examples

```dart
// test/lint_rules_test.dart
void main() {
  group('NALS Lint Rules', () {
    test('missing_run_bloc_catching should detect violations', () {
      final code = '''
        await useCase.execute(input);
      ''';
      
      final issues = await runLintRule(MissingRunBlocCatching(), code);
      expect(issues, hasLength(1));
    });
    
    test('avoid_hard_coded_colors should detect violations', () {
      final code = '''
        Container(color: Colors.red);
      ''';
      
      final issues = await runLintRule(AvoidHardCodedColors(), code);
      expect(issues, hasLength(1));
    });
  });
}
```

## 🎯 Best Practices

### 1. Gradual Adoption

```bash
# Áp dụng từng rule một
custom_lint:
  rules:
    - missing_run_bloc_catching: true
    # Thêm dần các rules khác
```

### 2. Team Workflow

```bash
# Pre-commit hook
#!/bin/sh
dart run custom_lint
if [ $? -ne 0 ]; then
  echo "❌ Lint issues found. Please fix before commit."
  exit 1
fi
```

### 3. CI/CD Integration

```yaml
# .github/workflows/ci.yml
- name: Run Custom Lints
  run: |
    dart pub global activate custom_lint
    melos exec -- dart run custom_lint
```

## 🔧 Development

### Thêm Rule mới

1. **Tạo rule class**:
```dart
// lib/src/lints/new_rule.dart
class NewRule extends DartLintRule {
  const NewRule() : super(code: _code);
  
  static const _code = LintCode(
    name: 'new_rule',
    problemMessage: 'Description of the rule',
  );
  
  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // Rule implementation
  }
}
```

2. **Thêm vào plugin**:
```dart
// lib/nals_lints.dart
@override
List<LintRule> getLintRules(CustomLintConfigs configs) {
  return [
    // ...existing rules
    const NewRule(),
  ];
}
```

3. **Viết tests**:
```dart
// test/new_rule_test.dart
void main() {
  group('NewRule', () {
    test('should detect violations', () {
      // Test implementation
    });
  });
}
```

### Rule Architecture

```dart
// Cấu trúc rule pattern
abstract class CustomRule extends DartLintRule {
  // 1. Define lint code
  static const LintCode _code = LintCode(/*...*/);
  
  // 2. Implement analysis logic
  @override
  void run(/*...*/) {
    // Analysis implementation
  }
  
  // 3. Provide auto-fixes (optional)
  @override
  List<Fix> getFixes() => [CustomFix()];
}
```

## 📊 Rule Statistics

| Rule | Auto-Fix | Severity | Category |
|------|----------|----------|----------|
| `missing_run_bloc_catching` | ✅ | Error | Architecture |
| `missing_build_when` | ✅ | Warning | BLoC |
| `avoid_hard_coded_colors` | ❌ | Warning | UI |
| `prefer_named_parameters` | ✅ | Info | Code Style |
| `lines_longer_than_100_chars` | ✅ | Info | Formatting |

## 🤝 Đóng góp

### Workflow

1. **Fork** và **clone** repository
2. **Tạo branch** cho rule mới
3. **Implement** rule với tests
4. **Test** thoroughly với real code
5. **Document** rule usage và examples
6. **Submit** Pull Request

### Guidelines

- Mỗi rule phải có **comprehensive tests**
- Auto-fix phải **safe và accurate**
- Performance impact phải **minimal**
- Documentation phải **clear và có examples**

## 📚 Tài liệu tham khảo

- [Custom Lint Builder](https://pub.dev/packages/custom_lint_builder)
- [Analyzer Package](https://pub.dev/packages/analyzer)
- [AST Visitor Pattern](https://dart.dev/guides/language/language-tour)
- [Dart Linting](https://dart.dev/tools/linter-rules)

---

*Package này đảm bảo code quality và consistency cho toàn bộ Weather App project thông qua automated analysis và auto-fix capabilities.*
