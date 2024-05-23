import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 237, 237, 237), //фон
    primary: Color.fromARGB(255, 255, 255, 255), //основные виджеты
    secondary: Color.fromARGB(255, 242, 242, 242), //панель навигации
    inversePrimary: Color.fromARGB(255, 0, 0, 0), //текст
    tertiary: Color.fromARGB(255, 157, 194, 132), //зеленый
    onTertiary: Color.fromARGB(255, 115, 115, 115), //иконки навигации
  ),
);
