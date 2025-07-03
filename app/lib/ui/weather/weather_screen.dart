/// 🌤️ Weather Screen - Màn hình chính hiển thị thời tiết
///
/// Tính năng:
/// - Hiển thị thời tiết hiện tại và dự báo 7 ngày
/// - Tìm kiếm thành phố
/// - Chia sẻ thông tin thời tiết
/// - Refresh to reload data

import 'package:app/resource/dimens/app_dimen.dart';
import 'package:app/resource/dimens/dimens.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:domain/domain.dart';
import '../../app.dart';
import '../../common_view/modern_loading.dart';
import '../../common_view/modern_weather_card.dart';
import '../../common_view/modern_forecast.dart';
import '../../common_view/app_logo.dart';

/// Main weather display screen với Auto Route
@RoutePage()
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

/// Weather screen state với BasePageState integration
class _WeatherScreenState extends BasePageState<WeatherScreen, WeatherBloc> {
  /// Text controller cho city search input
  final _controller = TextEditingController(text: 'Hanoi');

  @override
  void initState() {
    super.initState();
    // Load weather data cho default city
    bloc.add(WeatherEvent.fetchByCity(city: _controller.text));
  }

  /// Tìm kiếm thời tiết theo tên thành phố
  void _search() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      bloc.add(WeatherEvent.fetchByCity(city: city));
    }
  }

  // Pull-to-refresh handler
  Future<void> _handleRefresh() async {
    // Provide haptic feedback
    HapticFeedback.mediumImpact();

    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      bloc.add(WeatherEvent.fetchByCity(city: city));
    } else {
      bloc.add(const WeatherEvent.fetchByCity(city: 'Hanoi'));
    }

    // Wait for the request to complete (simple approach)
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listenWhen: (previous, current) => previous.locale != current.locale,
      listener: (context, state) {
        // When language changes, refresh weather data to get translated descriptions
        bloc.add(const WeatherEvent.languageChanged());
      },
      child: CommonScaffold(
        hideKeyboardWhenTouchOutside: true,
        appBar: CommonAppBar(
          titleWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIconMini(size: Dimens.d28.responsive()),
              SizedBox(width: Dimens.d16.responsive()),
              Text(
                l10n.title,
                style: TextStyle(fontSize: Dimens.d18.responsive(), fontWeight: FontWeight.w600),
              ),
            ],
          ),
          leadingIcon: LeadingIcon.menu,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: l10n.settings,
              onPressed: () {
                navigator.push(const AppRouteInfo.settings());
              },
            ),
          ],
        ),
        drawer: _buildDrawer(context),
        body: Column(
          children: [
            // Modern search section
            ModernSearchSection(
              controller: _controller,
              onSearch: _search,
              hintText: l10n.searchCity,
            ),
            // Content section with pull-to-refresh
            Expanded(
              child: RefreshIndicator(
                onRefresh: _handleRefresh,
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      // Current Weather Section
                      BlocBuilder<WeatherBloc, WeatherState>(
                        builder: (context, weatherState) {
                          return weatherState.when(
                            initial:
                                () => Container(
                                  padding: EdgeInsets.all(
                                    Dimens.d32.responsive(),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: Dimens.d20.responsive()),
                                      AppLogo(showText: true),
                                      SizedBox(height: Dimens.d24.responsive()),
                                      ModernEmptyWidget(
                                        message: l10n.initialMessage,
                                        subtitle:
                                            l10n.searchForCityToGetStarted,
                                        icon: Icons.search,
                                      ),
                                    ],
                                  ),
                                ),
                            loading:
                                () => Container(
                                  padding: EdgeInsets.all(
                                    Dimens.d32.responsive(),
                                  ),
                                  child: ModernLoadingWidget(
                                    message: l10n.loading,
                                    showShimmer: true,
                                  ),
                                ),
                            loaded:
                                (
                                  weather,
                                  forecast,
                                  isForecastLoading,
                                  forecastError,
                                ) => ModernWeatherCard(
                                  weather: weather,
                                  onViewDetails:
                                      () => _navigateToDetail(weather),
                                  onShare: () => _shareWeather(weather),
                                ),
                            error:
                                (message) => Container(
                                  padding: EdgeInsets.all(
                                    Dimens.d32.responsive(),
                                  ),
                                  child: ModernErrorWidget(
                                    message: l10n.failedToLoadWeather,
                                    subtitle: message,
                                    onRetry: _search,
                                  ),
                                ),
                          );
                        },
                      ),
                      SizedBox(height: Dimens.d24.responsive()),

                      // Modern Forecast Section
                      BlocBuilder<WeatherBloc, WeatherState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => const SizedBox.shrink(),
                            loading: () => const SizedBox.shrink(),
                            loaded:
                                (
                                  weather,
                                  forecast,
                                  isForecastLoading,
                                  forecastError,
                                ) => ModernForecastSection(
                                  forecast: forecast,
                                  isLoading: isForecastLoading ?? false,
                                  error: forecastError,
                                  onRetry: _search,
                                  onWeatherTap: _navigateToDetail,
                                ),
                            error: (message) => const SizedBox.shrink(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud, size: Dimens.d48.responsive(), color: theme.colorScheme.onPrimary),
                SizedBox(height: Dimens.d8.responsive()),
                Text(
                  l10n.title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  l10n.appSubtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
          CommonListTile(
            leading: const Icon(Icons.cloud),
            title: Text(l10n.weather),
            selected: true,
            onTap: () {
              navigator.pop();
            },
          ),
          CommonListTile(
            leading: const Icon(Icons.settings),
            title: Text(l10n.settings),
            onTap: () {
              navigator.pop();
              navigator.push(const AppRouteInfo.settings());
            },
          ),
          const Divider(),
          CommonListTile(
            leading: const Icon(Icons.info),
            title: Text(l10n.about),
            onTap: () {
              navigator.pop();
              _showAboutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    CommonDialog.showInfo(
      context: context,
      title: l10n.aboutWeatherApp,
      message: l10n.weatherDescription,
      okText: l10n.ok,
    );
  }

  void _navigateToDetail(WeatherEntity weather) {
    navigator.push(AppRouteInfo.weatherDetail(weather: weather));
  }

  void _shareWeather(WeatherEntity weather) {
    // Get temperature setting
    final state = context.read<AppBloc>().state;
    final tempUnit = state.isCelsius ? '°C' : '°F';
    final temperature =
        state.isCelsius
            ? weather.temperature.toString()
            : (weather.temperature * 9 / 5 + 32).round().toString();

    // Format date
    final dateStr =
        '${weather.date.day}/${weather.date.month}/${weather.date.year}';

    // Create share message
    final message = '''
🌤️ ${l10n.weatherUpdate}

📍 ${weather.city}
🌡️ $temperature$tempUnit
☁️ ${weather.description}
📅 $dateStr

${l10n.sharedFromWeatherApp} 📱
''';

    // Share the weather information
    Share.share(message, subject: 'Weather in ${weather.city}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
