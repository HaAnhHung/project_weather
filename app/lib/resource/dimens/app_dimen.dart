import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceConstants {
  static const double designDeviceWidth = 375.0;
  static const double designDeviceHeight = 812.0;
  static const double maxMobileWidth = 600.0;
  static const double maxTabletWidth = 1024.0;
}

class AppDimen {
  AppDimen._({
    required this.screenWidth,
    required this.screenHeight,
    required this.devicePixelRatio,
    required this.screenType,
  });

  static late AppDimen current;

  final double screenWidth;
  final double screenHeight;
  final double devicePixelRatio;
  final ScreenType screenType;

  static AppDimen of(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);

    final screen = AppDimen._(
      screenWidth: screenWidth,
      screenHeight: screenHeight,
      devicePixelRatio: devicePixelRatio,
      screenType: _getScreenType(screenWidth),
    );

    current = screen;

    return current;
  }

  double responsiveDimens({
    required double mobile,
    double? tablet,
    double? ultraTablet,
  }) {
    switch (screenType) {
      case ScreenType.mobile:
        return mobile.w;
      case ScreenType.tablet:
        return tablet?.w ??
            ((mobile * DeviceConstants.maxMobileWidth) /
                DeviceConstants.designDeviceWidth);
      case ScreenType.ultraTablet:
        return ultraTablet?.w ??
            ((mobile * DeviceConstants.maxMobileWidth) /
                DeviceConstants.designDeviceWidth);
    }
  }

  int responsiveIntValue({required int mobile, int? tablet, int? ultraTablet}) {
    switch (screenType) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet ?? mobile;
      case ScreenType.ultraTablet:
        return ultraTablet ?? mobile;
    }
  }

  static ScreenType _getScreenType(double screenWidth) {
    if (screenWidth <= DeviceConstants.maxMobileWidth) {
      return ScreenType.mobile;
    } else if (screenWidth <= DeviceConstants.maxTabletWidth) {
      return ScreenType.tablet;
    } else {
      return ScreenType.ultraTablet;
    }
  }

  // Weather-specific responsive methods
  double weatherCardPadding() {
    return responsiveDimens(mobile: 16, tablet: 24, ultraTablet: 32);
  }

  double weatherCardRadius() {
    return responsiveDimens(mobile: 24, tablet: 28, ultraTablet: 32);
  }

  double weatherIconSize() {
    return responsiveDimens(mobile: 64, tablet: 80, ultraTablet: 96);
  }

  double temperatureFontSize() {
    return responsiveDimens(mobile: 42, tablet: 52, ultraTablet: 62);
  }

  double forecastCardHeight() {
    return responsiveDimens(mobile: 80, tablet: 100, ultraTablet: 120);
  }

  double settingsCardMargin() {
    return responsiveDimens(mobile: 16, tablet: 24, ultraTablet: 32);
  }

  double logoSize() {
    return responsiveDimens(mobile: 80, tablet: 100, ultraTablet: 120);
  }
}

extension ResponsiveDoubleExtension on double {
  double responsive({double? tablet, double? ultraTablet}) {
    return AppDimen.current.responsiveDimens(
      mobile: this,
      tablet: tablet,
      ultraTablet: ultraTablet,
    );
  }

  SizedBox get vertical => SizedBox(height: h);
  SizedBox get horizontal => SizedBox(width: w);
}

extension ResponsiveIntExtension on int {
  int responsiveInt({int? tablet, int? ultraTablet}) {
    return AppDimen.current.responsiveIntValue(
      mobile: this,
      tablet: tablet,
      ultraTablet: ultraTablet,
    );
  }

  SizedBox get vertical => SizedBox(height: h);
  SizedBox get horizontal => SizedBox(width: w);
}

enum ScreenType { mobile, tablet, ultraTablet }
