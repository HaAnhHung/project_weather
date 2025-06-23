import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldType { text, email, password, number, phone, url, multiline }

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.type = TextFieldType.text,
    this.isRequired = false,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
    this.borderRadius,
    this.fillColor,
    this.borderColor,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.contentPadding,
    super.key,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextFieldType type;
  final bool isRequired;
  final bool isEnabled;
  final bool isReadOnly;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText || widget.type == TextFieldType.password;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      enabled: widget.isEnabled,
      readOnly: widget.isReadOnly,
      autofocus: widget.autofocus,
      obscureText: _obscureText,
      maxLength: widget.maxLength,
      maxLines:
          widget.type == TextFieldType.multiline
              ? (widget.maxLines ?? 4)
              : widget.maxLines,
      minLines: widget.minLines,
      keyboardType: widget.keyboardType ?? _getKeyboardType(),
      textInputAction: widget.textInputAction ?? _getTextInputAction(),
      inputFormatters: widget.inputFormatters ?? _getInputFormatters(),
      style: widget.textStyle ?? theme.textTheme.bodyLarge,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: _getLabelText(),
        hintText: widget.hintText,
        errorText: widget.errorText,
        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        border: _buildBorder(theme),
        enabledBorder: _buildBorder(theme),
        focusedBorder: _buildBorder(theme, isFocused: true),
        errorBorder: _buildBorder(theme, isError: true),
        focusedErrorBorder: _buildBorder(theme, isError: true, isFocused: true),
        disabledBorder: _buildBorder(theme, isDisabled: true),
        labelStyle: widget.labelStyle,
        hintStyle: widget.hintStyle,
        errorStyle: widget.errorStyle,
        contentPadding: widget.contentPadding ?? const EdgeInsets.all(16),
        counterText: widget.maxLength != null ? null : '',
      ),
    );
  }

  String? _getLabelText() {
    if (widget.labelText == null) return null;

    return widget.isRequired ? '${widget.labelText} *' : widget.labelText;
  }

  Widget? _buildSuffixIcon() {
    if (widget.type == TextFieldType.password) {
      return IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }

    return widget.suffixIcon;
  }

  InputBorder _buildBorder(
    ThemeData theme, {
    bool isFocused = false,
    bool isError = false,
    bool isDisabled = false,
  }) {
    Color borderColor;

    if (isError) {
      borderColor = theme.colorScheme.error;
    } else if (isDisabled) {
      borderColor = theme.disabledColor;
    } else if (isFocused) {
      borderColor = theme.colorScheme.primary;
    } else {
      borderColor = widget.borderColor ?? theme.colorScheme.outline;
    }

    return OutlineInputBorder(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor, width: isFocused ? 2 : 1),
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.password:
        return TextInputType.visiblePassword;
      case TextFieldType.number:
        return TextInputType.number;
      case TextFieldType.phone:
        return TextInputType.phone;
      case TextFieldType.url:
        return TextInputType.url;
      case TextFieldType.multiline:
        return TextInputType.multiline;
      case TextFieldType.text:
        return TextInputType.text;
    }
  }

  TextInputAction _getTextInputAction() {
    switch (widget.type) {
      case TextFieldType.multiline:
        return TextInputAction.newline;
      default:
        return TextInputAction.done;
    }
  }

  List<TextInputFormatter>? _getInputFormatters() {
    switch (widget.type) {
      case TextFieldType.number:
        return [FilteringTextInputFormatter.digitsOnly];
      case TextFieldType.phone:
        return [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(15),
        ];
      default:
        return null;
    }
  }
}
