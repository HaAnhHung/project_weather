/// 🚀 Splash BLoC - Quản lý flow khởi động app
///
/// Chức năng:
/// - Kiểm tra và yêu cầu location permission
/// - Quản lý trạng thái splash screen
/// - Navigate to main screen sau khi init xong

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import '../../../base/bloc/base_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

/// Splash BLoC với dependency injection
@Injectable()
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initial()) {
    on<SplashStarted>(_onSplashStarted);
    on<SplashPermissionRequested>(_onSplashPermissionRequested);
  }

  /// Handle khi splash bắt đầu
  Future<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        emit(const SplashState.requestingPermission());
        try {
          final permission = await Geolocator.checkPermission();
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever) {
            final requestedPermission = await Geolocator.requestPermission();
            if (requestedPermission == LocationPermission.whileInUse ||
                requestedPermission == LocationPermission.always) {
              emit(const SplashState.permissionGranted());
            } else {
              emit(const SplashState.permissionDenied());
            }
          } else {
            emit(const SplashState.permissionGranted());
          }
        } catch (e) {
          emit(const SplashState.permissionDenied());
        }
      },
      handleLoading: false, // We handle loading states manually
    );
  }

  Future<void> _onSplashPermissionRequested(
    SplashPermissionRequested event,
    Emitter<SplashState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        emit(const SplashState.requestingPermission());
        try {
          final requestedPermission = await Geolocator.requestPermission();
          if (requestedPermission == LocationPermission.whileInUse ||
              requestedPermission == LocationPermission.always) {
            emit(const SplashState.permissionGranted());
          } else {
            emit(const SplashState.permissionDenied());
          }
        } catch (e) {
          emit(const SplashState.permissionDenied());
        }
      },
      handleLoading: false, // We handle loading states manually
    );
  }
}
