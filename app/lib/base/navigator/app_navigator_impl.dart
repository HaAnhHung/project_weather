import 'package:flutter/material.dart' as material;
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'app_navigator.dart';

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator with LogMixin {
  final material.GlobalKey<material.NavigatorState> navigatorKey;

  AppNavigatorImpl({required this.navigatorKey});

  material.NavigatorState? get _navigator => navigatorKey.currentState;

  @override
  Future<bool> replace(route) async {
    if (_navigator == null) return false;

    _navigator!.pushReplacement(material.MaterialPageRoute(builder: (context) => route));

    return true;
  }

  @override
  void pop() {
    if (_navigator?.canPop() == true) {
      _navigator!.pop();
    }
  }

  @override
  Future<void> showDialog(popupInfo) async {
    if (_navigator == null) return;

    await material.showDialog<dynamic>(
      context: _navigator!.context,
      builder: (context) => popupInfo,
    );
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    if (_navigator == null) return;

    final messenger = material.ScaffoldMessenger.of(_navigator!.context);
    messenger.showSnackBar(
      material.SnackBar(
        content: material.Text(message),
        backgroundColor: material.Colors.red,
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }
}
