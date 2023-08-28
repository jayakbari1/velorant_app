import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0XFF0F1923),
    appBarTheme: const AppBarTheme(
      color: Color(0XFF0F1923),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
