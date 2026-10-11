import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  // =========================
  // Shared Preferences
  // =========================

  static late SharedPreferences _prefs;

  /// لازم تتنادي مرة واحدة في main قبل runApp
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setData(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else {
      throw UnsupportedError(
        'Type ${value.runtimeType} is not supported',
      );
    }
  }

  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static Future<void> removeData(String key) async {
    await _prefs.remove(key);
  }

  static Future<void> clearData() async {
    await _prefs.clear();
  }

  // =========================
  // Flutter Secure Storage
  // =========================

  static const FlutterSecureStorage _secureStorage =
  FlutterSecureStorage();

  static Future<void> setSecureString(
      String key,
      String value,
      ) async {
    await _secureStorage.write(
      key: key,
      value: value,
    );
  }

  static Future<String?> getSecureString(String key) async {
    return await _secureStorage.read(key: key);
  }

  static Future<void> removeSecureString(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> clearSecureData() async {
    await _secureStorage.deleteAll();
  }
}
