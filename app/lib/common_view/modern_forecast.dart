import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../base/bloc/app_bloc.dart';
import '../base/bloc/app_state.dart';
import '../utils/weather_utils.dart';
import 'modern_loading.dart';

class ModernForecastSection extends StatelessWidget {
  final List<WeatherEntity>? forecast;
  final bool isLoading;
  final String? error;
  final VoidCallback? onRetry;
  final Function(WeatherEntity)? onWeatherTap;

  const ModernForecastSection({
    super.key,
    this.forecast,
    this.isLoading = false,
    this.error,
    this.onRetry,
    this.onWeatherTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildHeader(context), _buildContent(context)],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.calendar_today,
              color: Theme.of(context).colorScheme.primary,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.weatherForecast,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                if (forecast != null && forecast!.isNotEmpty)
                  Text(
                    '${l10n.next} ${_getDaysCount(forecast!)} ${(_getDaysCount(forecast!) > 1 ? l10n.days : l10n.day)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      final l10n = AppLocalizations.of(context)!;
      return Container(
        height: 200.h,
        padding: EdgeInsets.all(20.w),
        child: ModernLoadingWidget(message: l10n.loading, showShimmer: false),
      );
    }

    if (error != null) {
      final l10n = AppLocalizations.of(context)!;
      return Container(
        height: 200.h,
        padding: EdgeInsets.all(20.w),
        child: ModernErrorWidget(
          message: l10n.failedToLoadForecast,
          subtitle: error,
          onRetry: onRetry,
          retryText: l10n.retry,
        ),
      );
    }

    if (forecast == null || forecast!.isEmpty) {
      final l10n = AppLocalizations.of(context)!;
      return Container(
        height: 160.h,
        padding: EdgeInsets.all(20.w),
        child: ModernEmptyWidget(
          message: l10n.noDataAvailable,
          subtitle: l10n.searchForCityToViewForecast,
          icon: Icons.cloud_off,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
      child: _buildForecastList(context),
    );
  }

  Widget _buildForecastList(BuildContext context) {
    final groupedByDay = <String, List<WeatherEntity>>{};

    for (final weather in forecast!) {
      final dayKey = DateFormat('yyyy-MM-dd').format(weather.date);
      if (!groupedByDay.containsKey(dayKey)) {
        groupedByDay[dayKey] = [];
      }
      groupedByDay[dayKey]!.add(weather);
    }

    final sortedDays = groupedByDay.keys.toList()..sort();
    final limitedDays = sortedDays.take(5).toList();

    return Column(
      children:
          limitedDays.map((dayKey) {
            final dayForecasts = groupedByDay[dayKey]!;
            final l10n = AppLocalizations.of(context)!;
            return _buildDayForecastCard(context, dayKey, dayForecasts, l10n);
          }).toList(),
    );
  }

  Widget _buildDayForecastCard(
    BuildContext context,
    String dayKey,
    List<WeatherEntity> dayForecasts,
    AppLocalizations l10n,
  ) {
    final representativeWeather = dayForecasts.first;
    final date = DateTime.parse(dayKey);
    final isToday = DateFormat('yyyy-MM-dd').format(DateTime.now()) == dayKey;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color:
            isToday
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border:
            isToday
                ? Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  width: 1.5,
                )
                : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _showDayDetails(context, dayForecasts),
          borderRadius: BorderRadius.circular(16.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                // Day info
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isToday
                            ? l10n.today
                            : WeatherUtils.formatDayName(date, l10n),
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color:
                              isToday
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        DateFormat('MMM dd').format(date),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),

                // Weather icon and description
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: WeatherIcons.getWeatherColor(
                            representativeWeather.description,
                          ).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          WeatherIcons.getWeatherIcon(
                            representativeWeather.description,
                          ),
                          color: WeatherIcons.getWeatherColor(
                            representativeWeather.description,
                          ),
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              representativeWeather.description,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${dayForecasts.length} updates',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Temperature and expand indicator
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen:
                          (previous, current) =>
                              previous.isCelsius != current.isCelsius,
                      builder: (context, state) {
                        return Text(
                          WeatherUtils.getTemperatureText(
                            representativeWeather.temperature.toDouble(),
                            state.isCelsius,
                          ),
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: WeatherUtils.getTemperatureColor(
                              representativeWeather.temperature.toDouble(),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 4.h),
                    Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      size: 20.sp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDayDetails(BuildContext context, List<WeatherEntity> dayForecasts) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DayDetailBottomSheet(forecasts: dayForecasts),
    );
  }

  int _getDaysCount(List<WeatherEntity> forecast) {
    final Set<String> uniqueDays = {};
    for (final weather in forecast) {
      final dayKey = DateFormat('yyyy-MM-dd').format(weather.date);
      uniqueDays.add(dayKey);
    }
    return uniqueDays.length;
  }
}

class DayDetailBottomSheet extends StatelessWidget {
  final List<WeatherEntity> forecasts;

  const DayDetailBottomSheet({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Hourly Forecast',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          ),

          // Hourly forecast list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: forecasts.length,
              itemBuilder: (context, index) {
                final weather = forecasts[index];
                return _buildHourlyForecastItem(context, weather);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHourlyForecastItem(BuildContext context, WeatherEntity weather) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Time
          SizedBox(
            width: 60.w,
            child: Text(
              WeatherUtils.formatTime(weather.date),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),

          SizedBox(width: 16.w),

          // Weather icon
          Icon(
            WeatherIcons.getWeatherIcon(weather.description),
            color: WeatherIcons.getWeatherColor(weather.description),
            size: 24.sp,
          ),

          SizedBox(width: 16.w),

          // Description
          Expanded(
            child: Text(
              weather.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          // Temperature
          BlocBuilder<AppBloc, AppState>(
            buildWhen:
                (previous, current) => previous.isCelsius != current.isCelsius,
            builder: (context, state) {
              return Text(
                WeatherUtils.getTemperatureText(
                  weather.temperature.toDouble(),
                  state.isCelsius,
                ),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: WeatherUtils.getTemperatureColor(
                    weather.temperature.toDouble(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
