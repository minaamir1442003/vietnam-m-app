import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider() {
    loadLocale();
  }

  Locale _locale = Locale(
    'ar',
  ); // Use a private field to encapsulate the state.

  Locale get locale => _locale;
  void changeLocale(Locale locale) async {
    _locale = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isArabic', locale.languageCode == 'ar');
    notifyListeners();
  }
  loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('isArabic')) {
      _locale = const Locale('ar');
      await prefs.setBool('isArabic', true);
    } else {
      bool isArabic = prefs.getBool('isArabic')!;
      _locale = isArabic ? const Locale('ar') : const Locale('en');
    }
    notifyListeners();
  }
}
