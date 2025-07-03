/// 🌤️ Weather App - Main Entry Point
///
/// File chính của ứng dụng thời tiết Flutter
/// Chịu trách nhiệm khởi tạo app, cấu hình theme, và quản lý state toàn cục
///
/// Architecture: Clean Architecture với BLoC pattern
/// Author: Weather Team
/// Created: 2025

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:initializer/initializer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'base/base_page_state.dart';
import 'base/bloc/app_bloc.dart';
import 'base/bloc/app_event.dart';
import 'base/bloc/app_state.dart';
import 'config/app_config.dart';
import 'navigation/routes/app_router.dart';
import 'navigation/observer/app_navigator_observer.dart';
import 'resource/theme/weather_theme.dart';
import 'resource/dimens/app_dimen.dart';
import 'utils/orientation_utils.dart';
import 'package:shared/shared.dart';

/// Biến môi trường để xác định flavor của app (develop, staging, production)
/// Sử dụng compile-time constant để tối ưu performance
const String _flavor = String.fromEnvironment(
  'FLAVOR',
  defaultValue: 'develop',
);

/// 🚀 Entry point chính của ứng dụng
///
/// Sử dụng runZonedGuarded để catch tất cả uncaught exceptions
/// và report chúng thông qua Crashlytics
void main() => runZonedGuarded(_runMyApp, _reportError);

/// 🔧 Khởi tạo ứng dụng
///
/// Thực hiện các bước sau:
/// 1. Đảm bảo Flutter widgets đã được khởi tạo
/// 2. Khởi tạo Firebase (commented out)
/// 3. Khởi tạo dependency injection và configurations
/// 4. Chạy app với flavor được chỉ định
Future<void> _runMyApp() async {
  // Đảm bảo Flutter engine đã sẵn sàng trước khi khởi tạo
  WidgetsFlutterBinding.ensureInitialized();

  // Thiết lập orientation chỉ cho phép portrait mode
  await OrientationUtils.lockPortrait();

  // TODO: Uncomment khi integrate Firebase
  // await Firebase.initializeApp();

  // Khởi tạo tất cả dependencies, configurations và services
  await AppInitializer(AppConfig.getInstance()).init();

  // Chạy app với flavor configuration
  runApp(MyApp(flavor: _flavor));
}

/// 📊 Error reporter cho uncaught exceptions
///
/// Tất cả lỗi không được handle sẽ được catch ở đây
/// và report lên monitoring service (Firebase Crashlytics)
///
/// Parameters:
/// - [error]: Object lỗi được throw
/// - [stackTrace]: Stack trace của lỗi
void _reportError(Object error, StackTrace stackTrace) {
  // Log lỗi locally cho debugging
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // TODO: Report lỗi lên Firebase Crashlytics
  // FirebaseCrashlytics.instance.recordError(error, stackTrace);
}

/// 🏠 Root widget của ứng dụng
///
/// StatelessWidget đơn giản chỉ để pass flavor config
/// và delegate việc build UI cho AppView
class MyApp extends StatelessWidget {
  /// Flavor của app (develop, staging, production)
  final String flavor;

  const MyApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

/// 🎨 Main App View - Quản lý UI và state toàn cục
///
/// StatefulWidget chính của app, chịu trách nhiệm:
/// - Quản lý AppBloc cho state toàn cục
/// - Cấu hình theme (light/dark mode)
/// - Cấu hình localization (đa ngôn ngữ)
/// - Cấu hình routing và navigation
/// - Responsive design với ScreenUtil
class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

/// 🔄 State implementation cho AppView
///
/// Extends BasePageState để sử dụng shared functionality
/// và integrate với AppBloc pattern
class _AppViewState extends BasePageState<AppView, AppBloc> {
  /// Router instance từ dependency injection
  /// Quản lý tất cả navigation trong app
  final _appRouter = GetIt.instance.get<AppRouter>();

  /// Flag đánh dấu đây là root widget của app
  /// Để BasePageState biết cách handle lifecycle
  @override
  bool get isAppWidget => true;

  /// 🔧 Khởi tạo state và trigger app initialization
  @override
  void initState() {
    super.initState();
    // Trigger AppBloc để bắt đầu khởi tạo app
    bloc.add(const AppEvent.initiated());
  }

  /// 🎨 Build main app UI với theme và routing
  ///
  /// Cấu hình:
  /// - Responsive design với ScreenUtilInit
  /// - Theme management (light/dark)
  /// - Localization support
  /// - Auto Route navigation
  /// - Navigator observers for analytics
  @override
  Widget buildPage(BuildContext context) {
    // Khởi tạo AppDimen cho responsive design calculations
    AppDimen.of(context);

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return ScreenUtilInit(
          // Design size reference (iPhone X)
          designSize: const Size(375, 812),
          minTextAdapt: true, // Đảm bảo text luôn readable
          splitScreenMode: true, // Hỗ trợ split screen
          builder: (context, child) {
            return MaterialApp.router(
              // App title hiển thị trong task switcher
              title: 'Weather App',

              // Theme configuration
              theme: WeatherTheme.lightTheme,
              darkTheme: WeatherTheme.darkTheme,
              themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,

              // Localization configuration
              locale: Locale(appState.locale),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,

              // Auto Route configuration
              routerDelegate: _appRouter.delegate(
                navigatorObservers: () => [AppNavigatorObserver()],
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),

              // Tắt debug banner trong production
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
