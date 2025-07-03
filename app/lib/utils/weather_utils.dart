import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherIcons {
  static IconData getWeatherIcon(String description) {
    final desc = description.toLowerCase();

    if (desc.contains('clear') || desc.contains('sunny')) {
      return Icons.wb_sunny;
    } else if (desc.contains('cloud')) {
      if (desc.contains('partly')) {
        return Icons.wb_cloudy;
      }
      return Icons.cloud;
    } else if (desc.contains('rain')) {
      if (desc.contains('heavy') || desc.contains('storm')) {
        return Icons.thunderstorm;
      }
      return Icons.grain;
    } else if (desc.contains('snow')) {
      return Icons.ac_unit;
    } else if (desc.contains('fog') || desc.contains('mist')) {
      return Icons.blur_on;
    } else if (desc.contains('wind')) {
      return Icons.air;
    } else if (desc.contains('storm') || desc.contains('thunder')) {
      return Icons.flash_on;
    } else if (desc.contains('drizzle')) {
      return Icons.grain;
    }

    return Icons.wb_cloudy; // Default icon
  }

  static IconData getTimeIcon(DateTime dateTime) {
    final hour = dateTime.hour;

    if (hour >= 6 && hour < 12) {
      return Icons.wb_sunny; // Morning
    } else if (hour >= 12 && hour < 18) {
      return Icons.wb_sunny_outlined; // Afternoon
    } else if (hour >= 18 && hour < 21) {
      return Icons.wb_twilight; // Evening
    } else {
      return Icons.nights_stay; // Night
    }
  }

  static Color getWeatherColor(String description) {
    final desc = description.toLowerCase();

    if (desc.contains('clear') || desc.contains('sunny')) {
      return const Color(0xFFFFD700);
    } else if (desc.contains('cloud')) {
      return const Color(0xFF87CEEB);
    } else if (desc.contains('rain')) {
      return const Color(0xFF4169E1);
    } else if (desc.contains('snow')) {
      return const Color(0xFFE6E6FA);
    } else if (desc.contains('storm')) {
      return const Color(0xFF8B008B);
    }

    return const Color(0xFF87CEEB); // Default color
  }
}

class WeatherUtils {
  static String formatDate(DateTime date, AppLocalizations l10n) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return l10n.today;
    } else if (dateToCheck == tomorrow) {
      return l10n.tomorrow;
    } else {
      return DateFormat('MMM dd').format(date);
    }
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String formatDayName(DateTime date, AppLocalizations l10n) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToCheck = DateTime(date.year, date.month, date.day);

    if (dateToCheck == today) {
      return l10n.today;
    } else if (dateToCheck == today.add(const Duration(days: 1))) {
      return l10n.tomorrow;
    } else {
      // Use localized weekday names
      final weekday = date.weekday;
      switch (weekday) {
        case DateTime.monday:
          return l10n.monday;
        case DateTime.tuesday:
          return l10n.tuesday;
        case DateTime.wednesday:
          return l10n.wednesday;
        case DateTime.thursday:
          return l10n.thursday;
        case DateTime.friday:
          return l10n.friday;
        case DateTime.saturday:
          return l10n.saturday;
        case DateTime.sunday:
          return l10n.sunday;
        default:
          return DateFormat('EEEE').format(date);
      }
    }
  }

  static String getTemperatureText(double temperature, bool isCelsius) {
    if (isCelsius) {
      return '${temperature.round()}°C';
    } else {
      final fahrenheit = (temperature * 9 / 5 + 32).round();
      return '$fahrenheit°F';
    }
  }

  static String getTimeOfDay(DateTime dateTime, AppLocalizations l10n) {
    final hour = dateTime.hour;

    if (hour >= 5 && hour < 12) {
      return l10n.morning;
    } else if (hour >= 12 && hour < 17) {
      return l10n.afternoon;
    } else if (hour >= 17 && hour < 21) {
      return l10n.evening;
    } else {
      return l10n.night;
    }
  }

  static Color getTemperatureColor(double temperature) {
    if (temperature >= 30) {
      return const Color(0xFFFF4500); // Hot - Red Orange
    } else if (temperature >= 20) {
      return const Color(0xFFFFD700); // Warm - Gold
    } else if (temperature >= 10) {
      return const Color(0xFF32CD32); // Cool - Lime Green
    } else if (temperature >= 0) {
      return const Color(0xFF87CEEB); // Cold - Sky Blue
    } else {
      return const Color(0xFF4169E1); // Freezing - Royal Blue
    }
  }

  static int getDaysCount(List<dynamic> forecast) {
    if (forecast.isEmpty) return 0;

    final Set<String> uniqueDays = {};
    for (final item in forecast) {
      if (item is Map && item.containsKey('date')) {
        final date = item['date'] as DateTime;
        final dayKey = DateFormat('yyyy-MM-dd').format(date);
        uniqueDays.add(dayKey);
      }
    }

    return uniqueDays.length;
  }

  static String getFeelsLikeDescription(
    double temperature,
    double feelsLike,
    AppLocalizations l10n,
  ) {
    final diff = feelsLike - temperature;

    if (diff > 5) {
      return l10n.feelsWarmer;
    } else if (diff < -5) {
      return l10n.feelsCooler;
    } else {
      return l10n.feelsAboutRight;
    }
  }

  static String getUVIndexDescription(int uvIndex, AppLocalizations l10n) {
    if (uvIndex <= 2) {
      return l10n.uvIndexLow;
    } else if (uvIndex <= 5) {
      return l10n.uvIndexModerate;
    } else if (uvIndex <= 7) {
      return l10n.uvIndexHigh;
    } else if (uvIndex <= 10) {
      return l10n.uvIndexVeryHigh;
    } else {
      return l10n.uvIndexExtreme;
    }
  }

  static Color getUVIndexColor(int uvIndex) {
    if (uvIndex <= 2) {
      return const Color(0xFF32CD32); // Green
    } else if (uvIndex <= 5) {
      return const Color(0xFFFFD700); // Yellow
    } else if (uvIndex <= 7) {
      return const Color(0xFFFF8C00); // Orange
    } else if (uvIndex <= 10) {
      return const Color(0xFFFF4500); // Red
    } else {
      return const Color(0xFF8B008B); // Purple
    }
  }
}
