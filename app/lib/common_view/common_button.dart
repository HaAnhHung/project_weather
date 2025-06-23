import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, outlined, text, icon }

enum ButtonSize { small, medium, large }

class CommonButton extends StatelessWidget {
  const CommonButton({
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.height,
    this.textStyle,
    super.key,
  });

  const CommonButton.primary({
    required String text,
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         type: ButtonType.primary,
         size: size,
         isLoading: isLoading,
         isDisabled: isDisabled,
         icon: icon,
         backgroundColor: backgroundColor,
         foregroundColor: foregroundColor,
         borderRadius: borderRadius,
         width: width,
         height: height,
         key: key,
       );

  const CommonButton.secondary({
    required String text,
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? icon,
    Color? backgroundColor,
    Color? foregroundColor,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         type: ButtonType.secondary,
         size: size,
         isLoading: isLoading,
         isDisabled: isDisabled,
         icon: icon,
         backgroundColor: backgroundColor,
         foregroundColor: foregroundColor,
         borderRadius: borderRadius,
         width: width,
         height: height,
         key: key,
       );

  const CommonButton.outlined({
    required String text,
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? icon,
    Color? foregroundColor,
    Color? borderColor,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         type: ButtonType.outlined,
         size: size,
         isLoading: isLoading,
         isDisabled: isDisabled,
         icon: icon,
         foregroundColor: foregroundColor,
         borderColor: borderColor,
         borderRadius: borderRadius,
         width: width,
         height: height,
         key: key,
       );

  const CommonButton.text({
    required String text,
    required VoidCallback? onPressed,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isDisabled = false,
    Widget? icon,
    Color? foregroundColor,
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Key? key,
  }) : this(
         text: text,
         onPressed: onPressed,
         type: ButtonType.text,
         size: size,
         isLoading: isLoading,
         isDisabled: isDisabled,
         icon: icon,
         foregroundColor: foregroundColor,
         borderRadius: borderRadius,
         width: width,
         height: height,
         key: key,
       );

  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEnabled = !isDisabled && !isLoading && onPressed != null;

    final buttonSize = _getButtonSize();
    final buttonStyle = _getButtonStyle(theme, isEnabled);

    Widget child = _buildButtonChild(context);

    if (width != null || height != null) {
      child = SizedBox(
        width: width,
        height: height ?? buttonSize.height,
        child: child,
      );
    }

    switch (type) {
      case ButtonType.primary:
        return ElevatedButton(
          onPressed: isEnabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.secondary:
        return FilledButton(
          onPressed: isEnabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: isEnabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.text:
        return TextButton(
          onPressed: isEnabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
      case ButtonType.icon:
        if (icon != null) {
          return IconButton(
            onPressed: isEnabled ? onPressed : null,
            style: buttonStyle,
            icon:
                isLoading
                    ? SizedBox(
                      width: buttonSize.iconSize,
                      height: buttonSize.iconSize,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                    : icon!,
          );
        }
        return TextButton(
          onPressed: isEnabled ? onPressed : null,
          style: buttonStyle,
          child: child,
        );
    }
  }

  Widget _buildButtonChild(BuildContext context) {
    if (isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: _getButtonSize().iconSize,
            height: _getButtonSize().iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 8),
          Text(text, style: textStyle),
        ],
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon!,
          const SizedBox(width: 8),
          Text(text, style: textStyle),
        ],
      );
    }

    return Text(text, style: textStyle);
  }

  ButtonStyle _getButtonStyle(ThemeData theme, bool isEnabled) {
    final buttonSize = _getButtonSize();

    return ButtonStyle(
      backgroundColor:
          backgroundColor != null
              ? WidgetStateProperty.all(backgroundColor!)
              : null,
      foregroundColor:
          foregroundColor != null
              ? WidgetStateProperty.all(foregroundColor!)
              : null,
      side:
          borderColor != null
              ? WidgetStateProperty.all(BorderSide(color: borderColor!))
              : null,
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(
          horizontal: buttonSize.horizontalPadding,
          vertical: buttonSize.verticalPadding,
        ),
      ),
      minimumSize: WidgetStateProperty.all(Size(0, buttonSize.height)),
    );
  }

  _ButtonSize _getButtonSize() {
    switch (size) {
      case ButtonSize.small:
        return const _ButtonSize(
          height: 32,
          horizontalPadding: 12,
          verticalPadding: 6,
          iconSize: 16,
        );
      case ButtonSize.medium:
        return const _ButtonSize(
          height: 40,
          horizontalPadding: 16,
          verticalPadding: 8,
          iconSize: 20,
        );
      case ButtonSize.large:
        return const _ButtonSize(
          height: 48,
          horizontalPadding: 20,
          verticalPadding: 12,
          iconSize: 24,
        );
    }
  }
}

class _ButtonSize {
  final double height;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;

  const _ButtonSize({
    required this.height,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconSize,
  });
}
