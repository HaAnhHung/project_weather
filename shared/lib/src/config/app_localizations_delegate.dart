import 'package:flutter/material.dart';

class AppLocalizationsDelegate
    extends LocalizationsDelegate<WidgetsLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<WidgetsLocalizations> load(Locale locale) async =>
      DefaultWidgetsLocalizations();

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<WidgetsLocalizations> old,
  ) => false;
}
