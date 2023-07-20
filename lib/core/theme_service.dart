import 'package:flutter/material.dart';
import '../controller/bottom_navigation_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  ThemeService._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    backgroundColor: Colors.grey[200],
    scaffoldBackgroundColor: const Color.fromRGBO(246, 192, 215, 0.9294117647058824),
    appBarTheme: const AppBarTheme(color: Colors.white70),
    iconTheme: const IconThemeData(color: Colors.black87),
  );

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pinkAccent,
      backgroundColor: Color.fromRGBO(114, 46, 73, 0.9294117647058824),
      scaffoldBackgroundColor: Color.fromRGBO(175, 138, 155, 0.9294117647058824),
      appBarTheme: const AppBarTheme(color: Colors.purpleAccent),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(unselectedItemColor: Color.fromRGBO(175, 138, 155, 0.9294117647058824)));

  static final _getStorage = GetStorage();
  static const _themeModeKey = 'isDarkTheme';
  static void saveThemeData(bool isDarkMode) {
    _getStorage.write(_themeModeKey, isDarkMode);
  }

  static ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  static bool _loadThemeFromBox() => _getStorage.read(_themeModeKey) ?? false;
  static _saveThemeToBox(bool isDarkMode) => _getStorage.write(_themeModeKey, isDarkMode);
  static void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
