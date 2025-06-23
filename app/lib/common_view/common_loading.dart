import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommonLoadingWidget extends StatelessWidget {
  const CommonLoadingWidget({
    this.message,
    this.size = 24.0,
    this.strokeWidth = 2.0,
    this.color,
    this.backgroundColor,
    super.key,
  });

  final String? message;
  final double size;
  final double strokeWidth;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget indicator = SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? theme.colorScheme.primary,
        backgroundColor: backgroundColor,
      ),
    );

    if (message != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator,
          const SizedBox(height: 16),
          Text(
            message!,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return indicator;
  }
}

class CommonFullScreenLoading extends StatelessWidget {
  const CommonFullScreenLoading({
    this.message,
    this.backgroundColor,
    super.key,
  });

  final String? message;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      color: backgroundColor ?? Colors.black54,
      child: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: CommonLoadingWidget(
              message: message ?? l10n.loading,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}

class CommonRefreshIndicator extends StatelessWidget {
  const CommonRefreshIndicator({
    required this.onRefresh,
    required this.child,
    this.displacement = 40.0,
    this.color,
    this.backgroundColor,
    super.key,
  });

  final RefreshCallback onRefresh;
  final Widget child;
  final double displacement;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      displacement: displacement,
      color: color,
      backgroundColor: backgroundColor,
      child: child,
    );
  }
}
