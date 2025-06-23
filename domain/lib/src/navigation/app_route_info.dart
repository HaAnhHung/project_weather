import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain.dart';

part 'app_route_info.freezed.dart';

/// Weather app routes
@freezed
class AppRouteInfo with _$AppRouteInfo {
  const factory AppRouteInfo.splash() = _Splash;
  const factory AppRouteInfo.weather() = _Weather;
  const factory AppRouteInfo.settings() = _Settings;
  const factory AppRouteInfo.weatherDetail({required WeatherEntity weather}) =
      _WeatherDetail;
}
