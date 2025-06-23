import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../ui/weather/weather_screen.dart';
import '../../ui/splash/splash_screen.dart';
import '../../ui/settings/settings_screen.dart';
import '../../ui/detail/weather_detail_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@LazySingleton()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, path: '/splash', initial: true),
    AutoRoute(page: WeatherRoute.page, path: '/weather'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
    AutoRoute(page: WeatherDetailRoute.page, path: '/weather-detail'),
  ];
}
