// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/src/di/data_module.dart' as _i797;
import 'package:data/src/repository/source/preference/app_preferences.dart'
    as _i28;
import 'package:data/src/weather/weather_repository_impl.dart' as _i453;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => dataModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i28.AppPreferences>(
        () => _i28.AppPreferences(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i494.WeatherRepository>(
        () => _i453.WeatherRepositoryImpl());
    return this;
  }
}

class _$DataModule extends _i797.DataModule {}
