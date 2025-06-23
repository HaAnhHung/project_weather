import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState extends BaseBlocState with _$SplashState {
  const factory SplashState.initial() = SplashInitial;
  const factory SplashState.requestingPermission() = SplashRequestingPermission;
  const factory SplashState.permissionGranted() = SplashPermissionGrantedState;
  const factory SplashState.permissionDenied() = SplashPermissionDeniedState;
}
