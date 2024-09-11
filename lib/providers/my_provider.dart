import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  late ThemeMode selectedMode;
  late String selectedLanguage;
  SharedPreferences? prefs;

  void changeMode(var mode) {
    selectedMode = mode;

    if (mode == ThemeMode.light) {
      saveMode(true);
    } else {
      saveMode(false);
    }
    notifyListeners();
  }

  void changeLanguage(var language) {
    selectedLanguage = language;

    if (language == "en") {
      saveLanguage(true);
    } else {
      saveLanguage(false);
    }

    notifyListeners();
  }

  String getSplashImage() {
    if (selectedMode == ThemeMode.light) {
      return "assets/images/ic_splash_light.png";
    } else {
      return "assets/images/ic_splash_dark.png";
    }
  }

  String getSplashBrand() {
    if (selectedMode == ThemeMode.light) {
      return "assets/images/ic_brand_light.png";
    } else {
      return "assets/images/ic_brand_dark.png";
    }
  }

  String getBackgroundPath() {
    if (selectedMode == ThemeMode.light) {
      return "assets/images/background_light.png";
    } else {
      return "assets/images/background_dark.png";
    }
  }

  String getSebhaPath() {
    if (selectedMode == ThemeMode.light) {
      return "assets/images/sebha_page.png";
    } else {
      return "assets/images/sebha_dark.png";
    }
  }

  // Shared Preferences

  Future<void> saveMode(bool lightMode) async {
    await prefs!.setBool('LightMode', lightMode);
  }

  Future<void> saveLanguage(bool englishLanguage) async {
    await prefs!.setBool('EnglishLanguage', englishLanguage);
  }

  bool? getMode() {
    return prefs!.getBool('LightMode');
  }

  bool? getLanguage() {
    return prefs!.getBool('EnglishLanguage');
  }

  Future<void> setItems() async {
    prefs = await SharedPreferences.getInstance();
    if (getMode() ?? true) {
      selectedMode = ThemeMode.light;
    } else {
      selectedMode = ThemeMode.dark;
    }
    if (getLanguage() ?? true) {
      selectedLanguage = "en";
    } else {
      selectedLanguage = "ar";

    }
  }
}
