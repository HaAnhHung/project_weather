import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

part 'app_popup_info.freezed.dart';

/// Weather app popup dialogs
@freezed
class AppPopupInfo with _$AppPopupInfo {
  const factory AppPopupInfo.confirmDialog({
    required String message,
    Func0? onPressed,
  }) = _ConfirmDialog;

  const factory AppPopupInfo.errorWithRetryDialog({
    required String message,
    Func0? onRetryPressed,
  }) = _ErrorWithRetryDialog;

  const factory AppPopupInfo.locationPermissionDialog() =
      _LocationPermissionDialog;
}
