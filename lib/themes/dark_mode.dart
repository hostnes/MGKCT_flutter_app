import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    colorScheme: const ColorScheme.dark(
  background: Color(0xFF242424), // фон
  primary: Color(0xFF0D0D0D), // основные виджеты
  secondary: Color.fromARGB(255, 25, 25, 25), // панель навигации
  inversePrimary: Color.fromARGB(255, 255, 255, 255), // текст
  tertiary: Color(0xFF9DC284), // зеленый
  onTertiary: Color(0xFF8D8D8D), // иконки навигации
));
