import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:data/data.dart';
import '../../../base/bloc/app_event.dart';
import '../../../base/bloc/base_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';

@Injectable()
class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  final AppPreferences _appPreferences;

  SettingsBloc(this._appPreferences) : super(const SettingsState()) {
    on<SettingsInitialize>(_onSettingsInitialize);
    on<SettingsUnitChanged>(_onSettingsUnitChanged);

    // Initialize preferences
    add(const SettingsEvent.initialize());
  }

  Future<void> _onSettingsInitialize(
    SettingsInitialize event,
    Emitter<SettingsState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        emit(state.copyWith(isCelsius: _appPreferences.isCelsius));
      },
      handleLoading:
          false, // Settings initialization doesn't need loading states
    );
  }

  Future<void> _onSettingsUnitChanged(
    SettingsUnitChanged event,
    Emitter<SettingsState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        await _appPreferences.saveIsCelsius(event.isCelsius);
        emit(state.copyWith(isCelsius: event.isCelsius));
        appBloc.add(AppEvent.unitChanged(event.isCelsius));
      },
      handleLoading: false,
    );
  }
}
