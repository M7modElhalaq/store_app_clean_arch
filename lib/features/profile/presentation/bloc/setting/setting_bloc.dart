import 'package:flutter/material.dart';
import 'package:store_app/core/resources/manager_colors.dart';
import 'package:store_app/core/resources/manager_strings.dart';
import 'package:store_app/core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import 'package:store_app/core/widgets/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/profile/presentation/bloc/setting/setting_event.dart';
import 'package:store_app/features/profile/presentation/bloc/setting/setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingStates> with Helpers {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
  AppSettingsSharedPreferences();
  String lang = '';
  SettingBloc() : super(SettingInitialState()) {
    on<SettingEvent>((event, emit) async {
    });
  }

  String getAppLanguage() {
    lang = appSettingsSharedPreferences.defaultLocale == 'ar' ? 'العربية' : 'English';
    return lang;
  }

  void changeLanguage(BuildContext context) {
    emit(SettingLoadingState());
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: ManagerColors.primaryColor,
        ),
      ),
    );
    appSettingsSharedPreferences.setDefaultLocale(appSettingsSharedPreferences.defaultLocale == 'ar' ? 'en' : 'ar');
    Navigator.of(context).pop();
    showSnackBar(
      context: context,
      message: ManagerStrings.changeLanguageSuccess,
    );
    emit(SettingChangeLanguageState());
  }
}