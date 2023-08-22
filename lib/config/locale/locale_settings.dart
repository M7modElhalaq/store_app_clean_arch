import 'dart:ui';

import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

import '../../core/constance.dart';

LocaleSettings localeSettings = LocaleSettings();

class LocaleSettings {
  final AppSettingsSharedPreferences _appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  static Map<String, String> languages = {
    KeyConstants.arabic: KeyConstants.arabicName,
    KeyConstants.english: KeyConstants.englishName,
  };

  List<Locale> get locales =>
      languages.keys.map((langKey) => Locale(langKey)).toList();

  Locale get defaultLocale =>
      Locale(_appSettingsSharedPreferences.defaultLocale);

//  List<Locale> = [Locale('ar'), Locale('en')],
// locale = Locale('ar')
}
