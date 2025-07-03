/// 🚀 Splash Screen - Màn hình khởi động ứng dụng
///
/// Chức năng:
/// - Hiển thị logo và loading animation
/// - Yêu cầu permission location
/// - Lấy vị trí hiện tại của user
/// - Navigate to main weather screen

import 'package:app/resource/dimens/app_dimen.dart';
import 'package:app/resource/dimens/dimens.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:domain/domain.dart';
import '../../base/base_page_state.dart';
import 'bloc/splash_bloc.dart';
import 'bloc/splash_event.dart';
import 'bloc/splash_state.dart';

/// Splash screen với Auto Route navigation
@RoutePage()
class SplashScreen extends StatefulWidget {
  /// Callback khi location đã sẵn sàng
  final void Function(Position position)? onLocationReady;

  /// Callback khi user từ chối permission
  final VoidCallback? onPermissionDenied;

  const SplashScreen({
    super.key,
    this.onLocationReady,
    this.onPermissionDenied,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BasePageState<SplashScreen, SplashBloc> {
  @override
  void initState() {
    super.initState();
    // Start the splash flow through the BLoC
    bloc.add(const SplashEvent.started());
  }

  Future<void> _getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      if (widget.onLocationReady != null) {
        widget.onLocationReady?.call(position);
      } else {
        // Navigate to weather screen using navigator
        navigator.replace(const AppRouteInfo.weather());
      }
    } catch (e) {
      // Fallback to last known position
      try {
        final lastPosition = await Geolocator.getLastKnownPosition();
        if (lastPosition != null) {
          if (widget.onLocationReady != null) {
            widget.onLocationReady?.call(lastPosition);
          } else {
            navigator.replace(const AppRouteInfo.weather());
          }
        } else {
          // Use default location (e.g., London)
          final defaultPosition = Position(
            latitude: 51.5074,
            longitude: -0.1278,
            timestamp: DateTime.now(),
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0,
            floor: null,
            isMocked: false,
            altitudeAccuracy: 0,
            headingAccuracy: 0,
          );
          if (widget.onLocationReady != null) {
            widget.onLocationReady?.call(defaultPosition);
          } else {
            navigator.replace(const AppRouteInfo.weather());
          }
        }
      } catch (fallbackError) {
        // Use default location as last resort
        final defaultPosition = Position(
          latitude: 51.5074,
          longitude: -0.1278,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          floor: null,
          isMocked: false,
          altitudeAccuracy: 0,
          headingAccuracy: 0,
        );
        if (widget.onLocationReady != null) {
          widget.onLocationReady?.call(defaultPosition);
        } else {
          navigator.replace(const AppRouteInfo.weather());
        }
      }
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          requestingPermission: () {},
          permissionGranted: () {
            _getCurrentPosition();
          },
          permissionDenied: () {
            if (widget.onPermissionDenied != null) {
              widget.onPermissionDenied!();
            } else {
              // Use default location when permission is denied
              final defaultPosition = Position(
                latitude: 51.5074,
                longitude: -0.1278,
                timestamp: DateTime.now(),
                accuracy: 0,
                altitude: 0,
                heading: 0,
                speed: 0,
                speedAccuracy: 0,
                floor: null,
                isMocked: false,
                altitudeAccuracy: 0,
                headingAccuracy: 0,
              );
              widget.onLocationReady?.call(defaultPosition);
            }
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              SizedBox(height: Dimens.d16.responsive()),
              BlocBuilder<SplashBloc, SplashState>(
                builder: (context, state) {
                  return Text(
                    state.when(
                      initial: () => 'Initializing...',
                      requestingPermission:
                          () => 'Requesting location permission...',
                      permissionGranted: () => 'Getting your location...',
                      permissionDenied: () => 'Using default location...',
                    ),
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
