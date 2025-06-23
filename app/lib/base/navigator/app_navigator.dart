abstract class AppNavigator {
  Future<bool> replace(dynamic route);
  void pop();
  Future<void> showDialog(dynamic popupInfo);
  void showErrorSnackBar(String message, {Duration? duration});
}
