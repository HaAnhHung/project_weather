import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../base/base_route_info_mapper.dart';
import '../routes/app_router.dart';

@LazySingleton(as: BaseRouteInfoMapper)
class AppRouteInfoMapper extends BaseRouteInfoMapper {
  @override
  PageRouteInfo map(AppRouteInfo appRouteInfo) {
    return appRouteInfo.when(
      splash: () => SplashRoute(),
      weather: () => WeatherRoute(),
      settings: () => SettingsRoute(),
      weatherDetail: (weather) => WeatherDetailRoute(weather: weather),
    );
  }
}
