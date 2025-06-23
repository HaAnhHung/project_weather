// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app/base/bloc/app_bloc.dart' as _i20;
import 'package:app/base/bloc/common/common_bloc.dart' as _i639;
import 'package:app/base/navigator/app_navigator.dart' as _i503;
import 'package:app/base/navigator/app_navigator_impl.dart' as _i167;
import 'package:app/di/app_module.dart' as _i522;
import 'package:app/navigation/app_navigator_impl.dart' as _i101;
import 'package:app/navigation/base/base_popup_info_mapper.dart' as _i349;
import 'package:app/navigation/base/base_route_info_mapper.dart' as _i541;
import 'package:app/navigation/mapper/app_popup_info_mapper.dart' as _i203;
import 'package:app/navigation/mapper/app_route_info_mapper.dart' as _i48;
import 'package:app/navigation/routes/app_router.dart' as _i931;
import 'package:app/test_injectable.dart' as _i555;
import 'package:app/ui/detail/bloc/detail_bloc.dart' as _i474;
import 'package:app/ui/settings/bloc/settings_bloc.dart' as _i584;
import 'package:app/ui/splash/bloc/splash_bloc.dart' as _i407;
import 'package:app/ui/weather/bloc/weather_bloc.dart' as _i577;
import 'package:data/data.dart' as _i437;
import 'package:domain/domain.dart' as _i494;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i407.SplashBloc>(() => _i407.SplashBloc());
    gh.factory<_i555.TestService>(() => _i555.TestService());
    gh.factory<_i639.CommonBloc>(() => _i639.CommonBloc());
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => appModule.navigatorKey,
    );
    gh.lazySingleton<_i931.AppRouter>(() => _i931.AppRouter());
    gh.lazySingleton<_i503.AppNavigator>(
      () => _i167.AppNavigatorImpl(
        navigatorKey: gh<_i409.GlobalKey<_i409.NavigatorState>>(),
      ),
    );
    gh.lazySingleton<_i20.AppBloc>(
      () => _i20.AppBloc(gh<_i437.AppPreferences>()),
    );
    gh.factory<_i584.SettingsBloc>(
      () => _i584.SettingsBloc(gh<_i437.AppPreferences>()),
    );
    gh.lazySingleton<_i541.BaseRouteInfoMapper>(
      () => _i48.AppRouteInfoMapper(),
    );
    gh.lazySingleton<_i349.BasePopupInfoMapper>(
      () => _i203.AppPopupInfoMapper(),
    );
    gh.lazySingleton<_i555.TestRepository>(
      () => _i555.TestRepository(gh<_i555.TestService>()),
    );
    gh.factory<_i474.DetailBloc>(
      () => _i474.DetailBloc(getCurrentWeather: gh<_i494.GetCurrentWeather>()),
    );
    gh.factory<_i577.WeatherBloc>(
      () => _i577.WeatherBloc(
        getCurrentWeather: gh<_i494.GetCurrentWeather>(),
        get7DayForecast: gh<_i494.Get7DayForecast>(),
      ),
    );
    gh.lazySingleton<_i494.AppNavigator>(
      () => _i101.AppNavigatorImpl(
        gh<_i931.AppRouter>(),
        gh<_i349.BasePopupInfoMapper>(),
        gh<_i541.BaseRouteInfoMapper>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i522.AppModule {}
