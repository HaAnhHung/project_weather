import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent extends BaseBlocEvent with _$SettingsEvent {
  const factory SettingsEvent.initialize() = SettingsInitialize;
  const factory SettingsEvent.unitChanged(bool isCelsius) = SettingsUnitChanged;
}
