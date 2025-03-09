import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = "theme_mode";
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _themeMode = ThemeMode.light; // Default theme
    init(); // Load saved theme mode
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify UI about theme change
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, mode == ThemeMode.dark);
    _themeMode = mode;
    notifyListeners(); // Notify UI to rebuild with new theme
  }
}
