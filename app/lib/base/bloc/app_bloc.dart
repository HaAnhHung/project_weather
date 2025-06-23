import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';
import 'base_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

@LazySingleton()
class AppBloc extends BaseBloc<AppEvent, AppState> {
  final AppPreferences _appPreferences;

  AppBloc(this._appPreferences) : super(const AppState()) {
    on<AppInitiated>(_onAppInitiated);
    on<AppThemeChanged>(_onAppThemeChanged);
    on<AppLocaleChanged>(_onAppLocaleChanged);
    on<AppUnitChanged>(_onAppUnitChanged);
  }

  Future<void> _onAppInitiated(
    AppInitiated event,
    Emitter<AppState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        // Load saved preferences
        final isDarkMode = _appPreferences.isDarkMode;
        final locale = _appPreferences.languageCode;
        final isCelsius = _appPreferences.isCelsius;

        emit(
          state.copyWith(
            isDarkMode: isDarkMode,
            locale: locale,
            isInitialized: true,
            isCelsius: isCelsius,
          ),
        );
      },
      handleLoading: false,
    );
  }

  Future<void> _onAppThemeChanged(
    AppThemeChanged event,
    Emitter<AppState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await _appPreferences.saveIsDarkMode(event.isDarkMode);
        emit(state.copyWith(isDarkMode: event.isDarkMode));
      },
      handleLoading: false,
    );
  }

  Future<void> _onAppLocaleChanged(
    AppLocaleChanged event,
    Emitter<AppState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await _appPreferences.saveLanguageCode(event.locale);
        emit(state.copyWith(locale: event.locale));
      },
      handleLoading: false,
    );
  }

  FutureOr<void> _onAppUnitChanged(
    AppUnitChanged event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(isCelsius: event.isCelsius));
  }
}
