import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import '../../app.dart';

@RoutePage()
class WeatherDetailScreen extends StatefulWidget {
  final WeatherEntity weather;

  const WeatherDetailScreen({super.key, required this.weather});

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState
    extends BasePageState<WeatherDetailScreen, WeatherBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      appBar: CommonAppBar(
        title: widget.weather.city,
        leadingIcon: LeadingIcon.back,
        actions: [
          IconButton(icon: const Icon(Icons.share), onPressed: _shareWeather),
        ],
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        bloc: GetIt.instance.get<SettingsBloc>(),
        builder: (context, settingsState) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMainWeatherCard(context, settingsState),
                const SizedBox(height: 16),
                _buildWeatherDetails(context),
                const SizedBox(height: 16),
                _buildActionButtons(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainWeatherCard(
    BuildContext context,
    SettingsState settingsState,
  ) {
    final temperatureText =
        settingsState.isCelsius
            ? '${widget.weather.temperature}°C'
            : '${(widget.weather.temperature * 9 / 5 + 32).round()}°F';

    return CommonCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(
            _getWeatherIcon(widget.weather.description),
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            temperatureText,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.weather.description.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${widget.weather.date.day}/${widget.weather.date.month}/${widget.weather.date.year}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetails(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.weatherDetails,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(context, l10n.location, widget.weather.city),
          _buildDetailRow(context, l10n.condition, widget.weather.description),
          _buildDetailRow(
            context,
            l10n.date,
            '${widget.weather.date.toLocal()}'.split(' ')[0],
          ),
          _buildDetailRow(
            context,
            l10n.time,
            '${widget.weather.date.toLocal()}'.split(' ')[1].substring(0, 5),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CommonButton.primary(
          text: l10n.goToWeather,
          onPressed: () => _navigateToWeather(),
        ),
        const SizedBox(height: 12),
        CommonButton.outlined(
          text: l10n.refreshWeather,
          onPressed: () => _refreshWeather(),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String description) {
    final desc = description.toLowerCase();
    if (desc.contains('rain')) return Icons.cloud_queue;
    if (desc.contains('cloud')) return Icons.cloud;
    if (desc.contains('sun') || desc.contains('clear')) return Icons.wb_sunny;
    if (desc.contains('snow')) return Icons.ac_unit;
    if (desc.contains('thunder')) return Icons.flash_on;
    return Icons.wb_cloudy;
  }

  void _shareWeather() {
    // Implement share functionality
    CommonDialog.showInfo(
      context: context,
      title: l10n.shareWeather,
      message:
          'Weather in ${widget.weather.city}: ${widget.weather.temperature}°C, ${widget.weather.description}',
      okText: l10n.ok,
    );
  }

  void _navigateToWeather() {
    navigator.push(const AppRouteInfo.weather());
  }

  void _refreshWeather() {
    bloc.add(WeatherEvent.fetchByCity(city: widget.weather.city));
    navigator.pop();
  }
}
