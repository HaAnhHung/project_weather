/// 🌍 Weather Localization Service - Data layer
///
/// Chức năng:
/// - Handle weather data localization trong data layer
/// - Translate weather descriptions dựa trên locale settings
/// - Standalone service không phụ thuộc external packages

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class WeatherLocalizationService {
  final SharedPreferences _prefs;

  WeatherLocalizationService(this._prefs);

  /// Lấy locale hiện tại từ preferences
  String get currentLocale => _prefs.getString('language_code') ?? 'en';

  /// Map locale code for OpenWeatherMap API
  String get weatherApiLang {
    switch (currentLocale) {
      case 'vi':
        return 'vi';
      case 'en':
      default:
        return 'en';
    }
  }

  /// Weather condition translations
  static const Map<String, Map<String, String>> _translations = {
    // Clear sky
    'clear sky': {'vi': 'Trời quang đãng', 'en': 'Clear sky'},
    'few clouds': {'vi': 'Ít mây', 'en': 'Few clouds'},
    'scattered clouds': {'vi': 'Mây rải rác', 'en': 'Scattered clouds'},
    'broken clouds': {'vi': 'Mây âm u', 'en': 'Broken clouds'},
    'overcast clouds': {'vi': 'Trời âm u', 'en': 'Overcast clouds'},

    // Rain
    'light rain': {'vi': 'Mưa nhẹ', 'en': 'Light rain'},
    'moderate rain': {'vi': 'Mưa vừa', 'en': 'Moderate rain'},
    'heavy intensity rain': {'vi': 'Mưa to', 'en': 'Heavy rain'},
    'very heavy rain': {'vi': 'Mưa rất to', 'en': 'Very heavy rain'},
    'shower rain': {'vi': 'Mưa rào', 'en': 'Shower rain'},

    // Thunderstorm
    'thunderstorm': {'vi': 'Dông', 'en': 'Thunderstorm'},
    'thunderstorm with rain': {
      'vi': 'Dông kèm mưa',
      'en': 'Thunderstorm with rain',
    },

    // Snow
    'snow': {'vi': 'Có tuyết', 'en': 'Snow'},
    'light snow': {'vi': 'Tuyết nhẹ', 'en': 'Light snow'},
    'heavy snow': {'vi': 'Tuyết to', 'en': 'Heavy snow'},

    // Atmosphere
    'mist': {'vi': 'Sương mù', 'en': 'Mist'},
    'fog': {'vi': 'Sương mù dày đặc', 'en': 'Fog'},
    'haze': {'vi': 'Sương khô', 'en': 'Haze'},
  };

  /// Translate weather description theo locale hiện tại
  String translateDescription(String originalDescription) {
    final lowercaseDesc = originalDescription.toLowerCase();

    // Tìm translation trực tiếp
    if (_translations.containsKey(lowercaseDesc)) {
      return _translations[lowercaseDesc]![currentLocale] ??
          originalDescription;
    }

    // Tìm translation theo keyword matching
    for (final entry in _translations.entries) {
      if (lowercaseDesc.contains(entry.key) ||
          entry.key.contains(lowercaseDesc)) {
        return entry.value[currentLocale] ?? originalDescription;
      }
    }

    // Fallback to original description với capitalize
    return _capitalizeFirst(originalDescription);
  }

  /// Capitalize first letter của description
  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
