import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/config/locale/locale_settings.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';

class SettingsController extends GetxController with Helpers {
  final AppSettingsSharedPreferences _appSettingsPrefs = AppSettingsSharedPreferences();
  final languagesList = LocaleSettings.languages;
  String get currentLanguage => _appSettingsPrefs.defaultLocale;
  String lang = '';

  @override
  void onInit() {
    super.onInit();
  }

  void changeLanguage(BuildContext context, {required String languageCode}) {
    // appSettingsSharedPreferences.setDefaultLocale(appSettingsSharedPreferences.defaultLocale == 'ar' ? 'en' : 'ar');
    _appSettingsPrefs.setDefaultLocale(languageCode);
    EasyLocalization.of(context)!.setLocale(Locale(languageCode));
    Get.updateLocale(Locale(languageCode));
    showSnackBar(
      context: context,
      message: ManagerStrings.changeLanguageSuccess,
    );
    update();
  }
}