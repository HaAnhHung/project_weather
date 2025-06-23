# Changelog - Shared Package

Tất cả các thay đổi quan trọng của package shared sẽ được ghi lại trong file này.

Định dạng dựa trên [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
và project này tuân thủ [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2025-05-30

### ✨ Added (Thêm mới)
- **Constants**: Các hằng số dùng chung across toàn bộ application
  - `ApiConstants` - API configuration và endpoints
  - `UIConstants` - UI spacing, animations, và design tokens
  - `NetworkConstants` - Timeout và retry configurations
- **Extensions**: Mở rộng functionality cho built-in types
  - `StringExtensions` - String manipulation utilities
  - `DateTimeExtensions` - Date formatting và comparison
  - `NumExtensions` - Number formatting và calculations
- **Utils**: Utility functions và helper methods
  - Collection utilities cho List và Map operations
  - Date/time utilities cho formatting
  - Validation utilities cho input checking
- **Widgets**: Shared UI components
  - Common widgets được sử dụng across multiple screens
  - Reusable components với consistent styling
- **Mixins**: Reusable functionality mixins
  - Logging mixin cho consistent logging
  - Validation mixin cho form validation
- **Configuration**: App-wide configuration classes
  - Environment configuration
  - Feature flags support

### 🎨 UI Components (Components UI)
- Shared design system components
- Consistent spacing và color schemes
- Reusable widgets với customizable properties
- Accessibility support

### 🔧 Utilities (Tiện ích)
- **String Processing**: Capitalization, validation, formatting
- **Date/Time**: Formatting, comparison, timezone handling
- **Collections**: Safe operations, filtering, mapping
- **Validation**: Email, phone, required field validation

### 📱 Cross-Platform Support (Hỗ trợ đa nền tảng)
- Platform-agnostic utilities
- No platform-specific dependencies
- Pure Dart implementations

### 🏗️ Architecture (Kiến trúc)
- Innermost layer trong Clean Architecture
- No business logic dependencies
- Pure utility functions
- Zero coupling với domain hay data layers

### 🧪 Testing (Testing)
- Unit tests cho tất cả utilities
- Extension method testing
- Widget testing cho shared components
- Performance testing cho utility functions

### 🔧 Technical Details (Chi tiết kỹ thuật)
- **Language**: Dart 3.7+
- **Dependencies**: Minimal dependencies (Flutter core only)
- **Annotations**: 
  - `freezed_annotation` cho code generation
  - `json_annotation` cho serialization
- **No External Dependencies**: Để đảm bảo stability và performance

### 📚 Documentation (Tài liệu)
- README.md comprehensive với Vietnamese documentation
- Usage examples cho tất cả utilities
- Best practices và coding standards
- Contributing guidelines

### ♻️ Reusability (Tái sử dụng)
- Code được thiết kế để reuse across multiple projects
- Generic implementations
- Configurable components
- No project-specific logic
