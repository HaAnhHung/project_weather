import 'package:app/resource/dimens/dimens.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:domain/domain.dart';
import '../../app.dart';
import '../../common_view/modern_settings.dart';
import '../../common_view/app_logo.dart';
import '../../resource/dimens/app_dimen.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BasePageState<SettingsScreen, SettingsBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          l10n.settings,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: Dimens.d16.responsive()),
            child: IconButton(
              icon: Container(
                padding: EdgeInsets.all(Dimens.d16.responsive()),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.cloud_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  size: Dimens.d20.responsive(),
                ),
              ),
              tooltip: l10n.weather,
              onPressed: () {
                navigator.replace(const AppRouteInfo.weather());
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, appState) {
          return BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(AppDimen.current.settingsCardMargin()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with Logo
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimens.d24.responsive(),
                        ),
                        child: Column(
                          children: [
                            AppLogo(size: Dimens.d40.responsive()),
                            SizedBox(height: Dimens.d12.responsive()),
                            Text(
                              l10n.title,
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Appearance Settings
                    ModernSettingsCard(
                      title: l10n.appearance,
                      margin: EdgeInsets.zero,
                      children: [
                        ModernSwitchTile(
                          leading: Icon(
                            Icons.dark_mode_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(l10n.darkMode),
                          subtitle: Text(l10n.enableDarkTheme),
                          value: appState.isDarkMode,
                          onChanged: (value) {
                            appBloc.add(AppEvent.themeChanged(value));
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Units & Display Settings
                    ModernSettingsCard(
                      title: l10n.unitsAndDisplay,
                      margin: EdgeInsets.zero,
                      children: [
                        ModernSwitchTile(
                          leading: Icon(
                            Icons.thermostat_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(l10n.celsius),
                          subtitle: Text(l10n.temperatureUnitPreference),
                          value: settingsState.isCelsius,
                          onChanged: (value) {
                            bloc.add(SettingsEvent.unitChanged(value));
                          },
                        ),
                        ModernDropdownTile(
                          leading: Icon(
                            Icons.language_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(l10n.language),
                          subtitle: Text(l10n.languagePreference),
                          value: appState.locale,
                          items: [
                            DropdownMenuItem(
                              value: 'en',
                              child: Text(l10n.english),
                            ),
                            DropdownMenuItem(
                              value: 'vi',
                              child: Text(l10n.vietnamese),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              appBloc.add(AppEvent.localeChanged(value));
                            }
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // Navigation Settings
                    ModernSettingsCard(
                      title: l10n.navigation,
                      margin: EdgeInsets.zero,
                      children: [
                        ModernSettingsTile(
                          leading: Icon(
                            Icons.cloud_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(l10n.goToWeather),
                          subtitle: Text(l10n.viewCurrentWeather),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: Dimens.d16.responsive(),
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {
                            navigator.replace(const AppRouteInfo.weather());
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: Dimens.d16.responsive()),

                    // About & Information
                    ModernSettingsCard(
                      title: l10n.aboutAndInformation,
                      margin: EdgeInsets.zero,
                      children: [
                        ModernSettingsTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          title: Text(l10n.about),
                          subtitle: Text(l10n.appInformation),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: Dimens.d16.responsive(),
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                          onTap: () {
                            _showAboutDialog(context);
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: Dimens.d32.responsive()),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.d16.responsive()),
            ),
            title: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(Dimens.d8.responsive()),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(
                      Dimens.d12.responsive(),
                    ),
                  ),
                  child: Icon(
                    Icons.cloud,
                    color: Theme.of(context).colorScheme.primary,
                    size: Dimens.d24.responsive(),
                  ),
                ),
                SizedBox(width: Dimens.d16.responsive()),
                Text(
                  l10n.aboutWeatherApp,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.aboutContent,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: Dimens.d16.responsive()),
                Container(
                  padding: EdgeInsets.all(Dimens.d12.responsive()),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest
                        .withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(
                      Dimens.d8.responsive(),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: Dimens.d16.responsive(),
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      SizedBox(width: Dimens.d8.responsive()),
                      Expanded(
                        child: Text(
                          'Version 1.0.0',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.d24.responsive(),
                    vertical: Dimens.d12.responsive(),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Dimens.d8.responsive(),
                    ),
                  ),
                ),
                child: Text(l10n.close),
              ),
            ],
          ),
    );
  }
}
