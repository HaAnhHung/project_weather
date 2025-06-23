import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'app_event.freezed.dart';

@freezed
class AppEvent extends BaseBlocEvent with _$AppEvent {
  const factory AppEvent.initiated() = AppInitiated;
  const factory AppEvent.themeChanged(bool isDarkMode) = AppThemeChanged;
  const factory AppEvent.localeChanged(String locale) = AppLocaleChanged;
  const factory AppEvent.unitChanged(bool isCelsius) = AppUnitChanged;
}
