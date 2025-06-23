import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState extends BaseBlocState with _$SettingsState {
  const factory SettingsState({@Default(true) bool isCelsius}) = _SettingsState;
}
