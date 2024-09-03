import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  // Default theme is dark
  ThemeData _currentTheme = ThemeData.dark();

  // Getter to obtain the current theme
  ThemeData get currentTheme => _currentTheme;

  // Getter to determine if the current theme is dark mode
  bool get isDarkMode => _currentTheme.brightness == Brightness.dark;

  // Method to set a specific theme
  void setTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  // Method to toggle between dark and light theme
  void toggleTheme() {
    _currentTheme = isDarkMode ? ThemeData.light() : ThemeData.dark();
    notifyListeners();
  }
}
