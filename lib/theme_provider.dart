import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Enum for theme modes
enum AppThemeMode { light, dark }

// Provider for theme management
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

// Theme Notifier
class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(_lightTheme) {
    _loadThemePreference();
  }

  static final ThemeData _lightTheme = ThemeData.light();
  static final ThemeData _darkTheme = ThemeData.dark();

  AppThemeMode _currentThemeMode = AppThemeMode.light;

  // Load theme preference from SharedPreferences
  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _currentThemeMode = isDarkMode ? AppThemeMode.dark : AppThemeMode.light;
    state = isDarkMode ? _darkTheme : _lightTheme;
  }

  // Toggle between light and dark mode
  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (_currentThemeMode == AppThemeMode.light) {
      _currentThemeMode = AppThemeMode.dark;
      state = _darkTheme;
      prefs.setBool('isDarkMode', true);
    } else {
      _currentThemeMode = AppThemeMode.light;
      state = _lightTheme;
      prefs.setBool('isDarkMode', false);
    }
  }
}
