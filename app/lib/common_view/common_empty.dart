import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommonEmptyWidget extends StatelessWidget {
  const CommonEmptyWidget({
    this.message,
    this.title,
    this.icon,
    this.onAction,
    this.actionText,
    this.showIcon = true,
    super.key,
  });

  final String? message;
  final String? title;
  final Widget? icon;
  final VoidCallback? onAction;
  final String? actionText;
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
                    Icons.inbox_outlined,
                    size: 64,
                    color: theme.colorScheme.outline,
                  ),
              const SizedBox(height: 16),
            ],
            if (title != null) ...[
              Text(
                title!,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],
            Text(
              message ?? l10n.noDataAvailable,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            if (onAction != null && actionText != null) ...[
              const SizedBox(height: 24),
              TextButton(onPressed: onAction, child: Text(actionText!)),
            ],
          ],
        ),
      ),
    );
  }
}

class CommonNoSearchResultsWidget extends StatelessWidget {
  const CommonNoSearchResultsWidget({
    this.searchQuery,
    this.onClearSearch,
    super.key,
  });

  final String? searchQuery;
  final VoidCallback? onClearSearch;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CommonEmptyWidget(
      title: l10n.noResultsFound,
      message:
          searchQuery != null
              ? '${l10n.noResultsFound} for "$searchQuery"'
              : l10n.adjustSearchTerms,
      icon: Icon(
        Icons.search_off,
        size: 64,
        color: Theme.of(context).colorScheme.outline,
      ),
      onAction: onClearSearch,
      actionText: onClearSearch != null ? l10n.clearSearch : null,
    );
  }
}
