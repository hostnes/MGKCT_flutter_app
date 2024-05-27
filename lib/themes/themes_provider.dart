import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:work/themes/dark_mode.dart';
import 'package:work/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;
  final String _themeBox = 'settings';
  final String _themeKey = 'themeMode';

  ThemeProvider() : _themeData = lightMode {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  void _loadTheme() async {
    var box = await Hive.openBox(_themeBox);
    String? theme = box.get(_themeKey);
    if (theme == 'dark') {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }

  void toggleTheme() async {
    var box = await Hive.openBox(_themeBox);
    if (_themeData == lightMode) {
      _themeData = darkMode;
      await box.put(_themeKey, 'dark');
    } else {
      _themeData = lightMode;
      await box.put(_themeKey, 'light');
    }
    notifyListeners();
  }
}
