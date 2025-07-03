/// 💉 Dependency Injection - App layer DI configuration
///
/// Chức năng:
/// - Đăng ký tất cả dependencies của app layer
/// - BLoCs, Services, Repositories auto-injection
/// - GetIt singleton pattern cho toàn app

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

/// Global GetIt instance cho dependency injection
final GetIt getIt = GetIt.instance;

/// Khởi tạo tất cả dependencies đã đăng ký
@injectableInit
void configureInjection() => getIt.init();
