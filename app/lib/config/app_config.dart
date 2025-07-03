/// 🔧 App Configuration - Cấu hình ứng dụng
///
/// Class chịu trách nhiệm cấu hình toàn bộ ứng dụng
/// Implement ApplicationConfig pattern để đảm bảo
/// tất cả dependencies và services được khởi tạo đúng cách
///
/// Singleton pattern: Đảm bảo chỉ có 1 instance duy nhất
/// được tạo trong suốt lifecycle của app

import 'package:initializer/initializer.dart';

import '../di/di.dart' as di;

/// 🏗️ App Configuration Singleton
///
/// Quản lý việc cấu hình toàn bộ ứng dụng bao gồm:
/// - Dependency Injection setup
/// - Service initialization
/// - Configuration loading
///
/// Sử dụng factory constructor để implement Singleton pattern
class AppConfig extends ApplicationConfig {
  /// 🏭 Factory constructor để lấy singleton instance
  ///
  /// Returns: Instance duy nhất của AppConfig
  factory AppConfig.getInstance() {
    return _instance;
  }

  /// Private constructor để ngăn việc tạo instance từ bên ngoài
  AppConfig._();

  /// Singleton instance được tạo một lần duy nhất
  static final AppConfig _instance = AppConfig._();

  /// 🚀 Cấu hình ứng dụng
  ///
  /// Override method từ ApplicationConfig để implement
  /// logic cấu hình cụ thể cho Weather App
  ///
  /// Thực hiện:
  /// - Cấu hình dependency injection
  /// - Khởi tạo các services cần thiết
  /// - Load configurations từ environment
  @override
  Future<void> config() async {
    // Cấu hình dependency injection cho toàn bộ app
    // Đăng ký tất cả dependencies cần thiết
    di.configureInjection();
  }
}
