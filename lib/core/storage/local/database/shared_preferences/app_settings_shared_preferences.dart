import 'package:store_app/core/constance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/extensions/extensions.dart';
import 'package:store_app/features/auth/data/models/customer_model.dart';

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

  Future<void> removeCachedUserData() async {
    await _sharedPreferences.remove(Constance.prefKeyIsLoggedIn);
    await _sharedPreferences.remove(Constance.prefKeyEmail);
    await _sharedPreferences.remove(ApiConstants.token);
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

  // List<String> get getCartItems => _sharedPreferences.getString(KeyConstants.cart).onNull();

  Future<void> saveUserInfo(CustomerModel user) async {
    await _sharedPreferences.setInt(
      KeyConstants.userId,
      user.id,
    );
    await _sharedPreferences.setString(
      KeyConstants.userName,
      user.name,
    );
    await _sharedPreferences.setString(
      KeyConstants.userEmail,
      user.email,
    );
    await _sharedPreferences.setInt(
      KeyConstants.userPhoneNumber,
      user.phoneNumber,
    );
    await _sharedPreferences.setString(
      KeyConstants.userImage,
      user.profileImage,
    );
    await _sharedPreferences.setInt(
      KeyConstants.userIdNumber,
      user.idNumber,
    );
    await _sharedPreferences.setString(
      KeyConstants.userDateOfBirth,
      user.dateOfBirth,
    );
    await _sharedPreferences.setString(
      KeyConstants.userGender,
      user.gender,
    );
  }

  int get userId => _sharedPreferences.getInt(KeyConstants.userId).onNull();

  int get userPhoneNumber => _sharedPreferences.getInt(KeyConstants.userPhoneNumber).onNull();
}