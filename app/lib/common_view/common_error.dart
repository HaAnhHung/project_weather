import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'common_button.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({
    required this.message,
    this.title,
    this.onRetry,
    this.retryText,
    this.icon,
    this.showIcon = true,
    super.key,
  });

  final String message;
  final String? title;
  final VoidCallback? onRetry;
  final String? retryText;
  final Widget? icon;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon) ...[
              icon ??
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: theme.colorScheme.error,
                  ),
              const SizedBox(height: 16),
            ],
            if (title != null) ...[
              Text(
                title!,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],
            Text(
              message,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              CommonButton.outlined(
                text: retryText ?? l10n.retry,
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CommonNetworkErrorWidget extends StatelessWidget {
  const CommonNetworkErrorWidget({this.onRetry, this.retryText, super.key});

  final VoidCallback? onRetry;
  final String? retryText;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CommonErrorWidget(
      title: l10n.error,
      message:
          'No internet connection. Please check your network and try again.',
      onRetry: onRetry,
      retryText: retryText,
      icon: Icon(
        Icons.wifi_off,
        size: 64,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}

class CommonTimeoutErrorWidget extends StatelessWidget {
  const CommonTimeoutErrorWidget({this.onRetry, this.retryText, super.key});

  final VoidCallback? onRetry;
  final String? retryText;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CommonErrorWidget(
      title: l10n.error,
      message: 'Request timeout. Please try again.',
      onRetry: onRetry,
      retryText: retryText,
      icon: Icon(
        Icons.access_time,
        size: 64,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
