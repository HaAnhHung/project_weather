import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class AppPreferences with LogMixin {
  AppPreferences(this._sharedPreference);

  final SharedPreferences _sharedPreference;

  bool get isDarkMode {
    return _sharedPreference.getBool(SharedPreferenceKeys.isDarkMode) ?? false;
  }

  String get languageCode =>
      _sharedPreference.getString(SharedPreferenceKeys.languageCode) ?? 'en';

  bool get isCelsius {
    return _sharedPreference.getBool(SharedPreferenceKeys.isCelsius) ?? true;
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference.setBool(SharedPreferenceKeys.isDarkMode, isDarkMode);
  }

  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreference.setString(SharedPreferenceKeys.languageCode, languageCode);
  }

  Future<bool> saveIsCelsius(bool isCelsius) {
    return _sharedPreference.setBool(SharedPreferenceKeys.isCelsius, isCelsius);
  }

  Future<void> clearAll() async {
    await _sharedPreference.clear();
  }
}

class SharedPreferenceKeys {
  static const String isDarkMode = 'is_dark_mode';
  static const String languageCode = 'language_code';
  static const String isCelsius = 'is_celsius';
}