import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum DialogType { android, ios, adaptive }

class DialogButton {
  final String? text;
  final VoidCallback? onPressed;
  final bool isDestructive;
  final bool isDefault;

  const DialogButton({
    this.text,
    this.onPressed,
    this.isDestructive = false,
    this.isDefault = false,
  });
}

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    this.dialogType = DialogType.adaptive,
    this.title,
    this.content,
    this.actions = const <DialogButton>[],
    super.key,
  });

  const CommonDialog.android({
    String? title,
    String? content,
    List<DialogButton> actions = const <DialogButton>[],
    Key? key,
  }) : this(
         dialogType: DialogType.android,
         title: title,
         content: content,
         actions: actions,
         key: key,
       );

  const CommonDialog.ios({
    String? title,
    String? content,
    List<DialogButton> actions = const <DialogButton>[],
    Key? key,
  }) : this(
         dialogType: DialogType.ios,
         title: title,
         content: content,
         actions: actions,
         key: key,
       );

  const CommonDialog.adaptive({
    String? title,
    String? content,
    List<DialogButton> actions = const <DialogButton>[],
    Key? key,
  }) : this(
         dialogType: DialogType.adaptive,
         title: title,
         content: content,
         actions: actions,
         key: key,
       );

  final DialogType dialogType;
  final String? title;
  final String? content;
  final List<DialogButton> actions;

  @override
  Widget build(BuildContext context) {
    switch (dialogType) {
      case DialogType.android:
        return _buildAndroidDialog(context);
      case DialogType.ios:
        return _buildIosDialog(context);
      case DialogType.adaptive:
        return Platform.isIOS
            ? _buildIosDialog(context)
            : _buildAndroidDialog(context);
    }
  }

  Widget _buildAndroidDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: content != null ? Text(content!) : null,
      actions:
          actions
              .map(
                (action) => TextButton(
                  onPressed: action.onPressed,
                  child: Text(
                    action.text ?? l10n.ok,
                    style: TextStyle(
                      color:
                          action.isDestructive
                              ? Theme.of(context).colorScheme.error
                              : null,
                      fontWeight:
                          action.isDefault
                              ? FontWeight.bold
                              : FontWeight.normal,
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildIosDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CupertinoAlertDialog(
      title: title != null ? Text(title!) : null,
      content: content != null ? Text(content!) : null,
      actions:
          actions
              .map(
                (action) => CupertinoDialogAction(
                  onPressed: action.onPressed,
                  isDestructiveAction: action.isDestructive,
                  isDefaultAction: action.isDefault,
                  child: Text(action.text ?? l10n.ok),
                ),
              )
              .toList(),
    );
  }

  // Static helper methods
  static Future<void> showInfo({
    required BuildContext context,
    required String title,
    required String message,
    String? okText,
    VoidCallback? onOk,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return showDialog<void>(
      context: context,
      builder:
          (context) => CommonDialog.adaptive(
            title: title,
            content: message,
            actions: [
              DialogButton(
                text: okText ?? l10n.ok,
                onPressed: onOk ?? () => Navigator.of(context).pop(),
                isDefault: true,
              ),
            ],
          ),
    );
  }

  static Future<bool?> showConfirm({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return showDialog<bool>(
      context: context,
      builder:
          (context) => CommonDialog.adaptive(
            title: title,
            content: message,
            actions: [
              DialogButton(
                text: cancelText ?? l10n.cancel,
                onPressed: () => Navigator.of(context).pop(false),
              ),
              DialogButton(
                text: confirmText ?? l10n.ok,
                onPressed: () => Navigator.of(context).pop(true),
                isDefault: true,
              ),
            ],
          ),
    );
  }

  static Future<bool?> showDelete({
    required BuildContext context,
    required String title,
    required String message,
    String? deleteText,
    String? cancelText,
  }) {
    final l10n = AppLocalizations.of(context)!;

    return showDialog<bool>(
      context: context,
      builder:
          (context) => CommonDialog.adaptive(
            title: title,
            content: message,
            actions: [
              DialogButton(
                text: cancelText ?? l10n.cancel,
                onPressed: () => Navigator.of(context).pop(false),
              ),
              DialogButton(
                text: deleteText ?? 'Delete',
                onPressed: () => Navigator.of(context).pop(true),
                isDestructive: true,
              ),
            ],
          ),
    );
  }
}
