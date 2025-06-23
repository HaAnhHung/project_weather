import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../base/base_popup_info_mapper.dart';

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appPopupInfo, AppNavigator navigator) {
    return appPopupInfo.when(
      confirmDialog: (message, onPressed) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onPressed?.call ?? () => navigator.pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
      errorWithRetryDialog: (message, onRetryPressed) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => navigator.pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: onRetryPressed?.call ?? () => navigator.pop(),
              child: const Text('Retry'),
            ),
          ],
        );
      },
      locationPermissionDialog: () {
        return AlertDialog(
          title: const Text('Location Permission'),
          content: const Text(
            'This app needs location permission to show weather data.',
          ),
          actions: [
            TextButton(
              onPressed: () => navigator.pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => navigator.pop(result: true),
              child: const Text('Allow'),
            ),
          ],
        );
      },
    );
  }
}
