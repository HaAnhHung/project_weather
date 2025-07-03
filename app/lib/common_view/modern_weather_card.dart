import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../base/bloc/app_bloc.dart';
import '../base/bloc/app_state.dart';
import '../resource/theme/weather_theme.dart';
import '../utils/weather_utils.dart';
import '../resource/dimens/app_dimen.dart';

class ModernWeatherCard extends StatelessWidget {
  final WeatherEntity weather;
  final VoidCallback? onViewDetails;
  final VoidCallback? onShare;

  const ModernWeatherCard({
    super.key,
    required this.weather,
    this.onViewDetails,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          // Background gradient
          Container(
            height: 220.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: WeatherTheme.getWeatherGradient(weather.description),
                stops: const [0.0, 1.0],
              ),
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 20.r,
                  offset: Offset(0, 8.h),
                ),
              ],
            ),
          ),

          // Weather content with glassmorphism effect
          Container(
            padding: EdgeInsets.all(AppDimen.current.weatherCardPadding()),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppDimen.current.weatherCardRadius(),
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.2),
                width: 1.5.responsive(),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Location and date
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white.withValues(alpha: 0.9),
                        size: 16.sp,
                      ),
                      SizedBox(width: 4.0.responsive()),
                      Expanded(
                        child: Text(
                          weather.city,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        WeatherUtils.formatDate(weather.date, l10n),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  // Main temperature and weather info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Temperature
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<AppBloc, AppState>(
                              buildWhen:
                                  (previous, current) =>
                                      previous.isCelsius != current.isCelsius,
                              builder: (context, state) {
                                return Text(
                                  WeatherUtils.getTemperatureText(
                                    weather.temperature.toDouble(),
                                    state.isCelsius,
                                  ),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.displayLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        AppDimen.current.temperatureFontSize(),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              weather.description.toUpperCase(),
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              WeatherUtils.getTimeOfDay(weather.date, l10n),
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Weather icon with animation
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          WeatherIcons.getWeatherIcon(weather.description),
                          size: AppDimen.current.weatherIconSize(),
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Action buttons
                  Row(
                    children: [
                      if (onViewDetails != null)
                        Expanded(
                          child: _buildActionButton(
                            icon: Icons.visibility,
                            label: l10n.viewDetails,
                            onPressed: onViewDetails!,
                          ),
                        ),
                      if (onViewDetails != null && onShare != null)
                        SizedBox(width: 12.w),
                      if (onShare != null)
                        Expanded(
                          child: _buildActionButton(
                            icon: Icons.share,
                            label: l10n.shareWeather,
                            onPressed: onShare!,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 16.sp),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModernSearchSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;
  final String hintText;

  const ModernSearchSection({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                ),
                onSubmitted: (_) => onSearch(),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          _buildSearchButton(context),
        ],
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onSearch,
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            padding: EdgeInsets.all(16.w),
            child: Icon(Icons.search, color: Colors.white, size: 20.sp),
          ),
        ),
      ),
    );
  }
}
