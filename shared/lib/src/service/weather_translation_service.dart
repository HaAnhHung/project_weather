/// 🌍 Weather Translation Service
///
/// Chức năng:
/// - Translate weather descriptions từ English sang các ngôn ngữ khác
/// - Fallback mechanism khi API không hỗ trợ locale
/// - Mapping weather conditions theo chuẩn OpenWeatherMap

import 'package:injectable/injectable.dart';

/// Weather translation service với dependency injection
@LazySingleton()
class WeatherTranslationService {
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
    'extreme rain': {'vi': 'Mưa cực to', 'en': 'Extreme rain'},
    'shower rain': {'vi': 'Mưa rào', 'en': 'Shower rain'},
    'light intensity shower rain': {
      'vi': 'Mưa rào nhẹ',
      'en': 'Light shower rain',
    },
    'heavy intensity shower rain': {
      'vi': 'Mưa rào to',
      'en': 'Heavy shower rain',
    },

    // Drizzle
    'light intensity drizzle': {'vi': 'Mưa phùn nhẹ', 'en': 'Light drizzle'},
    'drizzle': {'vi': 'Mưa phùn', 'en': 'Drizzle'},
    'heavy intensity drizzle': {'vi': 'Mưa phùn nặng', 'en': 'Heavy drizzle'},

    // Thunderstorm
    'thunderstorm with light rain': {
      'vi': 'Dông kèm mưa nhẹ',
      'en': 'Thunderstorm with light rain',
    },
    'thunderstorm with rain': {
      'vi': 'Dông kèm mưa',
      'en': 'Thunderstorm with rain',
    },
    'thunderstorm with heavy rain': {
      'vi': 'Dông kèm mưa to',
      'en': 'Thunderstorm with heavy rain',
    },
    'light thunderstorm': {'vi': 'Dông nhẹ', 'en': 'Light thunderstorm'},
    'thunderstorm': {'vi': 'Dông', 'en': 'Thunderstorm'},
    'heavy thunderstorm': {'vi': 'Dông mạnh', 'en': 'Heavy thunderstorm'},

    // Snow
    'light snow': {'vi': 'Tuyết nhẹ', 'en': 'Light snow'},
    'snow': {'vi': 'Có tuyết', 'en': 'Snow'},
    'heavy snow': {'vi': 'Tuyết to', 'en': 'Heavy snow'},
    'sleet': {'vi': 'Mưa tuyết', 'en': 'Sleet'},
    'light shower sleet': {'vi': 'Mưa tuyết nhẹ', 'en': 'Light shower sleet'},
    'shower sleet': {'vi': 'Mưa tuyết rào', 'en': 'Shower sleet'},
    'light rain and snow': {
      'vi': 'Mưa và tuyết nhẹ',
      'en': 'Light rain and snow',
    },
    'rain and snow': {'vi': 'Mưa và tuyết', 'en': 'Rain and snow'},
    'light shower snow': {'vi': 'Tuyết rào nhẹ', 'en': 'Light shower snow'},
    'shower snow': {'vi': 'Tuyết rào', 'en': 'Shower snow'},
    'heavy shower snow': {'vi': 'Tuyết rào to', 'en': 'Heavy shower snow'},

    // Atmosphere
    'mist': {'vi': 'Sương mù', 'en': 'Mist'},
    'smoke': {'vi': 'Khói', 'en': 'Smoke'},
    'haze': {'vi': 'Sương khô', 'en': 'Haze'},
    'sand/dust whirls': {'vi': 'Lốc cát/bụi', 'en': 'Sand/dust whirls'},
    'fog': {'vi': 'Sương mù dày đặc', 'en': 'Fog'},
    'sand': {'vi': 'Cát', 'en': 'Sand'},
    'dust': {'vi': 'Bụi', 'en': 'Dust'},
    'volcanic ash': {'vi': 'Tro núi lửa', 'en': 'Volcanic ash'},
    'squalls': {'vi': 'Gió giật', 'en': 'Squalls'},
    'tornado': {'vi': 'Lốc xoáy', 'en': 'Tornado'},
  };

  /// Translate weather description to target language
  ///
  /// [description]: Original weather description từ API
  /// [targetLang]: Target language code (vi, en)
  ///
  /// Returns translated description hoặc original nếu không tìm thấy translation
  String translateWeatherDescription(String description, String targetLang) {
    final lowercaseDesc = description.toLowerCase();

    // Tìm translation trực tiếp
    if (_translations.containsKey(lowercaseDesc)) {
      return _translations[lowercaseDesc]![targetLang] ?? description;
    }

    // Tìm translation theo keyword matching
    for (final entry in _translations.entries) {
      if (lowercaseDesc.contains(entry.key) ||
          entry.key.contains(lowercaseDesc)) {
        return entry.value[targetLang] ?? description;
      }
    }

    // Fallback to original description với capitalize
    return _capitalizeFirst(description);
  }

  /// Capitalize first letter của description
  String _capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  /// Get all supported languages
  List<String> get supportedLanguages => ['en', 'vi'];

  /// Check if language is supported
  bool isLanguageSupported(String langCode) =>
      supportedLanguages.contains(langCode);
}
