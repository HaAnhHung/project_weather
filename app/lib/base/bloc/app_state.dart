import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'app_state.freezed.dart';

@freezed
class AppState extends BaseBlocState with _$AppState {
  const factory AppState({
    @Default(false) bool isDarkMode,
    @Default('en') String locale,
    @Default(false) bool isInitialized,
    @Default(true) bool isCelsius,
  }) = _AppState;
}
