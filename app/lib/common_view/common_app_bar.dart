import 'package:flutter/material.dart';

enum AppBarType { normal, transparent, gradient }

enum LeadingIcon { none, back, close, menu, custom }

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    this.title,
    this.titleWidget,
    this.leadingIcon = LeadingIcon.back,
    this.leadingWidget,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.centerTitle = true,
    this.automaticallyImplyLeading = true,
    this.appBarType = AppBarType.normal,
    this.gradientColors,
    this.onLeadingPressed,
    this.titleStyle,
    super.key,
  });

  final String? title;
  final Widget? titleWidget;
  final LeadingIcon leadingIcon;
  final Widget? leadingWidget;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final bool centerTitle;
  final bool automaticallyImplyLeading;
  final AppBarType appBarType;
  final List<Color>? gradientColors;
  final VoidCallback? onLeadingPressed;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    Widget? leading;
    switch (leadingIcon) {
      case LeadingIcon.none:
        leading = null;
        break;
      case LeadingIcon.back:
        leading = IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onLeadingPressed ?? () => Navigator.of(context).pop(),
        );
        break;
      case LeadingIcon.close:
        leading = IconButton(
          icon: const Icon(Icons.close),
          onPressed: onLeadingPressed ?? () => Navigator.of(context).pop(),
        );
        break;
      case LeadingIcon.menu:
        leading = IconButton(
          icon: const Icon(Icons.menu),
          onPressed:
              onLeadingPressed ?? () => Scaffold.of(context).openDrawer(),
        );
        break;
      case LeadingIcon.custom:
        leading = leadingWidget;
        break;
    }

    Widget? titleChild;
    if (titleWidget != null) {
      titleChild = titleWidget;
    } else if (title != null) {
      titleChild = Text(
        title!,
        style: titleStyle ?? Theme.of(context).appBarTheme.titleTextStyle,
      );
    }

    AppBar appBar = AppBar(
      title: titleChild,
      leading: leading,
      actions: actions,
      backgroundColor: _getBackgroundColor(context),
      foregroundColor: foregroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading:
          automaticallyImplyLeading && leadingIcon != LeadingIcon.none,
    );

    if (appBarType == AppBarType.gradient && gradientColors != null) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors!,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          title: titleChild,
          leading: leading,
          actions: actions,
          backgroundColor: Colors.transparent,
          foregroundColor: foregroundColor,
          elevation: 0,
          centerTitle: centerTitle,
          automaticallyImplyLeading:
              automaticallyImplyLeading && leadingIcon != LeadingIcon.none,
        ),
      );
    }

    return appBar;
  }

  Color? _getBackgroundColor(BuildContext context) {
    switch (appBarType) {
      case AppBarType.transparent:
        return Colors.transparent;
      case AppBarType.gradient:
        return Colors.transparent;
      case AppBarType.normal:
        return backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
