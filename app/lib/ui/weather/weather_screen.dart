import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:domain/domain.dart';
import '../../app.dart';
import '../../common_view/modern_loading.dart';
import '../../common_view/modern_weather_card.dart';
import '../../common_view/modern_forecast.dart';
import '../../common_view/app_logo.dart';

@RoutePage()
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends BasePageState<WeatherScreen, WeatherBloc> {
  final _controller = TextEditingController(text: 'Hanoi');

  @override
  void initState() {
    super.initState();
    bloc.add(WeatherEvent.fetchByCity(city: _controller.text));
  }

  void _search() {
    final city = _controller.text.trim();
    if (city.isNotEmpty) {
      bloc.add(WeatherEvent.fetchByCity(city: city));
    }
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      hideKeyboardWhenTouchOutside: true,
      appBar: CommonAppBar(
        titleWidget: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIconMini(size: 28.w),
            SizedBox(width: 8.w),
            Text(
              l10n.title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
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
          // Content section
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Current Weather Section
                  BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, weatherState) {
                      return weatherState.when(
                        initial:
                            () => Container(
                              padding: EdgeInsets.all(32.w),
                              child: Column(
                                children: [
                                  SizedBox(height: 20.h),
                                  AppLogo(showText: true),
                                  SizedBox(height: 24.h),
                                  ModernEmptyWidget(
                                    message: l10n.initialMessage,
                                    subtitle:
                                        'Search for a city to get started',
                                    icon: Icons.search,
                                  ),
                                ],
                              ),
                            ),
                        loading:
                            () => Container(
                              padding: EdgeInsets.all(32.w),
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
                              onViewDetails: () => _navigateToDetail(weather),
                              onShare: () => _shareWeather(weather),
                            ),
                        error:
                            (message) => Container(
                              padding: EdgeInsets.all(32.w),
                              child: ModernErrorWidget(
                                message: 'Failed to load weather',
                                subtitle: message,
                                onRetry: _search,
                              ),
                            ),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),

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
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final city = _controller.text.trim();
          if (city.isNotEmpty) {
            bloc.add(WeatherEvent.fetchByCity(city: city));
          } else {
            bloc.add(const WeatherEvent.fetchByCity(city: 'Hanoi'));
          }
        },
        tooltip: l10n.refresh,
        icon: const Icon(Icons.refresh),
        label: Text(l10n.refresh),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
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
                Icon(Icons.cloud, size: 48, color: theme.colorScheme.onPrimary),
                const SizedBox(height: 8),
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
🌤️ Weather Update

📍 $weather.city
🌡️ $temperature$tempUnit
☁️ $weather.description
📅 $dateStr

Shared from Weather App 📱
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
