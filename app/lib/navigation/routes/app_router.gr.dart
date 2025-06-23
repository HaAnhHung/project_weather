// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Key? key,
    void Function(Position)? onLocationReady,
    VoidCallback? onPermissionDenied,
    List<PageRouteInfo>? children,
  }) : super(
         SplashRoute.name,
         args: SplashRouteArgs(
           key: key,
           onLocationReady: onLocationReady,
           onPermissionDenied: onPermissionDenied,
         ),
         initialChildren: children,
       );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SplashRouteArgs>(
        orElse: () => const SplashRouteArgs(),
      );
      return SplashScreen(
        key: args.key,
        onLocationReady: args.onLocationReady,
        onPermissionDenied: args.onPermissionDenied,
      );
    },
  );
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.key,
    this.onLocationReady,
    this.onPermissionDenied,
  });

  final Key? key;

  final void Function(Position)? onLocationReady;

  final VoidCallback? onPermissionDenied;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, onLocationReady: $onLocationReady, onPermissionDenied: $onPermissionDenied}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SplashRouteArgs) return false;
    return key == other.key && onPermissionDenied == other.onPermissionDenied;
  }

  @override
  int get hashCode => key.hashCode ^ onPermissionDenied.hashCode;
}

/// generated route for
/// [WeatherDetailScreen]
class WeatherDetailRoute extends PageRouteInfo<WeatherDetailRouteArgs> {
  WeatherDetailRoute({
    Key? key,
    required WeatherEntity weather,
    List<PageRouteInfo>? children,
  }) : super(
         WeatherDetailRoute.name,
         args: WeatherDetailRouteArgs(key: key, weather: weather),
         initialChildren: children,
       );

  static const String name = 'WeatherDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeatherDetailRouteArgs>();
      return WeatherDetailScreen(key: args.key, weather: args.weather);
    },
  );
}

class WeatherDetailRouteArgs {
  const WeatherDetailRouteArgs({this.key, required this.weather});

  final Key? key;

  final WeatherEntity weather;

  @override
  String toString() {
    return 'WeatherDetailRouteArgs{key: $key, weather: $weather}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeatherDetailRouteArgs) return false;
    return key == other.key && weather == other.weather;
  }

  @override
  int get hashCode => key.hashCode ^ weather.hashCode;
}

/// generated route for
/// [WeatherScreen]
class WeatherRoute extends PageRouteInfo<void> {
  const WeatherRoute({List<PageRouteInfo>? children})
    : super(WeatherRoute.name, initialChildren: children);

  static const String name = 'WeatherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WeatherScreen();
    },
  );
}
