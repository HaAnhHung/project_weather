import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'splash_event.freezed.dart';

@freezed
class SplashEvent extends BaseBlocEvent with _$SplashEvent {
  const factory SplashEvent.started() = SplashStarted;
  const factory SplashEvent.permissionRequested() = SplashPermissionRequested;
  const factory SplashEvent.permissionGranted() = SplashPermissionGranted;
  const factory SplashEvent.permissionDenied() = SplashPermissionDenied;
}
