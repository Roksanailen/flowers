import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  ThemeService._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    backgroundColor: Colors.grey[200],
    scaffoldBackgroundColor:
        const Color.fromRGBO(238, 176, 201, 0.9294117647058824),
    appBarTheme: const AppBarTheme(color: Colors.purpleAccent),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.pinkAccent,
    backgroundColor: Colors.deepPurple[900],
    scaffoldBackgroundColor: Colors.purple[900],
    appBarTheme: const AppBarTheme(color: Colors.purpleAccent),
  );

  static final _getStorage = GetStorage();
  static const _themeModeKey = 'isDarkTheme';
  static void saveThemeData(bool isDarkMode) {
    _getStorage.write(_themeModeKey, isDarkMode);
  }

  static ThemeMode get theme =>
      _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  static bool _loadThemeFromBox() => _getStorage.read(_themeModeKey) ?? false;
  static _saveThemeToBox(bool isDarkMode) =>
      _getStorage.write(_themeModeKey, isDarkMode);
  static void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
