import 'package:store_app/core/constance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/extensions/extensions.dart';

class AppSettingsSharedPreferences {
  static final _instance = AppSettingsSharedPreferences._internal();
  late SharedPreferences _sharedPreferences;

  AppSettingsSharedPreferences._internal();

  factory AppSettingsSharedPreferences() {
    return _instance;
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  clear(){
    _sharedPreferences.clear();
  }

  Future<void> setDefaultLocale(String lang) async {
    await _sharedPreferences.setString(KeyConstants.localeKey, lang);
  }

  String get defaultLocale =>
      _sharedPreferences.getString(KeyConstants.localeKey).parseLocale();

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(KeyConstants.token, token);
  }

  String get defaultToken =>
      _sharedPreferences.getString(KeyConstants.token).onNull();

  Future<void> setPhoneNumber(int phoneNumber) async {
    await _sharedPreferences.setInt(KeyConstants.phoneNumber, phoneNumber);
  }

  int get defaultPhoneNumber =>
      _sharedPreferences.getInt(KeyConstants.phoneNumber).onNull();

  Future<void> setLoggedIn() async {
    await _sharedPreferences.setBool(KeyConstants.loggedIn, true);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(KeyConstants.loggedIn).onNull();
}