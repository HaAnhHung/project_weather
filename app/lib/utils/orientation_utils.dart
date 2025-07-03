/// 📱 Orientation Utilities
///
/// Utility class để quản lý orientation của app
/// Cung cấp các method để lock/unlock orientation modes

import 'package:flutter/services.dart';

class OrientationUtils {
  /// Lock app ở portrait mode (dọc)
  static Future<void> lockPortrait() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Lock app ở landscape mode (ngang)
  static Future<void> lockLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  /// Lock app chỉ ở portrait up (không cho phép lộn ngược)
  static Future<void> lockPortraitUp() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  /// Unlock tất cả orientations
  static Future<void> unlockAll() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  /// Reset về default portrait mode
  static Future<void> resetToPortrait() async {
    await lockPortrait();
  }
}
